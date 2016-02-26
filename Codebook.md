## Getting and Cleaning Data Project 
  
 Catherine O'Neill 
  
 
  
### Source Data 
A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 
 
 [The source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
 
### Data Set Information 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.  

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 
 
### Attribute Information 
 Each record in the data set provides:  
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.  
- Triaxial Angular velocity from the gyroscope.  
 - A 561-feature vector with time and frequency domain variables.  
- Its activity label.  
 - An identifier of the subject who carried out the experiment. 
  
## Section 1. Setup   
  Set  the source directory for the files. Pull the zip file from the web if not already done. Bring in the data.  Use gsub to only pull in the features of Mean and Std.

     activityLables <- activityLables_labels.txt
     features <- features.txt  

  TRAIN DATASETS

     subjectstrain <- subject_train.txt
     Xtrain <- X_train.txt
     Ytrain <- Y_train.txt

  TEST DATASETS 

     subjectstest <- test/subject_train.txt
     Xtest <- X_test.txt
     Ytest <- Y_test.txt



  
 
## Section 2. Combine the datasets and name the columns
   Combine the subject, test and train datasets. Turn activities and subjects into factors  

  
## Section 3. Create a second, independent tidy data set with the average of each variable for each activity and each subject.  
 Per the project instructions, only  produce  a data set with the mean and standard 
