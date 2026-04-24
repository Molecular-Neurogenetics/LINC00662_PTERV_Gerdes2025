#!/bin/bash
#SBATCH -J methylartist_composite_retrotector
#SBATCH -n 8
#SBATCH -N 1
#SBATCH -t 1:00:00
#SBATCH --mem=64G
#SBATCH -A csens2024-3-2
#SBATCH -o methylartist_composite_retrotector_%j.out
#SBATCH -e methylartist_composite_retrotector_%j.err

# Load required modules
module load GCC/11.2.0
module load OpenMPI/4.1.1
module load scikit-bio/0.5.7
module load methylartist/1.2.6

BAM_1="/op_065/1_mapping/pantro6/MN10_WT_Rep1_ontDNA_iPSC_Sandra_chimp_basecalls_5mC_5hmC_panTro6.sorted.bam"
BAM_2="/op_065/1_mapping/pantro6/MN10_WT_Rep1_ontDNA_iPSC_JoC_chimp_basecalls_5mC_5hmC_panTro6.sorted.bam"
BAM_3="/MN10_ontDNA/1_mapping/panTro6/MN10_WT_Rep1_ontDNA_org_Sandra_chimp_d15_basecalls_5mC_5hmC_panTro6.sorted.bam"
BAM_4="/MN10_ontDNA/1_mapping/panTro6/MN10_WT_Rep1_ontDNA_org_JoC_chimp_d15_basecalls_5mC_5hmC_panTro6.sorted.bam"
INPUT_BED="/PTERV_methylation/resources/retrotector_unique_PTERV1s_segmeth.bed"
REFERENCE_GENOME="panTro6.fa"

# Generate composite plot
methylartist composite -b ${BAM_1} -s ${INPUT_BED} -r ${REFERENCE_GENOME} -t /PTERV_methylation/resources/PTERV1_FL.fa --mod m --output_table --excl_ambig -p 32 --blocks /PTERV_methylation/resources/PTERV1.highlights.bed --svg
methylartist composite -b ${BAM_2} -s ${INPUT_BED} -r ${REFERENCE_GENOME} -t /PTERV_methylation/resources/PTERV1_FL.fa --mod m --output_table --excl_ambig -p 32 --blocks /PTERV_methylation/resources/PTERV1.highlights.bed --svg
methylartist composite -b ${BAM_3} -s ${INPUT_BED} -r ${REFERENCE_GENOME} -t /PTERV_methylation/resources/PTERV1_FL.fa --mod m --output_table --excl_ambig -p 32 --blocks /PTERV_methylation/resources/PTERV1.highlights.bed --svg
methylartist composite -b ${BAM_4} -s ${INPUT_BED} -r ${REFERENCE_GENOME} -t /PTERV_methylation/resources/PTERV1_FL.fa --mod m --output_table --excl_ambig -p 32 --blocks /PTERV_methylation/resources/PTERV1.highlights.bed --svg
