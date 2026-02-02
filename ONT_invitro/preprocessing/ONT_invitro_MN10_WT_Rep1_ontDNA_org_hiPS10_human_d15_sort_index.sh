#!/bin/bash
#SBATCH -J bamtools_stats_hiPS10_d15
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -t 1:00:00
#SBATCH -A csens2024-3-2
#SBATCH -o bamtools_stats_hiPS10_d15_%j.out
#SBATCH -e bamtools_stats_hiPS10_d15_%j.err

## Sample: MN10_WT_Rep1_ontDNA_org_hiPS10_human_d15
## QC of BAM file with BAMtools

# Load required modules
module load GCC/11.3.0
module load GCC/12.2.0
module load BamTools/2.5.2

# Run
bamtools stats -in /rawdata/MN10/MN10_WT_Rep1_ontDNA_org_hiPS10_human_d15/20240412_1556_P2S-01325-B_PAQ55892_3d57fae7/basecalling/MN10_WT_Rep1_ontDNA_org_hiPS10_human_d15_basecalls_5mC_5hmC_hg38.bam > /rawdata/MN10/MN10_WT_Rep1_ontDNA_org_hiPS10_human_d15/20240412_1556_P2S-01325-B_PAQ55892_3d57fae7/basecalling/stats_hiPS10_d15.txt

module purge
# Load required modules
module load GCC/12.3.0
module load SAMtools/1.18

# Input and output file paths
INPUT_BAM=/rawdata/MN10/MN10_WT_Rep1_ontDNA_org_hiPS10_human_d15/20240412_1556_P2S-01325-B_PAQ55892_3d57fae7/basecalling/MN10_WT_Rep1_ontDNA_org_hiPS10_human_d15_basecalls_5mC_5hmC_hg38.bam
OUTPUT_BAM=/rawdata/MN10/1_mapping/hg38/MN10_WT_Rep1_ontDNA_org_hiPS10_human_d15_basecalls_5mC_5hmC_hg38.sorted.bam

# Sorting the BAM file
samtools sort -@ 8 -o ${OUTPUT_BAM} ${INPUT_BAM}

# Indexing the sorted BAM file
samtools index /rawdata/MN10/1_mapping/hg38/MN10_WT_Rep1_ontDNA_org_hiPS10_human_d15_basecalls_5mC_5hmC_hg38.sorted.bam

##DONE##