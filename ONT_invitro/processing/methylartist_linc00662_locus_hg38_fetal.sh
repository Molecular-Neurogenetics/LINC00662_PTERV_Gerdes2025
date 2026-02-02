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
BAM_1="/op_065/1_mapping/hg38/MN10_Control_w11_Rep1_ontDNA_fetal_human_basecalls_5mC_5hmC_hg38.sorted.bam"
BAM_2="/op_065/1_mapping/hg38/MN10_Control_w7_Rep1_ontDNA_fetal_human_basecalls_5mC_5hmC_hg38.sorted.bam"
#ANNOTATION_FILE="hg38.ncbiRefSeq.sorted.gtf.gz"
ANNOTATION_FILE="gencode.v46.annotation.sorted.gtf.gz"
REFERENCE_GENOME="hg38.fa"

# +/- 10kb adjusted to chimp locus size (30364 bp)
methylartist locus -b ${BAM_2}:#94b3d1,${BAM_1}:#c1c8e8 -i chr19:27777035-27807399 -g ${ANNOTATION_FILE} -p 1,8,1,1,2 --ref ${REFERENCE_GENOME} --motif CG -m m --labelgenes --svg
