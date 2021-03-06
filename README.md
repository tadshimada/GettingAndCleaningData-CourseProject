# Introduction
This repository includes the script, 'run_analysis.R', which does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Data
The data used for this analysis can be downloaded from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

When running the R script, you will need to download the data manually, then unzip it into the sub-directory ('UCI HAR Dataset') where the R script is located. 

# Tidy Dataset
The repository also includes the tidy dataset generated by the R script. 

# Dependency
Aside from the raw data files, you will need to have R Studio installed on your system to run the R script. In addition, you should have the 'reshape2' R package installed. 

# How to run the script
1. Clone this Github repository.
2. Launch R Studio.
3. In R Studio console, set your working directory to the directory where you cloned the repo. Also make sure that you have the UCI Hare Dataset in the same directory.
4. Open the R script (run_analysis.R) in R Studio, then click 'Source' to run it.
5. When it completes, you should see 'tidy-dataset.txt' file generated by the script.

# System Environment
The R script was implemented using R version 3.2.2 on Mac OS X (El Capitan v10.11.2). 
