#!/bin/bash
#SBATCH -J methylartist_locus_linc00662_pt
#SBATCH -n 8
#SBATCH -N 1
#SBATCH -t 0:30:00
#SBATCH --mem=8G
#SBATCH -A csens2024-3-2
#SBATCH -o methylartist_locus_linc00662_pt_%j.out
#SBATCH -e methylartist_locus_linc00662_pt_%j.err

# Load required modules
module load GCC/11.2.0
module load OpenMPI/4.1.1
module load methylartist/1.2.6

# Define variables
BAM_1="/scale/gr01/shared/jjakobsson/backup/op_065/1_mapping/pantro6/MN10_WT_Rep1_ontDNA_iPSC_Sandra_chimp_basecalls_5mC_5hmC_panTro6.sorted.bam"
BAM_2="/scale/gr01/shared/jjakobsson/backup/op_065/1_mapping/pantro6/MN10_WT_Rep1_ontDNA_iPSC_JoC_chimp_basecalls_5mC_5hmC_panTro6.sorted.bam"
BAM_3="/scale/gr01/shared/jjakobsson/backup/MN10_ontDNA/1_mapping/panTro6/MN10_WT_Rep1_ontDNA_org_Sandra_chimp_d15_basecalls_5mC_5hmC_panTro6.sorted.bam"
BAM_4="/scale/gr01/shared/jjakobsson/backup/MN10_ontDNA/1_mapping/panTro6/MN10_WT_Rep1_ontDNA_org_JoC_chimp_d15_basecalls_5mC_5hmC_panTro6.sorted.bam"
ANNOTATION_FILE="/scale/gr01/shared/jjakobsson/processed/panTro6/panTro6.ncbiRefSeq.sorted.gtf.gz"
REFERENCE_GENOME="/scale/gr01/shared/jjakobsson/backup/nino_fs1_jakobssonlab/panTro6_genome/panTro6.fa"

# +/- 10kb
methylartist locus -b ${BAM_2}:#C1E5DB,${BAM_1}:#CEEADB,${BAM_4}:#AAE5D4,${BAM_3}:#B7EACE -i chr19:25693341-25723705 -g ${ANNOTATION_FILE} -l 25706377-25713292 -p 1,8,1,1,4 --ref ${REFERENCE_GENOME} --motif CG -m m --labelgenes --svg
