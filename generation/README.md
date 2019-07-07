Generation of PHOGs
===================

This folder contains instructions on how to generate several classes and examples of planar hypohamiltonian/hypotraceable oriented graphs. This file contains an overview of all necessary commands, and, for your convenience, the folder contains scripts which implement these commands. Note that the commands necessary to split some of the jobs over multiple machines are missing, since they will depend strongly on how you want to run these commands.

## Programs

* The underlying planar graphs were in all cases generated using `plantri`, be it with different parameters.
* In most cases `directg` was used to generate all oriented graphs for a given underlying graph, but in all cases it was augmented with a plugin to not generate certain oriented graphs which clearly cannot be hypohamiltonian (`directg_ohh_candidates`) or hypotraceable (`directg_oht_candidates`) due to degree restrictions.
* For arc-minimal planar hypohamiltonian oriented graphs we use `watercluster2` to generate all oriented graphs for a given underlying graph. This program is in general faster than `directg`, but it does not allow plugins to easily be added. This made it slower for most cases described here. It does allow a maximum indegree and maximum outdegree to be specified, so we could directly use it for the case of arc-minimal PHHOG.
* In order to check the oriented graphs for hypohamiltonicity (resp. hypotraceability) we use `directed_is_hypohamiltonian` (resp. `directed_is_hypotraceable`). 
* The program `gconv` was used to convert between different file formats.
* The program `group_pl` was used in some cases to filter the underlying planar graphs based on their symmetry group.

The commands in the rest of this document assume that all these programs are available and discoverable in the search path of your terminal.

## Commands

### All planar hypohamiltonian oriented graphs

In order to generate all planar hypohamiltonian oriented graphs on *n* vertices, we first generate all 3-connected planar graphs on *n* vertices with minimum degree 4. Then we orient these graphs using `directg` combined with a plugin to filter out orientations that cannot be hypohamiltonian due to degree conditions. Finally we check these oriented graphs for being hypohamiltonian.

Below we give the commands to handle all orders which were exhaustively handled in the paper.

* `plantri -p -c3 -m4  9 | gconv -f graph6_old | directg_ohh_candidates -o | directed_is_hypohamiltonian -fD`
* `plantri -p -c3 -m4 10 | gconv -f graph6_old | directg_ohh_candidates -o | directed_is_hypohamiltonian -fD`
* `plantri -p -c3 -m4 11 | gconv -f graph6_old | directg_ohh_candidates -o | directed_is_hypohamiltonian -fD`
* `plantri -p -c3 -m4 12 | gconv -f graph6_old | directg_ohh_candidates -o | directed_is_hypohamiltonian -fD`
* `plantri -p -c3 -m4 13 | gconv -f graph6_old | directg_ohh_candidates -o | directed_is_hypohamiltonian -fD`
* `plantri -p -c3 -m4 14 | gconv -f graph6_old | directg_ohh_candidates -o | directed_is_hypohamiltonian -fD`
* `plantri -p -c3 -m4 15 | gconv -f graph6_old | directg_ohh_candidates -o | directed_is_hypohamiltonian -fD`

### All planar hypotraceable oriented graphs

In order to generate all planar hypotraceable oriented graphs on *n* vertices, we first generate all 2-connected planar graphs on *n* vertices but bound the generation to only obtain the graphs containing at most two vertices with a degree less than 4. Then we orient these graphs using `directg` combined with a plugin to filter out orientations that cannot be hypotraceable due to degree conditions. Finally we check these oriented graphs for being hypotraceable.

Below we give the commands to handle all orders which were exhaustively handled in the paper.

* `plantri_oht -p -c2 10 | gconv -f graph6_old | directg_oht_candidates -o | directed_is_hypotraceable -fD`
* `plantri_oht -p -c2 11 | gconv -f graph6_old | directg_oht_candidates -o | directed_is_hypotraceable -fD`
* `plantri_oht -p -c2 12 | gconv -f graph6_old | directg_oht_candidates -o | directed_is_hypotraceable -fD`
* `plantri_oht -p -c2 13 | gconv -f graph6_old | directg_oht_candidates -o | directed_is_hypotraceable -fD`

### Arc-minimal planar hypohamiltonian oriented graphs

In order to generate all arc-minimal planar hypohamiltonian oriented graphs on *n* vertices, we first generate all 3-connected planar quadrangulations on *n+2* vertices and output the duals of these graphs (i.e. 3-connected quartic graphs). Then we orient these graphs using `watercluster2` where we give an upper bound for both the indegree and the outdegree (which immediately implies the same lower bound for both degrees). Finally we check these oriented graphs for being hypohamiltonian.

Below we give the commmand to find all arc-minimal planar hypohamiltonian oriented graphs of order 9.

`plantri -q -d 11 | gconv -f graph6_old | watercluster2 i2 o2 B S | directed_is_hypohamiltonian -f`

### Almost arc-minimal planar hypohamiltonian oriented graphs and planar hypohamiltonian oriented graphs with few arcs

In order to generate all almost arc-minimal planar hypohamiltonian oriented graphs on *n* vertices, we first generate all 3-connected planar graphs on *n* vertices with *2n+1* edges. Then we orient these graphs using `directg` combined with a plugin to filter out orientations that cannot be hypohamiltonian due to degree conditions. Finally we check these oriented graphs for being hypohamiltonian.

Below we give the commands to generate the almost arc-minimal planar hypohamiltonian oriented graphs on 9 vertices and on 15 vertices.

* `plantri -p -c3 -m4 -e19 9 | gconv -f graph6_old | directg_ohh_candidates -o | directed_is_hypohamiltonian -fD`
* `plantri -p -c3 -m4 -e31 15 | gconv -f graph6_old | directg_ohh_candidates -o | directed_is_hypohamiltonian -fD`

We can use similar commands to generate other planar hypohamiltonian oriented graphs with few arcs. Below is an example of a command to generate all planar hypohamiltonian oriented graphs on 15 vertices with 32 arcs.

`plantri -p -c3 -m4 -e32 15 | gconv -f graph6_old | directg_ohh_candidates -o | directed_is_hypohamiltonian -fD`

### Arc-maximal planar hypohamiltonian oriented graphs

In order to generate all arc-maximal planar hypohamiltonian oriented graphs on *n* vertices, we first generate all 3-connected planar triangulations on *n* vertices with minimum degree 4. Then we orient these graphs using `directg` combined with a plugin to filter out orientations that cannot be hypohamiltonian due to degree conditions. Finally we check these oriented graphs for being hypohamiltonian.

Below we give the commands to handle all orders which were exhaustively handled in the paper.

* `plantri -c3 -m4  9 | gconv -f graph6_old | directg_ohh_candidates -o | directed_is_hypohamiltonian -fD`
* `plantri -c3 -m4 10 | gconv -f graph6_old | directg_ohh_candidates -o | directed_is_hypohamiltonian -fD`
* `plantri -c3 -m4 11 | gconv -f graph6_old | directg_ohh_candidates -o | directed_is_hypohamiltonian -fD`
* `plantri -c3 -m4 12 | gconv -f graph6_old | directg_ohh_candidates -o | directed_is_hypohamiltonian -fD`
* `plantri -c3 -m4 13 | gconv -f graph6_old | directg_ohh_candidates -o | directed_is_hypohamiltonian -fD`
* `plantri -c3 -m4 14 | gconv -f graph6_old | directg_ohh_candidates -o | directed_is_hypohamiltonian -fD`
* `plantri -c3 -m4 15 | gconv -f graph6_old | directg_ohh_candidates -o | directed_is_hypohamiltonian -fD`

In the paper we also sample some larger orders. Since we were interested in showing pictures of the resulting graphs, we only generated those with the highest symmetry. We did this by first generating all 4-connected planar triangulations on *n* vertices with minimum degree 4. Next we filter out the graphs which have a trivial symmetry group as well as some other smaller symmetry groups. Then we orient these graphs using `directg` combined with a plugin to filter out orientations that cannot be hypohamiltonian due to degree conditions. Finally we check these oriented graphs for being hypohamiltonian.

Below are the commands which we used to sample the arc-maximal planar hypohamiltonian oriented graphs on 16 vertices.

* `plantri -c4 16 | group_pl -f C1 C2 C1h S2 -i | gconv -f graph6_old | directg_ohh_candidates -o | directed_is_hypohamiltonian -fD`

### Planar hypohamiltonian oriented graphs without quartic vertices

In order to generate all planar hypohamiltonian oriented graphs on *n* vertices with minimum degree 5, we first generate all 3-connected planar graphs on *n* vertices with minimum degree 5. Then we orient these graphs using `directg` combined with a plugin to filter out orientations that cannot be hypohamiltonian due to degree conditions. Finally we check these oriented graphs for being hypohamiltonian.

Below we give the command to generate all these graphs on 15 vertices.

`plantri -p -c3 -m5 15 | gconv -f graph6_old | directg_ohh_candidates -o | directed_is_hypohamiltonian -fD`


