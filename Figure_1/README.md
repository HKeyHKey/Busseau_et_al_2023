## Prediction of harpin secondary structures (Figure 1A): ##

``cat Hairpin_sequences_initial_alleles.fa | RNAfold``

## Small RNA-Seq analysis of heterozygous larvae for initial alleles (Figure 1C): ##

Small RNA-Seq data accession at [NCBI's SRA database](https://www.ncbi.nlm.nih.gov/sra):
* sample "+/+" (fastq file named 'TM6_S76_L002_R1_001.fastq' below): [SRS7497729](https://www.ncbi.nlm.nih.gov/biosample/16402109);
* sample "m2(proximal)/+" (fastq file named 'm2_S74_L002_R1_001.fastq' below): [SRS7497730](https://www.ncbi.nlm.nih.gov/biosample/16402110);
* sample "m2(proximal)/+" with more spike-ins, for sequencing bias correction (fastq file named 'M2_S1_L001_R1_001' below): [SRS7497733](https://www.ncbi.nlm.nih.gov/biosample/16402113);
* sample "m2(distal)/+" (fastq file named 'm27_5_S75_L002_R1_001.fastq' below): [SRS7497731](https://www.ncbi.nlm.nih.gov/biosample/16402111);
* sample "m4/+" (fastq file named 'm47_7_S73_L002_R1_001.fastq' below): [SRS7497732](https://www.ncbi.nlm.nih.gov/biosample/16402112).

Counting bantam isoform reads for the 4 heterozygous larva libraries:

``./Script_1_prepares_index.sh;for f in TM6_S76_L002_R1_001.fastq.gz m2_S74_L002_R1_001.fastq.gz m27_5_S75_L002_R1_001.fastq.gz m47_7_S73_L002_R1_001.fastq.gz;do ./Script_2_mapping.sh $f;done;echo "Sample Total_number_of_reads Number_of_genome_mappers" > Depths.dat;for sample in `ls mapping_*.log | sed -e 's|mapping_||' -e 's|\.log$||'`;do n1=`head -1 mapping_$sample'.log' | awk '{print $1}'`;n2=`grep '1 time' mapping_$sample'.log' | awk '{s+=$1} END {print s}'`;echo $sample $n1 $n2;done >> Depths.dat;./Script_3.sh``
(resulting files: 'isoforms_bantam_\*.csv')

Measuring sequencing biases on the m2 aliquot spiked-in with large amounts of synthetic RNA oligos:

``./Script_4_spike-in_count.sh``
(resulting file: 'Spike-in_counts.csv')

Plotting bar graph:

``R CMD BATCH R_commands_plot_histograms_Figure_1``

Calculating Fisher's exact test p-values:

``R CMD BATCH R_commands_significance_Figure_1``
