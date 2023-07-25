## Counting bantam and bantma* reads in each library: ##

Starting from hisat2 mapping outputs (as described in 
``for sample in `ls Mapping_* | sed -e 's|Mapping_||' -e 's|.sam$||'`;do ./Script_bantam_count.sh $sample;done
