# Title: BLAST Result Processing & Validation
# Author: Daniil Gerasimov
# =========================================================================

# 1. Environment Setup
if (!require("BiocManager", quietly = TRUE)) install.packages("BiocManager")
pacman::p_load(tidyverse, annotate, ggrepel)

# 2. Loading Tabular BLAST Data
# Fields: query, subject, % identity, alignment length, mismatches, gaps, 
# q_start, q_end, s_start, s_end, evalue, bit_score
blast_results <- read.table("data/blast_output.txt", header = FALSE, comment.char = "#")

colnames(blast_results) <- c("query", "subject", "identity", "aln_length", 
                             "mismatches", "gaps", "q_start", "q_end", 
                             "s_start", "s_end", "evalue", "bit_score")

# 3. Filtering "Gold Standard" Hits
# Filtering criteria: E-value near zero and high sequence identity
significant_hits <- blast_results %>%
  filter(evalue < 1e-15) %>%
  filter(identity > 80) %>%
  arrange(evalue)

# 4. Visualization: Hit Significance vs Identity
# This plot helps visualize the quality of our genomic matches
ggplot(significant_hits, aes(x = identity, y = -log10(evalue))) +
  geom_point(aes(size = aln_length, color = bit_score), alpha = 0.6) +
  scale_color_viridis_c(option = "magma") +
  theme_minimal() +
  labs(title = "BLAST Identification Significance",
       x = "Sequence Identity (%)",
       y = "-Log10(E-value)",
       size = "Alignment Length",
       color = "Bit Score")

# 5. Save the identified species list
write.csv(significant_hits, "results/identified_sequences.csv", row.names = FALSE)
