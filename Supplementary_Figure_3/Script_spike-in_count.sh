#!/bin/sh

sample=$1

echo "Strategy wt_spike_count m2_spike_count m6_spike_count" > Spike-in_counts_sample_$sample'.txt'
wt=`sed '1,/^@PG\t/ d' ../Mapping_$sample'.sam'| grep -c 'r25_Spike-in'`
m2=`sed '1,/^@PG\t/ d' ../Mapping_$sample'.sam'| grep -c 'r26_Spike-in'`
m6=`sed '1,/^@PG\t/ d' ../Mapping_$sample'.sam'| grep -c 'r64_Spike-in'`
echo "Hisat2_mapping "$wt $m2 $m6 >> Spike-in_counts_sample_$sample'.txt'
wt=`grep -c '^TGAGATCATTCGCAAAGCTGATT$' ../adapter-trimmed_$sample'.fastq'`
m2=`grep -c '^TCAAAATATTCGCAAAGCTGATT$' ../adapter-trimmed_$sample'.fastq'`
m6=`grep -c '^TCCACTAATTCGCAAAGCTGATT$' ../adapter-trimmed_$sample'.fastq'`
echo "Grep_full-length "$wt $m2 $m6 >> Spike-in_counts_sample_$sample'.txt'
wt=`grep -c 'GATCATTCGCAAAGCTG' ../adapter-trimmed_$sample'.fastq'`
m2=`grep -c 'AAATATTCGCAAAGCTG' ../adapter-trimmed_$sample'.fastq'`
m6=`grep -c 'ACTAATTCGCAAAGCTG' ../adapter-trimmed_$sample'.fastq'`
echo "Grep_with_isoforms "$wt $m2 $m6 >> Spike-in_counts_sample_$sample'.txt'
