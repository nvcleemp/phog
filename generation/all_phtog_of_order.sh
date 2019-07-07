#!/bin/bash

plantri -p -c2 $1 | gconv -f graph6_old | directg_oht_candidates -o | directed_is_hypotraceable -fD > planar_hypotrac_oriented_$1.wcf

