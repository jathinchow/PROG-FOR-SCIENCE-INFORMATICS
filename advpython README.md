Programmer: jathin yarra
Language: Python
Version: 3.12.0;
Date Submitted: Octoberr 13, 2024.

Description :
This project is about EDA of DEGs to understand their distribution and expression pattern in tumor versus normal samples. This type of analysis helps to bring some light into the involvement of particular genes and chromosomes in tumorigenesis and possible targets for therapy. This README summarises the major steps of the analysis and the visualisation that have been generated in the process

Data Files: Raw gene expression data and DEGs data are not included for privacy reasons. 
Notebooks: Jupyter notebooks used for data analysis and visualization. 
Figures: Exported visualizations in PNG/JPEG format. Results 
Summary: A summary of findings from the analysis.
Analysis Steps 
1. Preliminary EDA on Gene Data Basic exploration of gene expression data for missing values, outliers, and general characteristics of the dataset.
2. 2. Visualization of DEGs Distribution
Histogram of DEGs by Chromosome: It gives a view of the distribution of the number of DEGs across chromosomes.
Histogram of DEGs by Sample Type: Normal vs. Tumor: It specifies how many DEGs by chromosome are further segregated based on sample types, either normal or tumor.
3. Gene Regulation Analysis Bar Chart of Up- and Downregulated Genes in Tumor Samples: This depicts the percentage of DEGs that are upregulated or downregulated in tumor samples.
4. A heatmap visualizes gene expression by sample to emphasize the difference in gene expression pattern across samples.
5. Clustermap for Gene Expression Clustering

Key Findings
Distribution Across Chromosomes:
DEGs are not uniformly distributed across all chromosomes; some chromosomes have a higher frequency of DEGs that might imply their active involvement in tumorigenesis.

Sample Types Differences:
DEG is highly significantly different between tumor and normal samples, which may indicate possible chromosomal hotspots of a tumor.

Regulation Patterns
In the tumor samples, a high percentage of up-regulated genes might suggest active over-expression of genes that can induce or propagate a tumor.

Expression Clusters
Clustering analysis showed gene networks and sample groupings, providing insight into how genes might interact with each other and giving similarities between different tumor samples.

Usage Requirements :
Python 3.x
Jupyter Notebook
Dependencies: pandas, matplotlib, seaborn, numpy, scipy Setup: Clone repository. Run bash Copy pip install pandas matplotlib seaborn numpy scipy Followed by running the various Jupyter notebooks to recreate the analysis. Usage: Place data files in the notebooks. Execute cells in sequence to perform EDA and build charts. Save or display visualizations, as needed. Additional Notes Personalization Encouraged: Please modify visualization parameters-appropriate color schemes, axis labels-in code for readability and aesthetics. Bonus Extensions:
Additional embellishments to include custom color palettes and plot annotations were added using matplotlib and seaborn to enhance the aesthetic appearance of the analysis.
