#!/bin/sh

if test "$1" = ""
then echo "Please enter input file name (e.g., TM6_S76_L002_R1_001.fastq.gz)."
     read input
else input=$1
fi

sample=`echo $input | sed -e 's|_.*||'` # Make sure that your file naming system is compatible with that (here basically we'll consider that the sample name is the input file name, stripped from its first "_" character and everything downstream)
uncompressed=`echo $input | sed 's|\.gz$||'`
gunzip $input
cutadapt -a NNNNTGGAATTCTCGGGTGCCAAGGAACTCCAGTCAC -u 4 -m 18 -M 30 -o adapter-trimmed_$sample'.fastq' $uncompressed
hisat2 -x dm6_extended -U adapter-trimmed_$sample'.fastq' -S Mapping_$sample'.sam' --un Unmapping_$sample'.fastq' 2> mapping_$sample'.log'

