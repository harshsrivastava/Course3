#Course3

##Reading
1.1 read all the files in sequence, the activity labels followed by subject labels followed by observations. 
1.2. first read all the training files followed by the test files 

##Merging
1. Merge the trainig files into one big file.
2. Merge the test files into one big file. 
3. Complete the merge of the entire dataset by combining files from steps 1 and 2. 

##extract std and mean columns
1. used grepl function on headers file to understand what indices contain std and mean in the name
2. based on the indices identified from previous step, extract the required set of columns

##Renaming activity labels for activities and datasets
##Split using dcast function on the extracted data based on the activity and subject factors
##Used tapply on the split dataset to get means for each variable based on subjects and activities
