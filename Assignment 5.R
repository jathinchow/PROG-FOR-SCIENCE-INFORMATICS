# QUESTION 1

# Load necessary libraries
library(openxlsx) # For reading Excel files
library(dplyr)    # For data manipulation
library(tidyr)    # For reshaping data

# Set working directory (adjust path if necessary)
setwd("C:/Users/Public/Downloads")

# Load data
gene_expr_data <- read.xlsx("Gene_Expression_Data.xlsx", sheet = 1)  # Load Excel file
sample_info <- read.delim("Sample_Information.tsv")                  # Load TSV file

# Ensure consistent column naming in sample_info
colnames(sample_info)[colnames(sample_info) == "group"] <- "SampleID"

# Reshape gene expression data to long format and merge with sample information
merged_data <- gene_expr_data %>%
  pivot_longer(
    cols = -Probe_ID,        # Keep Probe_ID column intact
    names_to = "SampleID",   # New column for sample IDs
    values_to = "Expression" # Column for expression values
  ) %>%
  left_join(sample_info, by = "SampleID") %>%        # Merge phenotype information
  mutate(
    SampleID = paste(SampleID, ifelse(patient == "tumor", "Tumor", "Normal"), sep = "_")
  )

# Reshape back to wide format with updated sample names
updated_gene_expr_data <- merged_data %>%
  select(Probe_ID, SampleID, Expression) %>%
  pivot_wider(
    names_from = SampleID,
    values_from = Expression
  )

# View and save the updated gene expression data
cat("\nUpdated Gene Expression Data:\n")
print(head(updated_gene_expr_data))  # Display a preview of the updated data

write.csv(updated_gene_expr_data, "Updated_Gene_Expression_Data.csv", row.names = FALSE)
cat("\nUpdated data saved to 'Updated_Gene_Expression_Data.csv'\n")




# QUESTION 2 

# Load necessary libraries
library(readxl)     # For reading Excel files
library(ggplot2)    # For visualization
library(pheatmap)   # For heatmap visualizations
library(dplyr)      # For data manipulation
library(tidyr)      # For reshaping data

# 1.a Reading gene expression data, gene information data, sample information data
gene_expression_data <- read_excel('C:/Users/Public/Downloads/Gene_expression_data.xlsx')  # Load gene expression data
gene_information <- read.csv('C:/Users/Public/Downloads/Gene_information.csv')            # Load gene metadata
sample_information <- read.table('C:/Users/Public/Downloads/sample_information.tsv', 
                                  header = TRUE, sep = '\t')                              # Load sample information

# 1.b Changing the sample names from the “Gene_Expression_Data.xlsx” based on the phenotype in “Sample_Information.tsv”
phenotypes <- gsub("\\s.*", "", sample_information$group)                                 # Extract phenotypes
new_column_names <- paste0(phenotypes, '_', colnames(gene_expression_data)[-1])           # Create new column names
colnames(gene_expression_data)[-1] <- new_column_names                                    # Update column names in data

# 1.c Splitting the merged data into two parts based on their labeled phenotype
tumor_table <- gene_expression_data[, c(1, grep("^t", colnames(gene_expression_data)))]   # Extract tumor columns
normal_table <- gene_expression_data[, c(1, grep("^n", colnames(gene_expression_data)))]  # Extract normal columns

# 1.d Computing the average expression for each probe from the two data sets
t_averages <- rowMeans(tumor_table[, -1], na.rm = TRUE)                                   # Average for tumor samples
n_averages <- rowMeans(normal_table[, -1], na.rm = TRUE)                                  # Average for normal samples

# 1.e Determining the fold change for each probe between the two groups
fold_change <- log2((t_averages + 1) / (n_averages + 1))                                  # Compute log2 fold change

# 1.f Identifying all genes fold change magnitude (absolute value) greater than 5
significant_indices <- which(abs(fold_change) > 5)                                       # Find significant genes
filtered_data <- data.frame(Probe_ID = gene_information$Probe_ID[significant_indices],   # Extract gene IDs
                            Fold_Change = fold_change[significant_indices])              # Extract fold changes

# 1.g Adding a column to indicate if the gene was higher expressed in “Normal” or “Tumor” samples
filtered_data$Higher_Expression <- ifelse(filtered_data$Fold_Change > 0, 'Tumor', 'Normal')  # Annotate higher expression
filtered_data <- merge(filtered_data, gene_information[, c("Probe_ID", "Chromosome")], 
                       by = "Probe_ID", all.x = TRUE)                                    # Add chromosome info

# Output
print(filtered_data)                                                                      # Print results to console
View(filtered_data)                                                                       # Open results in viewer

# Optional: Save the results to a CSV file
write.csv(filtered_data, "C:/Users/Public/Downloads/Significant_Genes_Results.csv", row.names = FALSE)  # Save to CSV
cat("Results saved to 'Significant_Genes_Results.csv'\n")                                 # Confirmation message
