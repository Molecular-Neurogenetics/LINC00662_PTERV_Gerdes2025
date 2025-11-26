# Bulk RNA-seq of Human and Chimpanzee Organoids

This directory contains workflows and results for bulk RNA-seq comparing human and chimpanzee cerebral organoids.

## Contents

### **Code**
- **Snakefile**  
  Workflow for:
  - Mapping reads to species-specific reference genomes  
  - Gene-level quantification  
- **R Markdown**  
  Performs:  
  - Differential expression analysis (DEA)  
  - Visualization (volcano plots, heatmaps, PCA, etc.)

### **Clean Data**
- **Gene count matrix**  
  Post-mapping counts used for differential expression.  
- **Gene DEA results**  
  Processed differential expression results used in the publication.

---


