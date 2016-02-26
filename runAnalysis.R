# Coursera Getting and Cleaning Data Course Project 
# Catherine O'Neill
# 02/21/2016
# runAnalysis.r File Description: 
# This script will perform the following steps on the UCI HAR Dataset downloaded from  
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
# 1. Merge the training and the test sets to create one data set. 
# 2. Extract only the measurements on the mean and standard deviation for each measurement.  
# 3. Use descriptive activityLables names to name the activities in the data set 
# 4. Appropriately label the data set with descriptive activityLables names.  
# 5. Creates a second, independent tidy data set with the average of each variable for each activityLables and each subject.  

##  Set working directory   

 
# Clean up workspace 
rm(list=ls());


# Load Libraries

library(data.table);
library(dplyr);
library(reshape2);
## Set working directory



# 1. Merge the training and the test sets to create one data set.
#LIST OF VARIABLES AND DATASETS USED
#
#     activityLables <- activityLables_labels.txt
#     features <- features.txt

#  TRAIN DATASETS
#     subjectstrain <- subject_train.txt
#     Xtrain <- X_train.txt
#     Ytrain <- Y_train.txt

#  TEST DATASETS 

#     subjectstest <- test/subject_train.txt
#     Xtest <- X_test.txt
#     Ytest <- Y_test.txt

#  Bring in the train data sets  

 

 filename <- "getdata.zip" 
 

 ## Download and unzip the dataset: 
 if (!file.exists(filename)){ 
       fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip " 
       download.file(fileURL, filename) 
     }   
 if (!file.exists("UCI HAR Dataset")) {  
      unzip(filename)  
     } 


activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt"); 

features <- read.table("UCI HAR Dataset/features.txt");

# Extract only the data on mean and standard deviation 
 SelectCols <- grep(".*mean.*|.*std.*", features[,2]) 
 SelectCols.names <- features[SelectCols,2] 
 SelectCols.names = gsub('-mean', 'Mean', SelectCols.names) 
 SelectCols.names = gsub('-std', 'Std', SelectCols.names) 
 SelectCols.names <- gsub('[-()]', '', SelectCols.names)


subjectstrain <- read.table("UCI HAR Dataset/train/subject_train.txt");

Xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")[SelectCols] 
Ytrain <- read.table("UCI HAR Dataset/train/Y_train.txt");

#  Bring in the test data sets  

subjectstest <- read.table("UCI HAR Dataset/test/subject_test.txt");
Xtest <- read.table("UCI HAR Dataset/test/X_test.txt")[SelectCols];
Ytest <- read.table("UCI HAR Dataset/test/Y_test.txt");



# combine the datasets
combineTest <- cbind(subjectstest,Ytest,Xtest);
combineTrain <- cbind(subjectstrain,Ytrain,Xtrain);
combineAll <- rbind(combineTrain,combineTest);
colnames(combineAll) <- c("subject", "activity", SelectCols.names)


# turn activities & subjects into factors 
combineAll$activity <- factor(combineAll$activity, levels = activityLabels[,1], labels = activityLabels[,2]) 
combineAll$subject <- as.factor(combineAll$subject) 
combineAll.melted <- melt(combineAll, id = c("subject", "activity")) 
combineAll.mean <- dcast(combineAll.melted, subject + activity ~ variable, mean); 
 
 
 write.table(combineAll.mean, "tidy.txt", row.names = FALSE, quote = FALSE); 
