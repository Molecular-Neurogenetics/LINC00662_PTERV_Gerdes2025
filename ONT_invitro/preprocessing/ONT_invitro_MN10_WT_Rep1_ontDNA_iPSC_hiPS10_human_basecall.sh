#!/bin/bash
#SBATCH -J dorado_pipeline
#SBATCH -n 32
#SBATCH -N 1
#SBATCH -t 120:00:00
#SBATCH -A csens2024-3-2
#SBATCH -o dorado_pipeline_%j.out
#SBATCH -e dorado_pipeline_%j.err
#SBATCH -p sens-gpu

## Sample: MN10_WT_Rep1_ontDNA_iPSC_hiPS10_human
## Dorado basecalling and mapping

# Load required modules
module load GCC/11.3.0
module load OpenMPI/4.1.4
module load dorado/0.5.1-CUDA-11.7.0

# Define variables
MODEL_PATH="/dorado/models/dna_r10.4.1_e8.2_400bps_sup@v4.3.0"
POD5_DIR="/rawdata/op_065_003_B/pod5_pass/"
REFERENCE_GENOME="hg38.fa"
BAM_OUTPUT="/1_mapping/hg38/MN10_WT_Rep1_ontDNA_iPSC_hiPS10_human_basecalls_5mC_5hmC_hg38.bam"

# Step 1: Basecall using Dorado
dorado basecaller ${MODEL_PATH} --modified-bases-models /dorado/models/dna_r10.4.1_e8.2_400bps_sup@v4.3.0_5mCG_5hmCG@v1 ${POD5_DIR} --reference ${REFERENCE_GENOME} -v > ${BAM_OUTPUT}
