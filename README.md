# Topological Data Analysis workshop - 2024

![](images/ebt.png)

This repository will hold all materials necessary to the Topological Data Analysis workshop, which will be presented at the [Encontro Brasileiro de Topologia](https://xxiiiebt.ime.ufba.br/) (Brazilian Topology Meeting) in July 2024.

## Goals

At the end of this minicourse, you (hopefully) will be able to:

- Explore Julia and its ecosystem;
- Load and analyze datasets;
- Apply some TDA techniques side-by-side with other machine learning methods;
- Create classifiers or clusters of the original data.

My main goal with this course is to spark more interest in the *applied* part of TDA, and create more projects with students to code more and do more data analysis.

Remember: 

> 2 thirds of TDA is data analysis!

# Instructions: how to use this repository

## Installing Julia and running code

The best way to install Julia, VSCode and getting started is following the excellent [Modern Julia Workflows](https://modernjuliaworkflows.org/).

In short:

- Install Julia;
- Install VSCode;
- Install the Julia VSCode extension;
- Write some code on VSCode;
- Run it with `Shift + Enter`.

That's it!

## Installing the dependencies of this project

In this workshop I use several libraries with functions to deal with TDA, plots, graphs and so on. To easily install all of them, clone this repository and open it with VSCode.

Then run any Julia code so you start the Julia REPL at the below panel. Then, type

```
] activate .
```

This will install all dependencies.

# Summary

In this minicourse, we will explore the practical aspects of Topological Data Analysis using the Julia programming language and try to cover the following topics:

- Quick intro on Julia: basic math and data manipulation, its advantages over other languages like R and Python, how to run code;
- Dealing with data: import and explore datasets from several types of sources like CSV, meshes and images;
- A bit of data science: how to clean data, normalize coordinates, explore and visualize it;
- TDA techniques: create graphs and simplicial complexes, calculate persistent homology, visualize and interpret barcodes and the Mapper graph, cluster data with ToMATo;
- Machine learning basics: why "pure TDA" is not enough? Classifiers and regression problems.
- TDA like a pro: Try to reproduce some results found in famous TDA papers.

The minicourse will be more useful if the attendee is able to run code in its own computer along with the explanations (although this is not a prerequisite). The complete instructions and code used are available at https://github.com/vituri/TDA_workshop_EBT2024. The material presented is available as a Quarto book at https://vituri.github.io/TDA_workshop_EBT2024/.

# To-do: 

- explain how to source a project with its dependencies;
- create the .qmd files
- export the files also as plain code
