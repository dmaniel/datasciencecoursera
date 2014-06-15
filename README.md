The file run_analysis.R process the test and training data described in [1] and produces a tidy dataset as output.
The tidy dataset file "tidyDataSet.txt" is created in the working directory and contains the following variables
"activity_code" 
"tBodyAcc-mean()-X" 
"tBodyAcc-mean()-Y" 
"tBodyAcc-mean()-Z" 
"tGravityAcc-mean()-X" 
"tGravityAcc-mean()-Y" 
"tGravityAcc-mean()-Z" 
"tBodyAccJerk-mean()-X" 
"tBodyAccJerk-mean()-Y" 
"tBodyAccJerk-mean()-Z" 
"tBodyGyro-mean()-X" 
"tBodyGyro-mean()-Y" 
"tBodyGyro-mean()-Z" 
"tBodyGyroJerk-mean()-X" 
"tBodyGyroJerk-mean()-Y" 
"tBodyGyroJerk-mean()-Z" 
"tBodyAccMag-mean()" 
"tGravityAccMag-mean()" 
"tBodyAccJerkMag-mean()" 
"tBodyGyroMag-mean()" 
"tBodyGyroJerkMag-mean()" 
"fBodyAcc-mean()-X" 
"fBodyAcc-mean()-Y" 
"fBodyAcc-mean()-Z" 
"fBodyAcc-meanFreq()-X" 
"fBodyAcc-meanFreq()-Y" 
"fBodyAcc-meanFreq()-Z" 
"fBodyAccJerk-mean()-X" 
"fBodyAccJerk-mean()-Y" 
"fBodyAccJerk-mean()-Z" 
"fBodyAccJerk-meanFreq()-X" 
"fBodyAccJerk-meanFreq()-Y" 
"fBodyAccJerk-meanFreq()-Z" 
"fBodyGyro-mean()-X" 
"fBodyGyro-mean()-Y" 
"fBodyGyro-mean()-Z" 
"fBodyGyro-meanFreq()-X" 
"fBodyGyro-meanFreq()-Y" 
"fBodyGyro-meanFreq()-Z" 
"fBodyAccMag-mean()" 
"fBodyAccMag-meanFreq()" 
"fBodyBodyAccJerkMag-mean()" 
"fBodyBodyAccJerkMag-meanFreq()" 
"fBodyBodyGyroMag-mean()" 
"fBodyBodyGyroMag-meanFreq()" 
"fBodyBodyGyroJerkMag-mean()" 
"fBodyBodyGyroJerkMag-meanFreq()" 
"activity_desc" 
"subject_code"

The script assumes that the following files are available in the working directory:
- "UCI HAR Dataset/test/X_test.txt"
- "UCI HAR Dataset/train/X_train.txt"
- "UCI HAR Dataset/features.txt" 
- "UCI HAR Dataset/test/y_test.txt"
- "UCI HAR Dataset/train/y_train.txt"
- "UCI HAR Dataset/activity_labels.txt".

The script first merges the test and training datasets of the study into a single dataframe. The test and training datasets are contained in the files "UCI HAR Dataset/test/X_test.txt" and "UCI HAR Dataset/train/X_train.txt". The script then adds to the data frame the descriptions of the attributes contained in the file "UCI HAR Dataset/features.txt" 
The script then creates an intermediary dataframe, myXvaluesMeanStd, that contains only the mean and the standard deviation of the merged dataframe.
In the next step, only the attributes related to the mean are considered and the activity code is added to the observation. The activity codes are stored in the files "UCI HAR Dataset/test/y_test.txt" and "UCI HAR Dataset/train/y_train.txt".
Finally, the script adds:
- the activity descriptions contained in the file "UCI HAR Dataset/activity_labels.txt",
- the subject identifiers from the files "UCI HAR Dataset/test/subject_test.txt" and "UCI HAR Dataset/train/subject_train.txt".
Finally the script creates the output file "tidyDataSet.txt".


[1] http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones [2] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
