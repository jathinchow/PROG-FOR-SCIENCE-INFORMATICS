with open("chr1_GL383518v1_alt.fa", "r") as file:
    # Skip the first line (header)
    file.readline()
    
    # Read the rest of the file, which contains the sequence
    sequence = file.read().replace("\n", "")  # Remove newline characters

# Print the 10th and 758th letters
print(f"The 10th letter is: {sequence[9]}")
print(f"The 758th letter is: {sequence[757]}")
