#!/bin/bash
#SBATCH -n 32
#SBATCH -N 1
#SBATCH -t 120:00:00
#SBATCH -p sens-gpu
#SBATCH -A csens2024-3-2
#SBATCH -J dorado_basecall
#SBATCH -o dorado_splice.%j.out
#SBATCH -e dorado_splice.%j.err

module purge
ml GCC/11.3.0 OpenMPI/4.1.4 GCCcore/11.3.0 dorado/0.7.1-CUDA-11.7.0 minimap2/2.24 SAMtools/1.16.1
WD=/path/to/home/
RD=/path/to/rawdata

dorado basecaller $WD/backup/ONT_models/rna004_130bps_sup@v3.0.1\
 --modified-bases-models $WD/backup/ONT_models/rna004_130bps_sup@v3.0.1_m6A_DRACH@v1\
 $RD/backup/rawdatasets_2024/MN09_hNES_Sai2_ontRNA_LV3599_batch1/20240705_1609_P2S-01325-A_PAW41338_f8dbcd12/pod5/ --emit-fastq |\
 samtools fastq -T "*" | minimap2 -ax splice -uf -k14 -y /scale/gr01/shared/common/genome/genomes/human/hg38/hg38.fa.gz\
 > Results/ONT_MN09_20240725/MN09_LacZ_batch1_dRNA_NES_Sai2_LV3599_splice.sam
