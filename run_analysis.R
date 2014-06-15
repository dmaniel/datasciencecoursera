#The file run_analysis.R process the test and training data described in [1] and produces a tidy dataset as output.
#The tidy dataset file "tidyDataSet.txt" is created in the working directory
#The script assumes that the following files are available in the working directory:
# - "UCI HAR Dataset/test/X_test.txt"
#- "UCI HAR Dataset/train/X_train.txt"
#- "UCI HAR Dataset/features.txt" 
#- "UCI HAR Dataset/test/y_test.txt"
#- "UCI HAR Dataset/train/y_train.txt"
#- "UCI HAR Dataset/activity_labels.txt".

#The script first merges the test and training datasets of the study into a single dataframe. The test and training datasets are contained in the files "UCI HAR Dataset/test/X_test.txt" and "UCI HAR Dataset/train/X_train.txt". The script then adds to the data frame the descriptions of the attributes contained in the file "UCI HAR Dataset/features.txt" 
#The script then creates an intermediary dataframe, myXvaluesMeanStd, that contains only the mean and the standard deviation of the merged dataframe.
#In the next step, only the attributes related to the mean are considered and the activity code is added to the observation. The activity codes are stored in the files "UCI HAR Dataset/test/y_test.txt" and "UCI HAR Dataset/train/y_train.txt".
#Finally, the script adds:
#  - the activity descriptions contained in the file "UCI HAR Dataset/activity_labels.txt",
#- the subject identifiers from the files "UCI HAR Dataset/test/subject_test.txt" and "UCI HAR Dataset/train/subject_train.txt".
#Finally the script creates the output file "tidyDataSet.txt".

mytestXvalues <- read.table("UCI HAR Dataset/test/X_test.txt", comment.char = "", colClasses="numeric")
mytrainXvalues <- read.table("UCI HAR Dataset/train/X_train.txt", comment.char = "", colClasses="numeric")

myXvalues<-rbind(mytestXvalues,mytrainXvalues)

myFeatures <- read.table("UCI HAR Dataset/features.txt", comment.char = "")

names(myXvalues) <-myFeatures[,2]

MeanStdColumns<-grep("mean|std",myFeatures[,2])

myXvaluesMeanStd<-myXvalues[,MeanStdColumns]

meanColumns<-grep("mean",names(myXvaluesMeanStd))
myXvaluesMeanStd<-myXvaluesMeanStd[,meanColumns]

mytestYvalues <- read.table("UCI HAR Dataset/test/y_test.txt", comment.char = "", colClasses="numeric")
mytrainYvalues <- read.table("UCI HAR Dataset/train/y_train.txt", comment.char = "", colClasses="numeric")
myYvalues<-rbind(mytestYvalues,mytrainYvalues)
names(myYvalues)=c("activity_code")

myXvaluesMeanStd<-cbind(myXvaluesMeanStd,myYvalues)

myActivityLabel <- read.table("UCI HAR Dataset/activity_labels.txt", comment.char = "")
names(myActivityLabel)=c("activity_code","activity_desc")

myTidyDataset <- merge(myXvaluesMeanStd,myActivityLabel,by="activity_code")


mytestSubjectvalues <- read.table("UCI HAR Dataset/test/subject_test.txt", comment.char = "", colClasses="numeric")
mytrainSubjectvalues <- read.table("UCI HAR Dataset/train/subject_train.txt", comment.char = "", colClasses="numeric")
mySubjectvalues<-rbind(mytestSubjectvalues,mytrainSubjectvalues)
names(mySubjectvalues)=c("subject_code")

myTidyDataset<-cbind(myTidyDataset,mySubjectvalues)

# write the tidy data frame to file
write.table(myTidyDataset,file="tidyDataSet.txt",row.names = F)
