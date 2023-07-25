## Counting spike-in reads in each library: ##

With 3 distinct methods:
* counting reads mapping on spike-in oligos, from the hisat2 mapping outputs (where Small RNA-Seq libraries have been mapped on the Drosophila genome supplemented with mutant hairpin sequences and with spike-in oligo sequences; see [instructions for Figure 4](https://github.com/HKeyHKey/Busseau_et_al_2023/tree/main/Figure_4)) (method named "Hisat2_mapping");
* counting full-length spike-in oligo reads directly from the fastq files (method named "Grep_full-length");
* counting reads starting with the first 17 nt of spike-in oligo sequences, directly from the fastq files (method named "Grep_with_isoforms").

Implementation:

``for sample in TM6-1 TM6-3 m2-1 m2-3 m6-1 m6-2 m6-3 md-1 md-2 md-3;do ./Script_spike-in_count.sh $sample;done;echo "Sample,Strategy,wt_spike_count,m2_spike_count,m6_spike_count" > Spike-in_counts.csv;for sample in TM6-1 TM6-3 m2-1 m2-3 m6-1 m6-2 m6-3 md-1 md-2 md-3;do tail -n +2 Spike-in_counts_sample_$sample'.txt' | sed 's| |,|g';done >> Spike-in_counts.csv``

## Tracing scatter plots and computing correlation: ##

Data shown in the article's Supplementary Figure 3 use the "Grep_full-length" method. Implementation:

``R CMD BATCH R_commands_spike-in_reproducibility``
