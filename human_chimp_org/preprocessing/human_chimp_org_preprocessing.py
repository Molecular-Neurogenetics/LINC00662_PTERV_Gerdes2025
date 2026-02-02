#!/bin/python
# ml GCC/12.2.0 Pysam/0.21.0
import truster
import os

path_parent = os.path.dirname(os.getcwd())
lunarc = "config_files/lunarc_config.json"
modules = "config_files/software_modules.json"

mn10_org = truster.Experiment("mn10_org", lunarc, modules)

mn10_org.register_sample(sample_id = "PG_hiPS10_d15_organoids_kit", sample_name = "PG_hiPS10_d15_organoids_kit", raw_path = "/raw_data/seq246_249_ctg_2023_143_singleNuclei/Seq246/")
mn10_org.register_sample(sample_id = "PG_hiPS6_d15_organoids_kit", sample_name = "PG_hiPS6_d15_organoids_kit", raw_path = "/raw_data/seq246_249_ctg_2023_143_singleNuclei/Seq246/")
mn10_org.register_sample(sample_id = "PG_Sandra_d15_organoids_kit", sample_name = "PG_Sandra_d15_organoids_kit", raw_path = "/raw_data/seq246_249_ctg_2023_143_singleNuclei/Seq246/")
mn10_org.register_sample(sample_id = "MN10_WT_Rep1_snRNA_org_JoC_chimp_cerebral_d15", sample_name = "MN10_WT_Rep1_snRNA_org_JoC_chimp_cerebral_d15", raw_path = "/raw_data/CTG_2024_063_SnSeq_Seq316_MN10_org/")
mn10_org.register_sample(sample_id = "MN10_WT_Rep1_snRNA_org_hiPS10_human_cerebral_d15_batch2", sample_name = "MN10_WT_Rep1_snRNA_org_hiPS10_human_cerebral_d15_batch2", raw_path = "/raw_data/CTG_cglu00105_2024_286/MN10_Seq356_seq357_10X_bulkRNA/")
mn10_org.register_sample(sample_id = "MN10_WT_Rep1_snRNA_org_hiPS6_human_cerebral_d15_batch2", sample_name = "MN10_WT_Rep1_snRNA_org_hiPS6_human_cerebral_d15_batch2", raw_path = "/raw_data/CTG_cglu00105_2024_286/MN10_Seq356_seq357_10X_bulkRNA/")
mn10_org.register_sample(sample_id = "MN10_WT_Rep1_snRNA_org_JoC_chimp_cerebral_d15_batch1", sample_name = "MN10_WT_Rep1_snRNA_org_JoC_chimp_cerebral_d15_batch1", raw_path = "/raw_data/CTG_cglu00105_2024_286/MN10_Seq356_seq357_10X_bulkRNA/")
mn10_org.register_sample(sample_id = "MN10_WT_Rep1_snRNA_org_JoC_chimp_cerebral_d15_batch2", sample_name = "MN10_WT_Rep1_snRNA_org_JoC_chimp_cerebral_d15_batch2", raw_path = "/raw_data/CTG_cglu00105_2024_286/MN10_Seq356_seq357_10X_bulkRNA/")
mn10_org.register_sample(sample_id = "MN10_WT_Rep1_snRNA_org_Sandra_chimp_cerebral_d15_batch2", sample_name = "MN10_WT_Rep1_snRNA_org_Sandra_chimp_cerebral_d15_batch2", raw_path = "/raw_data/CTG_cglu00105_2024_286/MN10_Seq356_seq357_10X_bulkRNA/")

quantification_dir = os.path.join(path_parent, "1_counts")
cellranger_index = "/scale/gr01/shared/common/genome/10Xindexes/cellranger/6.0/refdata-gex-GRCh38-2020-A/" 
samples = list(mn10_org.samples.keys())

mn10_org.quantify(cr_index = cellranger_index, outdir = quantification_dir, jobs = 25, nuclei = {sample : True for sample in samples})

gene_gtf = "/annotations/hg38/gencode/v38/gencode.v38.annotation.gtf"
te_gtf = "/annotations/hg38/rmsk/hg38_rmsk_TEtranscripts_FL_L1_marked.gtf"

clusters_dir = os.path.join(path_parent, "2_getClusters")
for sample_id in list(mn10_org.samples.keys()):
    mn10_org.set_quantification_outdir(sample_id = sample_id, cellranger_outdir = os.path.join(quantification_dir, sample_id))

mn10_org.get_clusters_all_samples(clusters_dir, perc_mitochondrial = 2, min_genes = 500, normalization_method = "LogNormalize", max_size=2000, res = 0.5, jobs=15)
#mn10_org.set_clusters_outdir(clusters_dir)

star_index = "/annotations/GRCh38.p13_gencode.v38_STAR/" 
merged_dir = os.path.join(path_parent, "3_combinedUMAP_perCluster_human_chimp_res0.1")

mn10_org.merge_samples(merged_dir, "LogNormalize", res = 0.1, integrate_samples = True)



