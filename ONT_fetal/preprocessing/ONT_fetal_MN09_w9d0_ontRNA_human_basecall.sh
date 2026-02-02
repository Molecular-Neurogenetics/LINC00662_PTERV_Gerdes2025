#!/bin/bash
#SBATCH -n 32
#SBATCH -N 1
#SBATCH -t 120:00:00
#SBATCH -p sens-gpu
#SBATCH -A csens2024-3-2
#SBATCH -J dorado_basecall
#SBATCH -o dorado_basecall.%j.out
#SBATCH -e dorado_basecall.%j.err
module purge
ml GCC/11.3.0 OpenMPI/4.1.4 GCCcore/11.3.0 dorado/0.7.1-CUDA-11.7.0 minimap2/2.24 SAMtools/1.16.1

dorado basecaller /ONT_models/rna004_130bps_sup@v3.0.1\
 --modified-bases-models /ONT_models/rna004_130bps_sup@v3.0.1_m6A_DRACH@v1\
 --reference hg38.fa.gz\
 MN09_F6_REP1_ontRNA_fetal_9w0d_CTX/20241203_1550_P2S-01325-A_PBA19171_f80cc9ea/pod5/ -v\
 --mm2-preset splice\
 > Results/Fetal_dRNAseq/MN09_F6_REP1_ontRNA_fetal_9w0d_CTX.splice.sam
