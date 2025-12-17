# A retroviral insertion contributed to the divergence of human and chimpanzee brains
 
This repository contains all code, processed data tables, and analysis workflows used in the publication.  
The project integrates bulk RNA-seq, single-nuclei RNA-seq, CRISPRi of LINC00662, and Oxford Nanopore Technologies (ONT) sequencing from human and chimpanzee iPSC or cerebral organoids.

## Repository Structure

### `bulkRNA_org_human_chimp/`
Bulk RNA-seq analysis of human and chimpanzee cerebral organoids.  
Includes mapping workflow (Snakemake), differential expression, and visualizations.

### `human_chimp_org/`
Single-nuclei RNA-seq of human and chimpanzee organoids.  
Contains UMAP generation, clustering, marker gene analysis, and metadata tables.

### `LINC00662_CRISPRi_org/`
Single-nuclei RNA-seq from LINC00662 CRISPRi organoids, including pseudobulk DEA and GSEA.

### `ONT_invitro/`
Oxford Nanopore in vitro sequencing analyses, including methylation and locus-specific plots.

### `ONT_fetal/`
ONT whole genome and direct RNA sequencing from fetal forebrain samples.

### `LINC00662_chopMS/`
To be defined.

---

## Requirements
Most code uses:
- **R ≥ 4.2** (Seurat, DESeq2, clusterProfiler, tidyverse)
- **Python ≥ 3.9** (scanpy, trusTEr, methylartist)
- **Snakemake ≥ 7**

---

## Citation
Please cite the corresponding publication when using this repository.
[link to the biorxiv and publication at some point]

---

## Contact
For questions, please contact: Raquel Garza (raquel.garza@med.lu.se).

