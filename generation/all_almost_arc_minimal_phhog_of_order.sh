#!/bin/bash

order=$1
plantri -p -c3 -m4 -e$(( 2*order+1 )) $order | gconv -f graph6_old | directg_ohh_candidates -o | directed_is_hypohamiltonian -fD > planar_hypoham_oriented_almostarcmin_$order.wcf

