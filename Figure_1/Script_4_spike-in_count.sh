#!/bin/bash

gunzip M2_S1_L001_R1_001.fastq.gz
sample=M2_high_spike-ins
cutadapt -a NNNNTGGAATTCTCGGGTGCCAAGGAACTCCAGTCAC -u 4 -m 18 -M 30 -o adapter-trimmed_$sample'.fastq' M2_S1_L001_R1_001.fastq

wt=`grep -c '^TGAGATCATTCGCAAAGCTGATT$' adapter-trimmed_$sample'.fastq'`
mut=`grep -c '^TCAAAATATTCGCAAAGCTGATT$' adapter-trimmed_$sample'.fastq'`
wt2=`grep -c 'GATCATTCGCAAAGCTG' adapter-trimmed_$sample'.fastq'`
mut2=`grep -c 'AAATATTCGCAAAGCTG' adapter-trimmed_$sample'.fastq'`
echo "Strategy wt_spike_count mut_spike_count" > Spike-in_counts.txt
echo "Full-length "$wt $mut >> Spike-in_counts.txt
echo "With_isoforms "$wt2 $mut2 >> Spike-in_counts.txt
sed 's| |,|g' Spike-in_counts.txt > Spike-in_counts.csv
