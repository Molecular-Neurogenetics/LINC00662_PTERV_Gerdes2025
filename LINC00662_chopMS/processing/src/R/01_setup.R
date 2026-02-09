### Script to setup paths for Chop-MS data analysis ###

# ------------------------------------------------------------
# Author: Chandramouli Muralidharan
# Date: 2026-02-04
# Associated article: "Retroviral insertions contributed to the divergence of human and chimpanzee brains"
# ------------------------------------------------------------

# Creating a list of directory paths
# Required: HOME variable below contains the project path and is provided by the user in the Main.rmd file
dir_list <-  list()
dir_list$home <- HOME
dir_list$data <- paste(HOME, "clean_data", sep = "/")
dir_list$rds <- paste(HOME, "rds", sep = "/")
dir_list$scripts <- paste(HOME, "processing/src/R", sep = "/")
dir_list$plots <- paste(HOME, "plots", sep = "/")
dir_list$docs <- paste(HOME, "docs", sep = "/")

saveRDS(dir_list, file = paste(dir_list$rds, "dir_list.rds", sep = "/"))
gc()

# Creating directories
suppressWarnings({
  dir.create(path = dir_list$rds)
  dir.create(path = dir_list$plots)
  dir.create(path = dir_list$docs)  
})