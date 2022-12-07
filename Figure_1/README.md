## Prediction of harpin secondary structures (Figure 1A): ##

``cat Hairpin_sequences_initial_alleles.fa | RNAfold``

## Small RNA-Seq analysis of heterozygous larvae for initial alleles (Figure 1C): ##

Counting bantam isoform reads for the 4 heterozygous larva libraries:

``./Script_1_prepares_index.sh;for f in TM6_S76_L002_R1_001.fastq.gz m2_S74_L002_R1_001.fastq.gz m27_5_S75_L002_R1_001.fastq.gz m47_7_S73_L002_R1_001.fastq.gz;do ./Script_2_mapping.sh $f;done;echo "Sample Total_number_of_reads Number_of_genome_mappers" > Depths.dat;for sample in `ls mapping_*.log | sed -e 's|mapping_||' -e 's|\.log$||'`;do n1=`head -1 mapping_$sample'.log' | awk '{print $1}'`;n2=`grep '1 time' mapping_$sample'.log' | awk '{s+=$1} END {print s}'`;echo $sample $n1 $n2;done >> Depths.dat;./Script_3.sh``
(resulting files: 'isoforms_bantam_\*.csv')

Measuring sequencing biases on the m2 aliquot spiked-in with large amounts of synthetic RNA oligos:

``./Script_4_spike-in_count.sh``
(resulting file: 'Spike-in_counts.csv')

Plotting bar graph:

``R CMD BATCH R_commands_plot_histograms_Figure_1``
