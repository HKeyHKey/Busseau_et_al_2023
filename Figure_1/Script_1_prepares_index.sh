#!/bin/sh

### Download and un-archive the dm6 genome assembly:
wget http://hgdownload.soe.ucsc.edu/goldenPath/dm6/bigZips/dm6.fa.gz
gunzip dm6.fa.gz

### Append spike-in oligo sequences and mutant hairpin sequences:
cp dm6.fa dm6_extended.fa 
echo '>r25
TGAGATCATTCGCAAAGCTGATT
>r26
TCAAAATATTCGCAAAGCTGATT
>m2
ATTTGACTACGAAACCGGTTTTCGATTTATTTTCACTGTTTTTCATACAAGTCAAAATATTTTGAAAGCTGATTTTGTCAA
>m47
ATTTGACTACGAAATCGGTTTTCGATTTATTTTCACTGTTTTTCATACAAGTCAAAATATTTTGAAAGCTGATTTTGTCAA' >> dm6_extended.fa

### Build hisat2 index:
hisat2-build -f dm6_extended.fa dm6_extended
