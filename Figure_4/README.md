## Prediction of harpin secondary structures (Figure 4A): ##

``cat Hairpin_sequence_final_allele.fa | RNAfold``

## Measuring and displaying bantam isoform abundance (corrected for sequencing biases for full-length isoforms) (Figure 4B): ##

From the dm6 Drosophila genome assembly (see download details in 'Script_1_prepares_index.sh' in [scripts for Figure 1](https://github.com/HKeyHKey/Busseau_et_al_2023/tree/main/Figure_1)): appending spike-in and mutant hairpin sequences, then building a hisat2 index:

``cp dm6.fa Spike-in_supplemented_dm6.fa;sed -e '/^>/ s| ||1' -e '/^>/ s| |_|1' -e '/^>/ s| .*||' -e '/^>/ !s|^P-||' -e '/^>/ !s|U|T|g' Spike-ins.fa >> Spike-in_supplemented_dm6.fa;cat Mutant_hairpins.fa >> Spike-in_supplemented_dm6.fa;hisat2-build -f Spike-in_supplemented_dm6.fa Spike-in_supplemented_dm6``

Data accession at [NCBI's SRA database](https://www.ncbi.nlm.nih.gov/sra):
* sample "+/+, replic. 1" (fastq file named 'TM6_S76_L002_R1_001.fastq' below): [SRS7497729](https://www.ncbi.nlm.nih.gov/biosample/16402109);
* sample "m2(proximal)/+" (fastq file named 'm2_S74_L002_R1_001.fastq' below): [SRS7497730](https://www.ncbi.nlm.nih.gov/biosample/16402110);
* sample "m2(proximal)/+" with more spike-ins, for sequencing bias correction (fastq file named 'M2_S1_L001_R1_001' below): [SRS7497733](https://www.ncbi.nlm.nih.gov/biosample/16402113);
* sample "m2(distal)/+" (fastq file named 'm27_5_S75_L002_R1_001.fastq' below): [SRS7497731](https://www.ncbi.nlm.nih.gov/biosample/16402111);
* sample "m4/+" (fastq file named 'm47_7_S73_L002_R1_001.fastq' below): [SRS7497732](https://www.ncbi.nlm.nih.gov/biosample/16402112).


3´ adapter trimming, then mapping on the supplemented genome, measuring sequencing depth and counting bantam isoform abundance:

``for f in `ls *.fastq`;do sample=`echo $f | sed 's|_.*||'`;./Script_mapping.sh $f 2 > mapping_$sample'.log';done;echo "Sample Total_number_of_reads Number_of_genome_mappers" > Depths.dat;for sample in `ls mapping_*.log | sed -e 's|mapping_||' -e 's|\.log$||'`;do n1=`head -1 mapping_$sample'.log' | awk '{print $1}'`;n2=`grep '1 time' mapping_$sample'.log' | awk '{s+=$1} END {print s}'`;echo $sample $n1 $n2;done >> Depths.dat;./Script_isoforms.sh``
(resulting files: 'isoforms\_bantam\_\*.csv')

Counting spike-in reads:

``echo "Strategy wt_spike_count m2_spike_count m6_spike_count" > Spike-in_counts.txt;for sample in `ls mapping_*.log | sed -e 's|mapping_||' -e 's|\.log$||'`;do ./Script_spike-in_count.sh $sample;done >> Spike-in_counts.txt;sed 's| |,|g' Spike-in_counts.txt > Spike-in_counts.csv``

Plotting bar graph:

``R CMD BATCH R_commands_final_alleles_from_Sophie``
(resulting files: 'Barplot\_\*\_miRNA.pdf')
