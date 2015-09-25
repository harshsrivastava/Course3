##Course3

### Source of Original Data ###
The "run\_analysis.R" script creates a method of calculating the average of each of the variables from the data set that can be found at the following URL: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). The data set is part of the data collected for the "Human Activity Recognition Using Smartphones Dataset" collected by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory. For more information see the UCI machine Learning Repository located at [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

For each record in the original dataset it is provided: 

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

This description is from the original README.txt file supplied with original data set.

#### The files containing the original observations were: <br/>
[1] activity\_labels.txt: Links the class labels with their activity name<br/>
[2] train/X\_train.txt: Training data set<br/>
[3] train/y\_train.txt: Training labels associated with training data<br/>
[4] test/X\_test.txt: Test data set<br/>
[5] test/y\_test.txt: Test labels associated with test data<br/>
[6] features.txt: file used to get variable names for final results

### Subset of data used for this analysis ###
The subset of data returned by the "run_analysis.R" script had 81 variables with 180 observations (rows). At the end of this document is a list of the variables, their class/type, and some sample values for each variable (column) 

### Process of the "run_analysis. R" script ###
The following is the step by step process initiated by the "run_analysis" script:

[1] required data files from UCI HAR Dataset are loaded into variables: X\_train, X\_test, y\_train, y\_test, features, and activity\_labels (all of these data sets are in text files)<br/>
[2] columns in training and test data sets are assigned appropriate variable names<br/>
[3] load the dplyr library<br/>
[4] do inner joins on activity labels and y train and test data to replace numbers with labels for each of the data set rows<br/>
[5] add column names to subject and activity data sets<br/>
[6] combine the various data sets into a single data sets (creates a tidy data set<br/>
[7] select only those columns that are related to subject, activity, mean, and standard deviation (std) creating a subset<br/>
[8] summarize the subset of data into column means and standard deviations (remove na)<br/>
[9] write final tidy data set to text file<br/>
[10] remove all variables from environment (clean up)