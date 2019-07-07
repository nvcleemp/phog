#!/bin/bash

order=$1
arccount=$2

plantri -p -c3 -m4 -e$arccount  $order | gconv -f graph6_old | directg_ohh_candidates -o | directed_is_hypohamiltonian -fD > planar_hypoham_oriented_$order-$arccount.wcf

