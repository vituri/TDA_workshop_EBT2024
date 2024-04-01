# https://juliageometry.github.io/MeshesDocs/stable/geometries/primitives.html

using Meshes, GeoIO
import GLMakie as gl
import DelimitedFiles
using ProgressMeter

using Graphs, SimpleWeightedGraphs
using MetricSpaces, Ripserer, PersistenceDiagrams
using Chain

# functions
function reduz_obj(arquivo, n_points=1000)
    geotable = GeoIO.load(arquivo)

    X_total = geotable.vertices .|> coordinates .|> Vector |> EuclideanSpace

    ids = farthest_points_sample(X_total, n_points)
    X = X_total[ids]

    arquivo_novo = replace(arquivo, ".obj" => ".csv")
    DelimitedFiles.writedlm(arquivo_novo, stack(X)' |> Matrix, ",")

    X
end

function meshes_to_csv(dir_path)
    for (root, dirs, files) ∈ collect(walkdir(dir_path))
        for file ∈ files
            if occursin(".obj", file)
                arquivo = joinpath(root, file)
                println(arquivo)
                reduz_obj(arquivo)
            end
        end
    end
end

read_mesh(arquivo) = GeoIO.load(arquivo).geometry

function mesh_to_graph(ms, X)
    g = SimpleWeightedGraph()
    n = length(X)
    add_vertices!(g, n)

    triangles = ms.topology.connec

    @showprogress desc = "Adding vertices to graph..." for t ∈ triangles
        v1, v2, v3 = t.indices
        add_edge!(g, v1, v2, dist_euclidean(X[v1], X[v2]))

        add_edge!(g, v1, v3, dist_euclidean(X[v1], X[v3]))

        add_edge!(g, v2, v3, dist_euclidean(X[v2], X[v3]))
    end

    g
end

mesh_to_metric_space(ms) = ms.vertices .|> coordinates .|> Vector |> EuclideanSpace

function geodesic_distance_from_graph(g, ids)
    n = length(ids)
    D = zeros(n, n)

    @showprogress desc = "Calculating geodesic distance..." Threads.@threads for (i, id) ∈ collect(enumerate(ids))
        dts = dijkstra_shortest_paths(g, id)
        D[i, :] = dts.dists[ids]
    end

    return D
end

plot_mesh(ms) = viz(ms)


# ----------------------
# script
ms = read_mesh("meshes/flamingo-poses/flam-01.obj")
# ms = GeoIO.load("meshes/flamingo-poses/flam-01.obj")

plot_mesh(ms)


# componentes
function barcode_from_mesh(ms, n_points=1000)
    X_total = mesh_to_metric_space(ms)

    g = mesh_to_graph(ms, X_total)

    componentes_g = connected_components(g)
    ids_maior_componente = componentes_g[findmax(length, componentes_g)[2]]

    X_total = X_total[ids_maior_componente]

    g = g[ids_maior_componente]


    fts_sample = farthest_points_sample(X_total, n_points)
    X = X_total[fts_sample]
    D = geodesic_distance_from_graph(g, fts_sample)

    # force simmetry on X
    for i ∈ 1:n_points
        for j ∈ i:n_points
            D[i, j] = D[j, i]
        end
    end

    max_dist = maximum(D)
    D = D ./ max_dist

    pd = ripserer(D, dim_max = 2, verbose=true, sparse = true, threshold = 0.9)

    pd, D, X, g

end

pd, D, X, g = barcode_from_mesh(ms, 300)

exc = mapslices(sum, D, dims=2) |> vec

gl.scatter(X, color=exc)

import Plots
Plots.plot(pd)
barcode(pd)

# calcula pds

function list_files(path="", pattern="")
    files =
        @chain begin
            map(walkdir(path)) do (root, dirs, files)
                joinpath.(root, files)
            end
            reduce(vcat, _)
            filter(x -> occursin(pattern, x), _)
        end

    files
end

arquivos = list_files("meshes/", ".obj")

arquivos = arquivos[1:5:80]

analises =
    @showprogress desc="lendo arquivo..." map(arquivos) do file
        ms = read_mesh(file)
        pd, D, X, g = barcode_from_mesh(ms)
    end

analises[1]
barcode(analises[1][1])











arquivos = [
    "meshes/flamingo-poses/flam-01.obj"
    ,"meshes/elephant-poses/elephant-01.obj"
]

analises = map(arquivos) do f
    ms = read_mesh(f)
    barcode_from_mesh(ms, 350)
end

pd, D, X, g = analises[1]
exc = mapslices(sum, D, dims=2) |> vec
gl.scatter(X, color=exc)
barcode(pd)

pd, D, X, g = analises[2]
exc = mapslices(sum, D, dims=2) |> vec
gl.scatter(X, color=exc)
barcode(pd)

Bottleneck()(analises[1][1][2:3], analises[2][1][2:3])