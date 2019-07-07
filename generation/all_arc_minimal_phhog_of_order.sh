#!/bin/bash

order=$1
plantri -q -d $(( order+2 )) | gconv -f graph6_old | watercluster2 i2 o2 B S | directed_is_hypohamiltonian -f > planar_hypoham_oriented_arcmin_$order.wcf

