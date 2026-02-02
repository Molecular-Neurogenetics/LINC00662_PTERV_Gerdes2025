#!/bin/bash
#SBATCH -J methylartist_locus_linc00662
#SBATCH -n 8
#SBATCH -N 1
#SBATCH -t 0:30:00
#SBATCH --mem=8G
#SBATCH -A csens2024-3-2
#SBATCH -o methylartist_locus_linc00662_%j.out
#SBATCH -e methylartist_locus_linc00662_%j.err

# Load required modules
module load GCC/11.2.0
module load OpenMPI/4.1.1
module load methylartist/1.2.6

# Define variables
BAM_3="/op_065/1_mapping/hg38/MN10_WT_Rep1_ontDNA_iPSC_hiPS6_human_basecalls_5mC_5hmC_hg38.sorted.bam"
BAM_4="/op_065/1_mapping/hg38/MN10_WT_Rep1_ontDNA_iPSC_hiPS10_human_basecalls_5mC_5hmC_hg38.sorted.bam"
BAM_5="/MN10_ontDNA/1_mapping/hg38/MN10_WT_Rep1_ontDNA_org_hiPS6_human_d15_basecalls_5mC_5hmC_hg38.sorted.bam"
BAM_6="/MN10_ontDNA/1_mapping/hg38/MN10_WT_Rep1_ontDNA_org_hiPS10_human_d15_basecalls_5mC_5hmC_hg38.sorted.bam"
ANNOTATION_FILE="gencode.v46.annotation.sorted.gtf.gz"
REFERENCE_GENOME="hg38.fa"

# +/- 10kb
#methylartist locus -b ${BAM_1},${BAM_2},${BAM_3},${BAM_4},${BAM_5},${BAM_6},${BAM_7} -i chr19:27780493-27803940 -g ${ANNOTATION_FILE} -p 1,8,1,1,2 --ref ${REFERENCE_GENOME} --motif CG -m m --labelgenes --svg

# +/- 10kb adjusted to chimp locus size (30364 bp)
methylartist locus -b ${BAM_4}:#ced4d8,${BAM_3}:#bacee2,${BAM_6}:#b8cbd8,${BAM_5}:#aac7e0 -i chr19:27777035-27807399 -g ${ANNOTATION_FILE} -p 1,8,1,1,2 --ref ${REFERENCE_GENOME} --motif CG -m m --labelgenes --svg
