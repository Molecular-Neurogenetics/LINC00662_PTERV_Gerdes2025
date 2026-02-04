### Script to process the LINC00662 ChopMS data ###

# ------------------------------------------------------------
# Author: Chandramouli Muralidharan
# Date: 2026-02-04
# Associated article: "Retroviral insertions contributed to the divergence of human and chimpanzee brains"
# ------------------------------------------------------------

##
# Data Processing
##

linc_chopMS_avg <- fread(file = paste(dir_list$data, "linc00662_chopMS_preprocessed_data_2023-12-07.csv", sep = "/"), data.table = FALSE) %>% 
  
  # replacing NA values with 0
  mutate(across(everything(), ~ replace_na(.x, 0))) %>% 
  
  # adding ENTREZ ID and HGNC Gene Symbols for corresponding UNIPROT Accession IDs
  mutate(Gene_Name = mapIds(org.Hs.eg.db, keys = as.character(Accession), keytype = "UNIPROT", column = "SYMBOL"),
         Entrez_ID = mapIds(org.Hs.eg.db, keys = as.character(Accession), keytype = "UNIPROT", column = "ENTREZID")) %>% 
  
  # background correction: the protein abundance of corresponding controls were subtracted
  mutate(Rep1_linc00662_Corrected = Rep1_linc00662 - Rep1_Lacz,
         Rep2_linc00662_Corrected = Rep2_linc00662 - Rep2_Lacz) %>% 
  
  # QC: only retaining candidates with protein abundance > 0 post background correction
  filter(Rep1_linc00662_Corrected > 0 & Rep2_linc00662_Corrected > 0) %>%
  
  # normalization: normalizing corrected protein abundances by their sum in each replicate, followed by multiplying it by 1000
  mutate(Rep1_linc00662_Norm = (Rep1_linc00662_Corrected / sum(Rep1_linc00662_Corrected)) * 1000,
         Rep2_linc00662_Norm = (Rep2_linc00662_Corrected / sum(Rep2_linc00662_Corrected)) * 1000) %>% 
  
  # average: averaging the normalized protein abundances across the replicates for each protein
  mutate(Rep_linc00662_avg = (Rep1_linc00662_Norm + Rep2_linc00662_Norm)/2,
         Accession = fct_reorder(Accession, Rep_linc00662_avg, .desc = TRUE))

##
# Selecting top 45 protein candidates potentially binding LINC00662 lncRNA
##

linc_chopMS_avg_top45 <- linc_chopMS_avg %>% 
  top_n(45, Rep_linc00662_avg)

##
# Annotating the Subcellular location
##

# Importing list of Nuclear Proteins from the Human Protein Atlas's Subcellular annotation database
hum_nuc_prot <- fread(file = paste(dir_list$data, "human_protein_atlas_subcell_location_nuclear_v23_2023-12-14.tsv", sep = "/"), sep = "\t", header = TRUE, strip.white = TRUE, data.table = FALSE)

# Labeling the strictly nuclear proteins as nuclear and the remaining as cytoplasmic
linc_chopMS_avg_top45_ann <- linc_chopMS_avg_top45 %>% 
  mutate(Location = ifelse(Accession %in% hum_nuc_prot$Uniprot | Gene_Name %in% hum_nuc_prot$Gene, "Nucleus", "Cytoplasmic"))

##
# Saving and Exporting data
##

# Saving data as .rds
saveRDS(linc_chopMS_avg, file = paste(dir_list$rds, "linc_chopMS_avg.rds", sep = "/"))

# Saving data as .csv
fwrite(linc_chopMS_avg, file = paste(dir_list$docs, "linc00662_chopMS_processed_data.csv", sep = "/"))

# Saving the top 45 protein candidates along with their subcellular annotation information as a .rds file
saveRDS(linc_chopMS_avg_top45_ann, file = paste(dir_list$rds, "linc_chopMS_avg_top45_ann.rds", sep = "/"))

