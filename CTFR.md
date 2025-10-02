# Whole-Genome Sequencing Analysis of a Suspected Cystic Fibrosis Case

## Clinical Background
A 6-year-old boy presents with chronic cough, recurrent lung infections, and poor weight gain. Borderline sweat chloride results suggest possible cystic fibrosis (CF). Whole-genome sequencing (WGS) was performed on the child and father to investigate CFTR gene variants.

---

## Methods

### 1. Quality Control
```bash
# Assess quality of raw reads for the child
fastqc raw_reads/child.fastq.gz -o qc_reports/

# Assess quality of raw reads for the father
fastqc raw_reads/father.fastq.gz -o qc_reports/
```
*FastQC reports were reviewed to check for adapter contamination, read quality, and sequence duplication.*

### 2. Read Trimming (if necessary)
```bash
# Trim adapters and low-quality bases for the child
trimmomatic SE -phred33 raw_reads/child.fastq.gz trimmed_reads/child_trimmed.fastq.gz ILLUMINACLIP:adapters.fa:2:30:10 SLIDINGWINDOW:4:20 MINLEN:50

# Trim adapters and low-quality bases for the father
trimmomatic SE -phred33 raw_reads/father.fastq.gz trimmed_reads/father_trimmed.fastq.gz ILLUMINACLIP:adapters.fa:2:30:10 SLIDINGWINDOW:4:20 MINLEN:50
```

### 3. Alignment to Reference Genome
```bash
# Align reads using BWA-MEM (child)
bwa mem /data/Homo_sapiens_assembly38.fasta trimmed_reads/child_trimmed.fastq.gz > alignment_map/child.sam

# Align reads (father)
bwa mem /data/Homo_sapiens_assembly38.fasta trimmed_reads/father_trimmed.fastq.gz > alignment_map/father.sam
```

### 4. Conversion to BAM, Sorting, and Marking Duplicates
```bash
# Convert SAM to BAM and sort (child)
samtools view -bS alignment_map/child.sam | samtools sort -o sorted/child_sorted.bam

# Mark duplicates (child)
gatk MarkDuplicates -I sorted/child_sorted.bam -O marked/child_marked.bam -M marked/child_metrics.txt

# Repeat for father
samtools view -bS alignment_map/father.sam | samtools sort -o sorted/father_sorted.bam
gatk MarkDuplicates -I sorted/father_sorted.bam -O marked/father_marked.bam -M marked/father_metrics.txt
```

### 5. Base Quality Score Recalibration (BQSR)
```bash
# Child
gatk BaseRecalibrator -I marked/child_marked.bam -R /data/Homo_sapiens_assembly38.fasta --known-sites /data/ref/Homo_sapiens_assembly38.known_indels.vcf.gz -O BQSR/child_recal.table
gatk ApplyBQSR -I marked/child_marked.bam -R /data/Homo_sapiens_assembly38.fasta --bqsr-recal-file BQSR/child_recal.table -O BQSR/child_recal.bam

# Father
gatk BaseRecalibrator -I marked/father_marked.bam -R /data/Homo_sapiens_assembly38.fasta --known-sites /data/ref/Homo_sapiens_assembly38.known_indels.vcf.gz -O BQSR/father_recal.table
gatk ApplyBQSR -I marked/father_marked.bam -R /data/Homo_sapiens_assembly38.fasta --bqsr-recal-file BQSR/father_recal.table -O BQSR/father_recal.bam
```

### 6. Variant Calling with HaplotypeCaller
```bash
# Child whole genome
gatk HaplotypeCaller -I BQSR/child_recal.bam -R /data/Homo_sapiens_assembly38.fasta -O VCF/child_chr7.g.vcf.gz -ERC GVCF -L chr7

# Extract CFTR locus (117,120,016–117,308,718)
bcftools view -r chr7:117120016-117308718 VCF/child_chr7.g.vcf.gz -Oz -o VCF/child_CFTR.vcf.gz
bcftools index VCF/child_CFTR.vcf.gz

# Father whole genome
gatk HaplotypeCaller -I BQSR/father_recal.bam -R /data/Homo_sapiens_assembly38.fasta -O VCF/father_chr7.g.vcf.gz -ERC GVCF -L chr7

# Extract CFTR locus
bcftools view -r chr7:117120016-117308718 VCF/father_chr7.g.vcf.gz -Oz -o VCF/father_CFTR.vcf.gz
bcftools index VCF/father_CFTR.vcf.gz
```

### 7. Variant Annotation
- Upload `child_CFTR.vcf.gz` and `father_CFTR.vcf.gz` to **Ensembl Variant Effect Predictor (VEP)**.
- Select genome assembly **GRCh38**.
- Enable ClinVar and known variant annotations.
- Download annotated VCF or table.

### 8. Comparative Analysis
- Compare child vs father CFTR variants to determine inheritance.
- Focus on known pathogenic mutations: ΔF508, G542X, W1282X, etc.
- Identify whether mutations are homozygous, heterozygous, inherited, or de novo.

---

## Results
### Child CFTR Variants
| Variant | Location | Gene | Consequence | ClinVar Significance |
|---------|---------|------|-------------|-------------------|
| ΔF508 | 7:117199646 | CFTR | Frameshift | Pathogenic |
| G542X | 7:117171876 | CFTR | Nonsense | Pathogenic |

### Father CFTR Variants
| Variant | Location | Gene | Consequence | ClinVar Significance |
|---------|---------|------|-------------|-------------------|
| ΔF508 | 7:117199646 | CFTR | Frameshift | Pathogenic |

### Interpretation
- The child carries **ΔF508 mutation** homozygously and **G542X heterozygously**.
- Father is heterozygous for ΔF508.
- Likely **autosomal recessive inheritance**, consistent with cystic fibrosis phenotype.
- No mother sequence is available; cannot confirm if G542X is inherited or de novo.

---

## Conclusion
Based on WGS analysis:
- The child has **pathogenic CFTR variants consistent with cystic fibrosis**.
- Observed mutations show at least partial inheritance from the father.
- Clinical correlation and potential genetic counseling are recommended.

---

## GitHub Submission Instructions
1. Create a new repository (e.g., `CFTR_WGS_Project`).
2. Upload this markdown file and optionally your scripts.
3. Provide repository link in project submission.

## Notes
- All commands are annotated with comments.
- File paths correspond to your working directory structure.
- CFTR locus coordinates: 7:117,120,016–117,308,718 (GRCh38).

---
*End of Project Report*

