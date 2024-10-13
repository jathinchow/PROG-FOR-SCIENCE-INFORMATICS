QUESTION-1
1A
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
# Load gene expression data from an Excel file
gene_expression_data = pd.read_excel('Gene_Expression_Data.xlsx')
# Load gene information from a CSV file
gene_information = pd.read_csv('Gene_Information.csv')
# Load sample information from a TSV file (tab-separated values)
sample_information = pd.read_csv('Sample_Information.tsv', sep='\t')

1B
#Rename columns to include phenotype information
# Create a mapping of sample names to phenotype groups (e.g., tumor or normal)
phenotype_map = sample_information.set_index(sample_information.index)['group'].to_dict()
# Rename columns by appending phenotype information to each sample name
gene_expression_data.rename(
    columns={col: f"{col}_{phenotype_map.get(col)}" for col in gene_expression_data.columns[1:]}, inplace=True
)

1C
#Separate tumor and normal sample data
# Filter columns containing '_tumor' and '_normal' and set 'Probe_ID' as the index
tumor_data = gene_expression_data.filter(regex='_tumor').set_index(gene_expression_data['Probe_ID'])
normal_data = gene_expression_data.filter(regex='_normal').set_index(gene_expression_data['Probe_ID'])

1D
#Calculate average expression values for tumor and normal samples
tumor_avg = tumor_data.mean(axis=1)  # Mean expression across tumor samples
normal_avg = normal_data.mean(axis=1)  # Mean expression across normal samples

1E
#Calculate fold change between tumor and normal samples
# Fold change is calculated as the difference between tumor and normal averages, normalized by normal average
fold_change = (tumor_avg - normal_avg) / normal_avg

1F
#Identify significant genes with fold change greater than 5 (positive or negative)
significant_genes = fold_change[fold_change.abs() > 5].reset_index()  # Select genes with high fold change
significant_genes.columns = ['Probe_ID', 'Fold_Change']  # Rename columns for clarity
# Merge significant genes with gene information based on 'Probe_ID'
significant_genes = significant_genes.merge(gene_information, on='Probe_ID')
# Add a column to indicate whether the expression is higher in tumor or normal samples
significant_genes['Higher_Expression'] = significant_genes['Fold_Change'].apply(
    lambda x: 'Tumor' if x > 0 else 'Normal'
)
print(significant_genes)  # Print the resulting significant genes DataFrame



QUESTION-2
2A
# Plotting functions
def save_plot(fig, filename):
    # Save the given figure as a PNG file with the specified filename
    fig.savefig(f"{filename}.png", dpi=300, bbox_inches='tight')

2B
#Exploratory Data Analysis (EDA)
# Distribution of DEGs (Differentially Expressed Genes) by chromosome
plt.figure(figsize=(12, 6))
# Plot histogram of DEGs by chromosome
sns.histplot(significant_genes['Chromosome'].dropna(), color='skyblue', edgecolor='black')
plt.title('DEGs by Chromosome')  # Set the title of the plot
plt.xticks(rotation=45)  # Rotate x-axis labels for better readability
save_plot(plt, 'DEGs_by_Chromosome')  # Save the plot
plt.show()  # Display the plot

