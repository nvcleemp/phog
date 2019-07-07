PHOG
====

Planar hypohamiltonian/hypotraceable oriented graphs
====================================================

This repository gives an overview of different scripts and their results used to obtain planar hypohamiltonian oriented graphs (PHHOG) and planar hypotraceable oriented graphs (PHTOG) of all possible orders.

The scripts in this repository make extensive use of programs from different other repositories:

* [directed](https://github.com/nvcleemp/directed)
* [graphtools](https://github.com/nvcleemp/graphtools)
* [plantri](http://users.cecs.anu.edu.au/~bdm/plantri/): we just need the main program `plantri`
* [Nauty](http://pallini.di.uniroma1.it/): we need `directg` and `watercluster2`

In order to run the scripts in this repository you need to compile the programs from these sources and add their location to the PATH variable.

Structure
---------

Below we give an overview of the contents of each of the folders in this repository.

### graphs

As the name suggests this folder contains several sets of graphs. The graphs are encoded in the watercluster format (see below) and have the file extension `wcf`.

Following sets of graphs are available:

* `graphs/paper`: this folder contains all graphs of which an illustration is shown in the paper
* `graphs/planar_hypohamiltonian/planar_hypoham_oriented_n.wcf`: all planar hypohamiltonian oriented graphs on *n* vertices
* `graphs/planar_hypohamiltonian/planar_hypoham_oriented_n-m.wcf`: all planar hypohamiltonian oriented graphs on *n* vertices which have *m* arcs
* `graphs/planar_hypohamiltonian/planar_hypoham_oriented_arcmin_9.wcf`: the only currently known arc-minimal planar hypohamiltonian oriented graph
* `graphs/planar_hypohamiltonian/planar_hypoham_oriented_almostarcmin_n.wcf`: all almost arc-minimal planar hypohamiltonian oriented graphs on *n* vertices 
* `graphs/planar_hypohamiltonian/planar_hypoham_oriented_triang_n.wcf`: all arc-maximal planar hypohamiltonian oriented graphs on *n* vertices
* `graphs/planar_hypotraceable/planar_hypotrac_oriented_n.wcf`: all planar hypotraceable oriented graphs on *n* vertices


### generation

In the folder `generation` we list the programs and commands needed to create all the different types of oriented graphs discussed in the paper. We also provide scripts to run these commands.

Formats
-------

All files with the extension `wcf` are in the watercluster file format. This is a binary code encoding a directed graph. Every item of the code is an unsigned char. The first unsigned char is the number *n* of vertices. The vertices are numbered 1 to *n*. Then the list of vertices *x* for which there is a directed edge 1->*x* follow. This list is ended by a 0. Then the list of outgoing neighbours of 2 follows -- again ended with a 0, etc. The code is complete with the 0 ending the list of outgoing neighbours of the vertex with number *n*.
