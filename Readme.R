INFO-B 473/B573: Applied Programming for Biomedical Data Analysis/Programming for Science Informatics

 Programmer: jathin yarra

Language: R

script: "R version 4.4.1 bits"

Date Submitted: November 10, 2024.

Description This program performs various analyses on a DNA sequence from the file chr1_GL383518v1_alt.txt. It includes reading the sequence, generating the reverse complement, and analyzing nucleotide frequencies.

Requirements

## Objectives

1. Reading and Printing Specific Characters from a DNA Sequence
   - Read a DNA sequence file (`chr1_GL383518v1_alt.fa`) into R.
   - Print the 10th letter of the sequence.
   - Print the 758th letter of the sequence.

2. Creating and Analyzing the Reverse Complement of the DNA Sequence
   - Generate the reverse complement of the DNA sequence.
   - Print the 79th letter of the reverse complement sequence.
   - Print letters from the 500th to the 800th positions in the reverse complement sequence.

3. Counting Nucleotide Occurrences
   - Count occurrences of each nucleotide (A, C, G, T) for each kilobase (1000 base pairs) in the sequence.
   - Store the results in a list, with each element representing a kilobase segment.

4. Creating and Analyzing Data Frames
   - Create a data frame for the first kilobase, showing counts for each nucleotide.
   - Repeat this operation for all kilobases and compile the results.
   - Create a new row in the data frame for each kilobases counts.
   - Calculate and display the sum of each row.

5. Analysis and Explanation of Results
   - Determine the expected sum for each list.
   - Identify any discrepancies in observed sums.
   - Provide explanations for any differences between expected and observed results.

Instructions

Part 1: Reading and Printing DNA Sequence

1. Read the `chr1_GL383518v1_alt.fa` file and process the sequence data.
2. Print specific characters as specified.

Part 2: Creating the Reverse Complement

1. Transform the sequence into its reverse complement by reversing and substituting base pairs using Watson-Crick-Franklin rules.
2. Extract and print specified characters from the reverse complement.

Part 3: Counting Nucleotides in Kilobase Segments

1. Split the sequence into kilobase segments (1000 base pairs).
2. Count the occurrences of `A`, `C`, `G`, and `T` in each segment.
3. Store the counts in a list.

Part 4: Creating and Analyzing Data Frames

1. Create a data frame for nucleotide counts in the first kilobase.
2. Repeat for all kilobases and compile the results.
3. Add a row containing counts for each kilobase.
4. Calculate and print row sums.
5. Answer questions using comments in the code:
   - What is the expected sum for each list?
   - Are there any discrepancies in observed sums?
   - Provide an explanation for any differences.

How to Run

1. Make sure R is installed on your system.
2. Place `chr1_GL383518v1_alt.fa` in the specified directory.
3. Run the R scripts using an R environment (e.g., RStudio) or through the command line.
4. Follow the comments in the code for specific instructions and explanations.


