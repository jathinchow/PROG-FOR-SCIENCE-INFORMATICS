## QUESTION 1
# Open the sequence file in read mode
with open("chr1_GL383518v1_alt.fa", "r") as file:
# Skip the first line (header)
file.readline()
# Read the rest of the file, which contains the sequence
sequence = file.read().replace("\n", "")  # Remove newline characters
# Print the 10th and 758th letters
print(f"The 10th letter is: {sequence[9]}")
print(f"The 758th letter is: {sequence[757]}")


## QUESTION 2
# Open the sequence file and read its content
with open("chr1_GL383518v1_alt.fa", "r") as file:
# Skip the first line (header) and read the sequence
file.readline()
sequence = file.read().replace("\n", "")
complement = {'A': 'T', 'C': 'G', 'G': 'C', 'T': 'A', 'a': 't', 'c': 'g', 'g': 'c', 't': 'a'}
# Find the reverse complement of the sequence
reverse_complement = "".join(complement[base] for base in reversed(sequence))
# Print the 79th letter of the reverse complement
print(f"The 79th letter is: {reverse_complement[78]}")
# Print the 500th through 800th letters of the reverse complement
print(f"The 500th through 800th letters are: {reverse_complement[499:800]}")



## QUESTION 3
# To count nucleotide occurances in kilobase intervals
def count_nucleotides_by_kilobase(sequence, kilobase_size=1000):
# Initialize a list to hold counts for each kilobase
nucleotide_counts = []
# Iterate through the sequence in steps of kilobase_size
for i in range(0, len(sequence), kilobase_size):
# Get the current kilobase segment
kb_segment = sequence[i:i + kilobase_size]  
# Count nucleotides A, C, G, T and store in a list
counts = [kb_segment.count('A'), kb_segment.count('C'), 
kb_segment.count('G'), kb_segment.count('T')] 
# Append counts along with the starting position to the list
nucleotide_counts.append((i, counts)) 
return nucleotide_counts
# Count nucleotides in the sequence
nucleotide_counts = count_nucleotides_by_kilobase(sequence)
# Print nucleotide counts for each kilobase
for kb_start, counts in nucleotide_counts:
print(f"Nucleotide counts in kilobase starting at {kb_start}: "
f"A: {counts[0]}, C: {counts[1]}, G: {counts[2]}, T: {counts[3]}")


## QUESTION 4
# To count nucleotides from part 3
def count_nucleotides_by_kilobase(sequence):
# Counts nucleotides in each kilobase (1000 base pairs) of the sequence
nucleotide_counts = {}
kilobase_size = 1000
# Iterate over the sequence in chunks of kilobases
for i in range(0, len(sequence), kilobase_size):
# Slice the sequence for the current kilobase
kilobase = sequence[i:i + kilobase_size]
# Initialize count for this kilobase
counts = {'A': 0, 'C': 0, 'G': 0, 'T': 0}   
# Count nucleotides in the current kilobase
for nucleotide in kilobase:
if nucleotide in counts:
counts[nucleotide] += 1       
# Store the counts in the dictionary
nucleotide_counts[i // kilobase_size] = counts   
return nucleotide_counts
# Sample sequence for demonstration (replace this with actual DNA sequence)
#sequence = "A" * 500 + "C" * 250 + "G" * 200 + "T" * 50  # Example sequence
# To read dictionary from the count function
nucleotide_counts = count_nucleotides_by_kilobase(sequence)
# To create a list with 4 elements for the first 1000 base pairs
first_kb_counts = [nucleotide_counts[0]['A'], nucleotide_counts[0]['C'], nucleotide_counts[0]['G'], nucleotide_counts[0]['T']]
print("Nucleotide counts in the first 1000 base pairs:", first_kb_counts)
# To repeat for each kilobase and create a list of lists
all_kb_counts = []
# Iterate over the sequence in steps of 1000 bases
for kb_start, counts in nucleotide_counts.items():
# Append the counts to the list of all kilobase counts
all_kb_counts.append([counts['A'], counts['C'], counts['G'], counts['T']])
# Calculate the sum of nucleotide counts for each kilobase
expected_sum = 1000  # Define the expected sum
sums = [sum(kb) for kb in all_kb_counts]
print("Sums of nucleotide counts for each kilobase:", sums)
# To identify kilobases with sums not equal to the expected value
differences = [i for i, s in enumerate(sums) if s != expected_sum]
print("Kilobases with sums not equal to", expected_sum, ":", differences)
# To check if there are any discrepancies
if differences:
    print("The differences are likely due to the fact that the sequence is not perfectly divided into kilobases.")
    print("Some kilobases may have fewer than 1000 base pairs, resulting in a sum less than", expected_sum)
else:
    print("All kilobases have sums equal to", expected_sum)
