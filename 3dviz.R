library("readobj")
library(rgl)

arquivo = 'meshes/camel-poses/camel-reference.obj'
open3d(); wire3d(readOBJ(arquivo))

arquivo = 'meshes/cat-poses/cat-reference.obj'
open3d(); wire3d(readOBJ(arquivo))

arquivo = 'meshes/cat-poses/cat-02.obj'
open3d(); wire3d(readOBJ(arquivo))

arquivo = 'meshes/cat-poses/cat-04.obj'
open3d(); wire3d(readOBJ(arquivo))
