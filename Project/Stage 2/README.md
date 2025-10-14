#  Differential Gene Expression Analysis: UV-C Stress Response in *Arabidopsis thaliana* Vasculature

##  Project Overview
This repository contains the complete workflow and analysis for determining **differentially expressed genes (DEGs)** in the **vasculature tissue** of *Arabidopsis thaliana* exposed to **UV-C stress**, based on data from **Berkowitz et al. (2021)**.

The goal is to understand the **transcriptional reprogramming** that occurs in plant vasculature under ultraviolet stress and identify **key molecular pathways** responsible for stress tolerance and defense.

---

##  Experimental Design

| Replicate | Control (Water) | UV-C Treated |
|------------|-----------------|---------------|
| 1 | SRR12808527 | SRR12808497 |
| 2 | SRR12808528 | SRR12808498 |
| 3 | SRR12808529 | SRR12808499 |

Each replicate represents **vasculature-enriched tissues** subjected to UV-C or control conditions.

---

##  Objectives

1. **Preprocess RNA-seq data** — trimming, quality control, and alignment.  
2. **Quantify gene expression** using `featureCounts`.  
3. **Identify DEGs** between UV-treated and control samples using `DESeq2`.  
4. **Perform GO and KEGG enrichment** to reveal biological pathways affected by UV stress.  
5. **Visualize results** with volcano plots, heatmaps, and enrichment diagrams.

---

##  Workflow Summary

###  Step 1: Quality Control
- Tools: **FastQC**, **MultiQC**, **Trimmomatic**
- Removes adapters, filters low-quality reads, and summarizes read quality.

###  Step 2: Alignment
- Tool: **HISAT2**
- Reads aligned to the *Arabidopsis thaliana* TAIR10 reference genome.
- BAM files sorted and indexed with **SAMtools**.

###  Step 3: Quantification
- Tool: **featureCounts**
- Generates a gene-level count matrix from aligned reads.

###  Step 4: Differential Expression
- Tool: **DESeq2 (R)**
- Identifies significantly up/downregulated genes (FDR < 0.05).
- Produces visualizations:
  - Volcano plot
  - Heatmap of top DEGs

###  Step 5: Functional Enrichment
- Tool: **clusterProfiler**
- GO Biological Process and KEGG pathway enrichment using `org.At.tair.db`.
- Highlights UV-induced stress and defense mechanisms.

---

##  Key Results

| Observation | Description |
|--------------|-------------|
| **Upregulated Genes** | Stress response, DNA repair (RAD51, UVR8), ROS detoxification (CAT2, APX1), flavonoid biosynthesis (CHS, FLS1) |
| **Downregulated Genes** | Photosynthetic and primary metabolic genes |
| **Top Pathways** | MAPK signaling, DNA repair, Glutathione metabolism, Flavonoid biosynthesis, Hormone signaling |

 Full DEG table available in: [`DEG_results.csv`](./DEG_results.csv)

---

##  Biological Interpretation
UV-C exposure triggers:
- **Activation of antioxidant systems** to counter ROS damage.
- **Upregulation of secondary metabolite pathways** (flavonoids, phenolics) for UV protection.
- **Suppression of photosynthetic processes** to conserve energy during stress response.

These insights provide molecular clues to **UV tolerance mechanisms** in plants and identify **potential genetic targets** for crop improvement.


