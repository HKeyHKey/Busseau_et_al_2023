#!/bin/bash

file=$1
sample=`echo $file | sed 's|_.*||'`
cutadapt -a NNNNTGGAATTCTCGGGTGCCAAGGAACTCCAGTCAC -u 4 -m 18 -M 30 -o adapter-trimmed_$sample'.fastq' $file
hisat2 --no-unal -x Spike-in_supplemented_dm6 -U adapter-trimmed_$sample'.fastq' -S Mapping_$sample'.sam'
