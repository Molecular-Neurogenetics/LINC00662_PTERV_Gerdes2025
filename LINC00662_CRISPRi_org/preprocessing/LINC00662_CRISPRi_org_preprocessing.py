#!/bin/python
# ml GCC/12.2.0 Pysam/0.21.0
# ml GCC/12.2.0 Pysam/0.21.0 OpenMPI/4.1.4 Biopython/1.81
import truster
import pandas as pd 
import os

cellranger_index = "/indices/cellranger9.0.0/hg38/" 
star_index = "/indices/GRCh38.p13_gencode.v38_STAR/" 
gene_gtf = "/annotations/hg38/gencode/v42/gencode.v42.annotation.gtf"
te_gtf = "/annotations/hg38/rmsk/hg38_rmsk_TEtranscripts_FL_L1_marked.gtf"
herv_gtf = "/annotations/hg38/rmsk/hg38_HERVs_prediction.gtf"

path_parent = os.path.dirname(os.getcwd())
lunarc = "config_files/lunarc_config.json"
modules = "config_files/software_modules.json"

name = "mn06_org_pterv"
mn06_org_pterv = truster.Experiment(name, lunarc, modules)
mn06_org_pterv.register_samples_from_file("samplesheet_registered_mn06_pterv_round2.tab")

samples = mn06_org_pterv.samples.keys()
print("Total of " + str(len(mn06_org_pterv.samples.keys())) + "samples registered")

quantification_dir = os.path.join(path_parent, "1_counts")
mn06_org_pterv.quantify(cr_index = cellranger_index, outdir = quantification_dir, jobs = 28, nuclei = {sample : True for sample in samples})

#for sample_id in list(mn06_org_pterv.samples.keys()):
#    mn06_org_pterv.set_quantification_outdir(sample_id = sample_id, cellranger_outdir = os.path.join(quantification_dir, sample_id))






