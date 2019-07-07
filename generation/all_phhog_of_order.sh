#!/bin/bash

plantri -p -c3 -m4  $1 | gconv -f graph6_old | directg_ohh_candidates -o | directed_is_hypohamiltonian -fD > planar_hypoham_oriented_$1.wcf

