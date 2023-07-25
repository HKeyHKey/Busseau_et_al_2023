## Counting bantam and bantam* reads in each library: ##

Starting from hisat2 mapping outputs (as described in the [instructions for Figure 4](https://github.com/HKeyHKey/Busseau_et_al_2023/tree/main/Figure_4)):

``for sample in `ls Mapping_* | sed -e 's|Mapping_||' -e 's|.sam$||'`;do ./Script_bantam_count.sh $sample > out_$sample'.out';done;
echo "Sample wt_bantam m2_bantam m6_bantam wt_bantamstar m2_bantamstar m6_bantamstar wt_spike m2_spike m6_spike" > Counts.dat
for sample in `ls Mapping_* | sed -e 's|Mapping_||' -e 's|.sam$||'`;do cat out_$sample'.out';done >> Counts.dat``

## Plotting histograms: ##

``R CMD BATCH R_commands_bantam_vs_bantamstar``
