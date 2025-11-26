# Single-nuclei RNA-seq of Human and Chimpanzee Organoids

Contains code and processed metadata used to generate species-specific transcriptomic profiles across human and chimpanzee organoids.

## Contents

### **Code**
- **Python script (trusTEr)**  
  Generates UMAP embedding using Seurat.
- **R Markdown**  
  Downstream analyses including:  
  - UMAP split by cluster  
  - Cluster composition barplots  
  - Marker gene expression  
  - LINC00662 expression visualization  
  - Cell cycle scoring

### **Clean Data**
A table containing per-cell information:  
- UMAP coordinates  
- Cluster assignment  
- Species  
- Cell line  
- LINC00662 expression  
- Cell cycle scores  

---

## Workflow Overview
1. Generate UMAP embedding using trusTEr (Python, Seurat under the hood).  
2. Load results in R for cluster annotation, visualization, and quantitative comparisons.

---

## Output
Figures and tables used in the manuscript.
