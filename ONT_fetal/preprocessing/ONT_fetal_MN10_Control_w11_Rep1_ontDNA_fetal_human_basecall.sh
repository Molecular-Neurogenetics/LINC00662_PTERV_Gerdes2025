#!/bin/bash
#SBATCH -J dorado_fetal_w11
#SBATCH -n 32
#SBATCH -N 1
#SBATCH -t 120:00:00
#SBATCH -A csens2024-3-2
#SBATCH -o dorado_fetal_w11_%j.out
#SBATCH -e dorado_fetal_w11_%j.err
#SBATCH -p sens-gpu

# Load required modules
module load GCC/11.3.0
module load OpenMPI/4.1.4
module load dorado/0.5.1-CUDA-11.7.0

# Define variables
MODEL_PATH="/path/to/models/backup/dorado/models/dna_r10.4.1_e8.2_400bps_sup@v4.1.0"
POD5_DIR="/path/to/rawdata/backup/op_065/rawdata/op_065_008/pod5_pass/"
REFERENCE_GENOME="/path/to/genome/backup/hg38.fa"
BAM_OUTPUT="/path/to/results/backup/op_065/1_mapping/hg38/MN10_Control_w11_Rep1_ontDNA_fetal_human_basecalls_5mC_5hmC_hg38.bam"

# Step 1: Basecall using Dorado
dorado basecaller ${MODEL_PATH} --modified-bases-models /path/to/models/backup/dorado/models/dna_r10.4.1_e8.2_400bps_sup@v4.1.0_5mCG_5hmCG@v2 ${POD5_DIR} --reference ${REFERENCE_GENOME} -v > ${BAM_OUTPUT}

