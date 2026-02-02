#!/bin/bash
#SBATCH -J methylartist_segmeth_retrotector
#SBATCH -n 8
#SBATCH -N 1
#SBATCH -t 2:00:00
#SBATCH --mem=64G
#SBATCH -A csens2024-3-2
#SBATCH -o methylartist_segmeth_retrotector_%j.out
#SBATCH -e methylartist_segmeth_retrotector_%j.err

# Load required modules
module load GCC/11.2.0
module load OpenMPI/4.1.1
module load methylartist/1.2.6

BAM_1="/op_065/1_mapping/pantro6/MN10_WT_Rep1_ontDNA_iPSC_Sandra_chimp_basecalls_5mC_5hmC_panTro6.sorted.bam"
BAM_2="/op_065/1_mapping/pantro6/MN10_WT_Rep1_ontDNA_iPSC_JoC_chimp_basecalls_5mC_5hmC_panTro6.sorted.bam"
#BAM_3="/op_065/1_mapping/pantro6/MN10_WT_Rep1_ontDNA_iPSC_Pt5_chimp_basecalls_5mC_5hmC_panTro6.sorted.bam"
BAM_4="/MN10_ontDNA/1_mapping/panTro6/MN10_WT_Rep1_ontDNA_org_Sandra_chimp_d15_basecalls_5mC_5hmC_panTro6.sorted.bam"
BAM_5="/MN10_ontDNA/1_mapping/panTro6/MN10_WT_Rep1_ontDNA_org_JoC_chimp_d15_basecalls_5mC_5hmC_panTro6.sorted.bam"
INPUT_BED="/PTERV_methylation/resources/retrotector_PTERV1_segmeth.bed"
REFERENCE_GENOME="panTro6.fa"

# Generate segplot input file
methylartist segmeth -b ${BAM_1},${BAM_2},${BAM_4},${BAM_5} -i ${INPUT_BED} --ref ${REFERENCE_GENOME} --motif CG -p 32


