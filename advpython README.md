Programmer: jathin yarra
Language: bash script
Version: 4.4.20;
Date Submitted: September 15, 2024.

Description : Write a shell script (file extension .sh) that will independently perform the following tasks. The end goal should be that a user could download your script from your repository and be able to successfully run it on any bash compatible computer. Accomplishing this, may require some set up work outside of the terminal, but the end product should be entirely independent.

Required Software :
Bash: The script is written for a Bash-compatible shell.
wget: For downloading files from the web.
gunzip: For unzipping.
head: For extracting the first 10 lines of a file.
wc: For counting the number of lines in a file.
touch: command used for creating empty files

Usage Instructions :
Ensure Prerequisites: Make sure you have Bash, `wget`, `gunzip`, `head`, and `wc` installed on your system.

Download the Script: Save the script `introduction to Unix.sh` to your local machine.

Make the Script Executable.
Run the Script:
./introduction to Unix.sh

files created:
Informatics_573: Directory created in the user's home directory.
data_summary.txt: A summary file that provides detailed information about the downloaded files, including the first 10 lines of each file and the total line count for each file.
