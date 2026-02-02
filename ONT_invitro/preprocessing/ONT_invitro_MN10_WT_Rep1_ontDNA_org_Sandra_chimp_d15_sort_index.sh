##QC of BAM file with BAMtools
#!/bin/bash
#SBATCH -J bamtools_stats_Sandra_d15
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -t 1:00:00
#SBATCH -A csens2024-3-2
#SBATCH -o bamtools_stats_Sandra_d15_%j.out
#SBATCH -e bamtools_stats_Sandra_d15_%j.err

# Load required modules
module load GCC/11.3.0
module load GCC/12.2.0
module load BamTools/2.5.2

# Run
bamtools stats -in /rawdata/MN10/MN10_WT_Rep1_ontDNA_org_Sandra_chimp_d15/20240503_1519_P2S-01325-A_PAW40028_3c8a8a9e/basecalling/MN10_WT_Rep1_ontDNA_org_Sandra_chimp_d15_basecalls_5mC_5hmC_panTro6.bam > /rawdata/MN10/MN10_WT_Rep1_ontDNA_org_Sandra_chimp_d15/20240503_1519_P2S-01325-A_PAW40028_3c8a8a9e/basecalling/stats_Sandra_d15.txt

module purge
# Load required modules
module load GCC/12.3.0
module load SAMtools/1.18

# Input and output file paths
INPUT_BAM=/rawdata/MN10/MN10_WT_Rep1_ontDNA_org_Sandra_chimp_d15/20240503_1519_P2S-01325-A_PAW40028_3c8a8a9e/basecalling/MN10_WT_Rep1_ontDNA_org_Sandra_chimp_d15_basecalls_5mC_5hmC_panTro6.bam
OUTPUT_BAM=/rawdata/MN10/1_mapping/panTro6/MN10_WT_Rep1_ontDNA_org_Sandra_chimp_d15_basecalls_5mC_5hmC_panTro6.sorted.bam

# Sorting the BAM file
samtools sort -@ 8 -o ${OUTPUT_BAM} ${INPUT_BAM}

# Indexing the sorted BAM file
samtools index /rawdata/MN10/1_mapping/panTro6/MN10_WT_Rep1_ontDNA_org_Sandra_chimp_d15_basecalls_5mC_5hmC_panTro6.sorted.bam


##DONE##