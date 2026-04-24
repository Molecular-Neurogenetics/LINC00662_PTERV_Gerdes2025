#! /bin/bash

# Overlapping genes with a PTERV1
# Names only
bedtools intersect -a ../../annotations/pantro6/pantro6_all_refseq_simple.bed -b retrotector_unique_PTERV1s_segmeth.bed -wa -F 1 | awk '{print $4}' | sort | uniq > pantro6_all_refseq_simple_intersect_PTERV1s.tab
# BED
bedtools intersect -a ../../annotations/pantro6/pantro6_all_refseq_simple.bed -b retrotector_unique_PTERV1s_segmeth.bed -wa -F 1 > pantro6_all_refseq_simple_intersect_PTERV1s.bed
# The ncRNAs or the ones that dont translate to hg38 naming
grep LOC pantro6_all_refseq_simple_intersect_PTERV1s.bed > pantro6_all_refseq_simple_intersect_PTERV1s_renamed_genes.bed

##### Here I stopped and used UCSC liftover from pantro6 to hg38 which resulted on pantro6_all_refseq_simple_intersect_PTERV1s_renamed_genes_lifted_hg38.bed

# Here there is a two step process:
# 1. The names of the genes that DO translate to hg38 naming
# 2. The lifted coordinates of those that DONT intersected with hg38 gencode v38 BED file
echo $(grep -v LOC pantro6_all_refseq_simple_intersect_PTERV1s.tab) $(bedtools intersect -b ../../annotations/human/gencode/v38/gencode.v38.annotation.bed -a pantro6_all_refseq_simple_intersect_PTERV1s_renamed_genes_lifted_hg38.bed -wo | awk '{print $13}' | sort | uniq) > pantro6_all_refseq_simple_intersect_PTERV1s_hg38_overlap.tab
