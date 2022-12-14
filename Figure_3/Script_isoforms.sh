#!/bin/bash

for sample in `tail -n +2 Depths.dat | awk '{print $1}'`
do depth=`awk '$1=="'$sample'" {print $3}' Depths.dat`
   for allele in wt m2 m6
   do case "$allele" in "wt") seq=GATCATTTTGAAAGCTG;;
                        "m2") seq=AAATATTTTGAAAGCTG;;
			"m6") seq=ACTAATTTTGAAAGCTG;;
      esac
      grep -E '\s[ATGC]{0,6}'$seq'[ATGC]{0,6}\s' Mapping_$sample'.sam' | awk '{print $10}' | sort | uniq -c | sort -k1 -n -r | awk '{OFS=",";print $1/('$depth'/1000000),$2}'> isoforms_bantam_$allele'_'$sample'.csv'
   done
done
