# LINC00662 ChopMS analysis in fbNPCs

Contains code and processed metadata used to identify the proteins potentially binding *LINC00662* in fbNPCs.

## Contents

### **Code**
- **src/R**  
  - Sets up the path for sub-directories
  - Data processing: Background correction, QC, Normalization, Shortlisting Candidates and Subcellular location annotation
- **R Markdown**  
  Runs the scripts and generates plots listed in the manuscript  

### **Clean Data**
Tables containing:  
- Pre-processed ChopMS data  
- List of Nuclear Proteins listed in v23 of Human Protein Atlas  
- StringDb v11.5 GO analysis results for the top candidates shortlisted

---

## Instructions:
1. Create an new R project on the LINC00662_chopMS directory (optional but highly recommended)  
2. In Main.rmd, enter the absolute path to the (including) "LINC00662_chopMS" directory, under Initial Setup section in designated space
3. Install the libraries listed under Initial Setup, if not already installed
4. Run the entire Main.rmd
5. All the resulting tables and plots will be generated under the designated directories named, "docs" and "plots", respectively
6. The processed data will be saved as .rds file under the rds directory. This can be used for further exploration of the data.

---

## Output
Figures, tables and .rds files used in the manuscript.
