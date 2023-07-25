#!/bin/sh

sample=$1

### Below: counting perfect hits for wt and mutant miRNAs and wt and mutant spike-ins:
wt_miRNA=`sed '1,/^@PG\t/ d' Mapping_$sample'.sam' | awk -F '\t' '$3=="chr3L" && $4==642259 {print}' | awk -F '\t' '$6~/^[0-9]*M$/ {print}' | grep -P '\tMD:Z:[0-9]*\t' | wc -l`
m2_miRNA=`sed '1,/^@PG\t/ d' Mapping_$sample'.sam' | awk -F '\t' '$3=="m2" && $4==52 {print}' | awk -F '\t' '$6~/^[0-9]*M$/ {print}' | grep -P '\tMD:Z:[0-9]*\t' | wc -l`
m6_miRNA=`sed '1,/^@PG\t/ d' Mapping_$sample'.sam' | awk -F '\t' '$3=="m6" && $4==52 {print}' | awk -F '\t' '$6~/^[0-9]*M$/ {print}' | grep -P '\tMD:Z:[0-9]*\t' | wc -l`
wt_miRNAstar=`sed '1,/^@PG\t/ d' Mapping_$sample'.sam' | awk -F '\t' '$3=="chr3L" && $4==642222 {print}' | awk -F '\t' '$6~/^[0-9]*M$/ {print}' | grep -P '\tMD:Z:[0-9]*\t' | wc -l`
m2_miRNAstar=`sed '1,/^@PG\t/ d' Mapping_$sample'.sam' | awk -F '\t' '$3=="m2" && $4==15 {print}' | awk -F '\t' '$6~/^[0-9]*M$/ {print}' | grep -P '\tMD:Z:[0-9]*\t' | wc -l`
m6_miRNAstar=`sed '1,/^@PG\t/ d' Mapping_$sample'.sam' | awk -F '\t' '$3=="m6" && $4==15 {print}' | awk -F '\t' '$6~/^[0-9]*M$/ {print}' | grep -P '\tMD:Z:[0-9]*\t' | wc -l`
wt_spike=`sed '1,/^@PG\t/ d' Mapping_$sample'.sam' | awk -F '\t' '$3=="r25_Spike-in" {print}' | awk -F '\t' '$6~/^[0-9]*M$/ {print}' | grep -P '\tMD:Z:[0-9]*\t' | wc -l`
m2_spike=`sed '1,/^@PG\t/ d' Mapping_$sample'.sam' | awk -F '\t' '$3=="r26_Spike-in" {print}' | awk -F '\t' '$6~/^[0-9]*M$/ {print}' | grep -P '\tMD:Z:[0-9]*\t' | wc -l`
m6_spike=`sed '1,/^@PG\t/ d' Mapping_$sample'.sam' | awk -F '\t' '$3=="r64_Spike-in" {print}' | awk -F '\t' '$6~/^[0-9]*M$/ {print}' | grep -P '\tMD:Z:[0-9]*\t' | wc -l`
### Above: counting perfect hits for wt and mutant miRNAs and wt and mutant spike-ins

echo $sample $wt_miRNA $m2_miRNA $m6_miRNA $wt_miRNAstar $m2_miRNAstar $m6_miRNAstar $wt_spike $m2_spike $m6_spike
