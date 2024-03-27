# Topological Data Analysis workshop - 2024

![](images/ebt.png)

This repository will hold all materials necessary to the Topological Data Analysis workshop, which will be presented at the [Encontro Brasileiro de Topologia](https://xxiiiebt.ime.ufba.br/) in July 2024.

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

## Installing Julia

The easiest way to install the Julia language on your system is by [juliaup](https://github.com/JuliaLang/juliaup). I write below the install instructions, as they are now.

### Mac and Linux
Juliaup can be installed on Linux or Mac by executing

```
curl -fsSL https://install.julialang.org | sh
```

### Windows
On Windows Julia and Juliaup can be installed directly from the Windows store [here](https://www.microsoft.com/store/apps/9NJNWW8PVKMN). One can also install exactly the same version by executing

```
winget install julia -s msstore
```

## Installing VSCode (optional)

If you are brave enough, you can always code on the notepad, but I suggest some programming interface. VSCode is a nice code editor with several tools to help coding. Check the instructions [here](https://code.visualstudio.com/).

### Install the Julia extension (optional)

Extensions are small helpers in VSCode with language-specific functionalities. After installing VSCode, install the Julia extension [here](https://code.visualstudio.com/docs/languages/julia).

## Installing the dependencies

In this workshop I use several libraries with functions to deal with TDA, plots, graphs and so on. To easily install all of them, clone this repository and open it with VSCode.

# Summary

In this minicourse, we will explore the practical aspects of Topological Data Analysis using the Julia programming language:

- Quick intro on Julia: basic math and data manipulation, its advantages over other languages like R and Python, how to run code;
- Dealing with data: import and explore datasets from several types of sources like CSV, meshes and images;
- A bit of data science: how to clean data, normalize coordinates, explore and visualize it;
- TDA techniques: create graphs and simplicial complexes, calculate persistent homology, visualize and interpret the Mapper graph, cluster data with ToMATo;
- Machine learning basics: why "pure TDA" is not enough?
- TDA like a pro: Try to reproduce some results found in TDA papers.

The minicourse will be more useful if the attendee be able to run code in its own computer along with the explanations (although this is not a pre-requisite). The complete instructions and code used are available at https://github.com/vituri/TDA_workshop_EBT2024. The material presented is available as a Quarto book at https://vituri.github.io/TDA_workshop_EBT2024/.

# To-do: 

- explain how to source a project with its dependencies;
- create the .qmd files
- export the files also as plain code
- use pluto.jl?
