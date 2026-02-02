#!/bin/bash
#SBATCH -J dorado_pipeline
#SBATCH -n 32
#SBATCH -N 1
#SBATCH -t 120:00:00
#SBATCH -A csens2024-3-2
#SBATCH -o dorado_pipeline_%j.out
#SBATCH -e dorado_pipeline_%j.err
#SBATCH -p sens-gpu

## Sample: MN10_WT_Rep1_ontDNA_iPSC_Pt5_chimp
## Dorado basecalling and mapping

# Load required modules
module load GCC/11.3.0
module load OpenMPI/4.1.4
module load dorado/0.5.1-CUDA-11.7.0

# Define variables
MODEL_PATH="/dorado/models/dna_r10.4.1_e8.2_400bps_sup@v4.1.0"
POD5_DIR="/rawdata/op_065_005/pod5_pass/"
REFERENCE_GENOME="/panTro6_genome/panTro6.fa"
BAM_OUTPUT="/1_mapping/pantro6/MN10_WT_Rep1_ontDNA_iPSC_Pt5_chimp_basecalls_5mC_5hmC_panTro6.bam"

# Step 1: Basecall using Dorado
dorado basecaller ${MODEL_PATH} --modified-bases-models /dorado/models/dna_r10.4.1_e8.2_400bps_sup@v4.1.0_5mCG_5hmCG@v2 ${POD5_DIR} --reference ${REFERENCE_GENOME} -v > ${BAM_OUTPUT}
