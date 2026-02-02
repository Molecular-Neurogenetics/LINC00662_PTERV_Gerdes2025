#!/bin/bash
#SBATCH -J methylartist_segplot_retrotector
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -t 0:10:00
#SBATCH -A csens2024-3-2
#SBATCH -o methylartist_segplot_retrotector_%j.out
#SBATCH -e methylartist_segplot_retrotector_%j.err

# Load required modules
module load GCC/11.2.0
module load OpenMPI/4.1.1
module load methylartist/1.2.6

# plot it
methylartist segplot -s retrotector_PTERV1_segmeth.MN10_WT_Rep1_ontDNA_iPSC_Sandra_chimp_basecalls_5mC_5hmC_panTro6.sorted.cohort.segmeth.tsv -c PTERV1 --mods m --tiltlabel

