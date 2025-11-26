# Single-nuclei RNA-seq from LINC00662 CRISPRi Organoids

This directory includes analyses for CRISPRi perturbation of **LINC00662** in human organoids, combining single-nucleus profiling with pseudobulk differential expression.

## Contents

### **Code**

#### **Scanpy Jupyter Notebook**
Generates:
- UMAP embedding  
- Cluster composition (UMAP + stacked barplots)  
- Cell cycle scoring  
- Marker gene expression (dot plots)  
- Cell typing  
- Pseudobulking per cluster  

#### **R Markdown**
Pseudobulk downstream analyses:
- Differential expression analysis  
- Gene set enrichment analysis (GSEA)  
- Visualization of results  

---

### **Clean Data**
- Per-nuclei table including:  
  - UMAP coordinates  
  - Cluster  
  - Cell line  
  - LINC00662 expression  
  - Cell cycle scores  
- **Pseudobulked counts**  
- **Pseudobulked DEA results**  
- **Pseudobulked GSEA results**

---


