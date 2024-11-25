 Programmer: jathin yarra

Language: R

script: "R version 4.4.1 bits"

Date Submitted: November 24, 2024.




### Objective  
This assignment is designed to evaluate your ability to process, analyze, and visualize biomedical data using R. It focuses on leveraging R programming techniques for data analysis and presentation.  

---

### Learning Outcomes  
By completing this assignment, you will:  
- Learn to develop efficient and purposeful R scripts.  
- Gain expertise in data manipulation and preprocessing using R.  
- Enhance your visualization skills with advanced plotting techniques in `ggplot2`.  

---

### Knowledge Areas  
This project will help you deepen your understanding of:  
- Base R functions for data processing.  
- Practical applications of R libraries for data analysis.  
- Strategies for creating professional visualizations with customizable parameters.  

---

### Dataset Details  
The analysis involves the following datasets:  
1. **`Gene_Expression_Data.xlsx`**: Contains expression levels for various genes across different samples.  
2. **`Gene_Information.csv`**: Provides gene-related metadata, such as chromosome location.  
3. **`Sample_Information.tsv`**: Includes metadata for each sample, specifying its phenotype (e.g., tumor or normal).  

---

### Assignment Instructions  

#### Part 1: Data Processing  
1. **Load the datasets**: Import the three files into R for analysis.  
2. **Update sample names**: Modify the sample names in `Gene_Expression_Data.xlsx` to align with the phenotype data in `Sample_Information.tsv`.  
3. **Separate data**: Divide the data into two subsets based on phenotype (tumor and normal).  
4. **Calculate averages**: Compute the average expression for each gene across tumor and normal samples.  
5. **Log2 fold change**: For each gene, calculate the log2 fold change between tumor and normal samples using the formula `log2((Tumor + 1) / (Normal + 1))`.  
6. **Filter significant genes**: Identify genes with absolute fold change values greater than 5.  
7. **Add annotation**: Include a column indicating whether the gene is more highly expressed in tumor or normal samples.  

#### Part 2: Exploratory Data Analysis (EDA)  
8. **Histogram of DEGs**: Create a histogram showing the distribution of differentially expressed genes (DEGs) across chromosomes.  
9. **Sample type histogram**: Generate another histogram, segregating DEGs by chromosome and sample type (tumor or normal).  
10. **Bar chart of DEG proportions**: Create a bar chart to visualize the percentage of DEGs upregulated in tumor samples and downregulated in normal samples.  
11. **Heatmap**: Use the processed gene expression data to create a heatmap visualizing gene expression across samples.  
12. **Clustermap**: Generate a clustermap to explore clustering patterns in gene expression.  
13. **Summary**: Write a brief summary highlighting key findings and referencing the visualizations.  

---

### R Implementation  
The R script utilizes:  
- **Libraries**: `readxl` for reading input files, `ggplot2` for visualizations, `pheatmap` for heatmaps, and `dplyr`/`tidyr` for data manipulation and reshaping.  
- **Data transformations**: Efficient data wrangling techniques for reshaping and processing the datasets.  
- **Visualizations**: Comprehensive plotting techniques to summarize and explore the data.  

Refer to the `assignment5.R` file for the complete implementation.  

---

### Visual Outputs  
The script generates the following visualizations:  
1. **Histogram**: Distribution of DEGs across chromosomes.  
2. **Histogram**: DEG distribution by chromosome and sample type.  
3. **Bar chart**: Proportions of upregulated and downregulated DEGs.  
4. **Heatmap**: Gene expression by sample.  
5. **Clustermap**: Clustering of samples based on gene expression.  

---

### Instructions for Running the Script  
1. Clone this repository:  
   ```bash
   git clone <repository_url>
   cd <repository_name>
