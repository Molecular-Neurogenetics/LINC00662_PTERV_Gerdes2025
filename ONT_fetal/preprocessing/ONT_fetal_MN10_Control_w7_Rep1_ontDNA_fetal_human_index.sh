#!/bin/bash
#SBATCH -J index_bam_fetal_w7
#SBATCH -n 8
#SBATCH -N 1
#SBATCH -t 1:00:00
#SBATCH --mem=30G
#SBATCH -A csens2024-3-2
#SBATCH -o index_bam_fetal_w7_%j.out
#SBATCH -e index_bam_fetal_w7_%j.err

# Load required modules
module load GCC/12.3.0
module load SAMtools/1.18

# Indexing the sorted BAM file
samtools index /path/to/results/backup/op_065/1_mapping/hg38/MN10_Control_w7_Rep1_ontDNA_fetal_human_basecalls_5mC_5hmC_hg38.sorted.bam
