QUESTION-2
2A
#Plotting functions
def save_plot(fig, filename):
    #Save the given figure as a PNG file with the specified filename
    fig.savefig(f"{filename}.png", dpi=300, bbox_inches='tight')

2B
Exploratory Data Analysis (EDA)
#Distribution of DEGs (Differentially Expressed Genes) by chromosome
plt.figure(figsize=(12, 6))

2C
#Plot histogram of DEGs by chromosome
sns.histplot(significant_genes['Chromosome'].dropna(), color='skyblue', edgecolor='black')
plt.title('DEGs by Chromosome')  #Set the title of the plot
plt.xticks(rotation=45)  #Rotate x-axis labels for better readability
save_plot(plt, 'DEGs_by_Chromosome')  #Save the plot
plt.show()  #Display the plot

2D
#Plot bar chart of the percentage of DEGs that are upregulated or downregulated
sns.barplot(x=deg_counts.index, y=deg_counts.values, palette=['red', 'blue'])
plt.title('Upregulated vs Downregulated DEGs in Tumor Samples')  # Set the title of the plot
plt.ylim(0, 100)  #Set y-axis limits from 0 to 100 (percentage)
#Annotate each bar with the percentage value
for i, value in enumerate(deg_counts.values):
    plt.text(i, value + 1, f"{value:.2f}%", ha='center')
save_plot(plt, 'Upregulated_vs_Downregulated')  # Save the plot
plt.show()  #Display the plot

2E
#Heatmap of gene expression for all samples
plt.figure(figsize=(12, 8))
#Plot heatmap of gene expression values for all probes (genes) and samples
sns.heatmap(gene_expression_data.set_index('Probe_ID'), cmap='coolwarm', cbar_kws={'label': 'Expression Level'})
plt.title('Heatmap of Gene Expression')  # Set the title of the plot
save_plot(plt, 'Heatmap_Gene_Expression')  # Save the heatmap as a PNG file
plt.show()  # Display the heatmap

2F
#Clustermap of gene expression (sampled for large datasets)
#If there are more than 1000 rows, take a 30% sample of the data to keep the plot manageable
sampled_data = gene_expression_data.sample(frac=0.3).set_index('Probe_ID') if gene_expression_data.shape[0] > 1000 else gene_expression_data.set_index('Probe_ID')
#Plot a clustermap to visualize the relationship between genes and samples (clustered by expression levels)
sns.clustermap(sampled_data, cmap='coolwarm', figsize=(14, 10), cbar_kws={'label': 'Expression Level'})
plt.title('Clustermap of Gene Expression (Sampled)')  # Set the title of the plot
plt.show()  #Display the clustermap

2G
