# sequence-homology-search-blast
Bioinformatics pipeline for sequence identification using NCBI BLAST+. Includes command-line data extraction and R-based statistical filtering of genomic hits


# Genomic Sequence Identification (BLAST+)

This project demonstrates the use of **BLAST** (Basic Local Alignment Search Tool) to identify unknown genomic sequences and validate assembly results. 

## Project Overview
The goal of this analysis was to identify the origin of the **ERR3407986** sequence series by searching against the `core_nt` (nucleotide) database. This process is essential for species identification and detecting potential sample contamination.

## 🛠 Workflow
1. **Command-Line Processing:** Executing `blastn` with tabular output formatting (`-outfmt 7`).
2. **Data Integration:** Importing raw alignment metadata into the R environment.
3. **Statistical Filtering:** Using `Bioconductor` and `Tidyverse` to sieve results based on **E-value** and **Percent Identity**.

## Key Metrics Explained
* **E-value (Expect value):** The number of hits one can "expect" to see by chance. My analysis focuses on high-confidence hits ($E < 1e-10$).
* **Bit Score:** A measure of the statistical significance of the alignment; higher scores indicate better matches.
* **% Identity:** The extent to which two sequences have the same residues at the same positions.

## Repository Structure
* `blast_pipeline.R`: R script for data filtering and visualization.
* `data/`: Sample BLAST output files (tabular format).
* `results/`: Filtered significant hits and alignment quality plots.

## 🛠 Tech Stack
* **Tools:** NCBI BLAST+ (CLI)
* **Language:** R
* **Ecosystem:** Bioconductor (`annotate` package), Tidyverse (`ggplot2`, `dplyr`)
