#You should create one R script called run_analysis.R that does the following. 
#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names. 
#5. From the data set in step 4, creates a second, independent tidy data set with the average 
#   of each variable for each activity and each subject.

#set working Directory
setwd("C:/R/3_Cleaning")

#Download file
download.file(destfile="./human_data.zip" ,"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" ,method = "auto")
#Unzip file

#Data
#- 'train/X_train.txt': Training set.
#- 'train/y_train.txt': Training labels.
#- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
#- 'test/X_test.txt': Test set.
#- 'test/y_test.txt': Test labels.
#- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

#Data
  #Feature
  #retrieve Feature Label
  featureData <- read.table(unz("./human_data.zip", "UCI HAR Dataset/features.txt"),stringsAsFactors = FALSE)
    
  #Test
  testData <- read.table(unz("./human_data.zip", "UCI HAR Dataset/test/X_test.txt"))
  testActivityIDData <- read.table(unz("./human_data.zip", "UCI HAR Dataset/test/y_test.txt"),col.names = "ActivityID")
  testSubjectIDData <- read.table(unz("./human_data.zip", "UCI HAR Dataset/test/subject_test.txt"),col.names = "SubjectID")
    
  #Add two column
  testData$ActivityID <- testActivityIDData$ActivityID #add additional column
  testData$SubjectID <- testSubjectIDData$SubjectID #add additional column
    
  #Train
  trainData <- read.table(unz("./human_data.zip", "UCI HAR Dataset/train/X_train.txt"))
  trainActivityIDData<- read.table(unz("./human_data.zip", "UCI HAR Dataset/train/y_train.txt"),col.names = "ActivityID")
  trainSubjectIDData<- read.table(unz("./human_data.zip", "UCI HAR Dataset/train/subject_train.txt"),col.names = "SubjectID")
    
  #Add two column
  trainData$ActivityID <- trainActivityIDData$ActivityID #add additional column
  trainData$SubjectID <- trainSubjectIDData$SubjectID #add additional column

#Use of this dataset in publications must be acknowledged by referencing the following publication [1] 
#[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
#This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
#Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

#retrieve activity label
activityData <- read.table(unz("./human_data.zip", "UCI HAR Dataset/activity_labels.txt"),col.names = c("ActivityID","Activity"))

#1. Merges the training and the test sets to create one data set.
mergedData <-rbind(trainData,testData)
colnames(mergedData) <- c(featureData$V2,"ActivityID","SubjectID")

#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
library(plyr)
library(dplyr)
library(tidyr)

#Processing using dplyr - convert to tbl_df
merged <-tbl_df(mergedData)

#extracts only measurement on mean and standard deviation
mergedSelected <- merged[,grepl("(mean\\(\\)|std\\(\\)|Activity|Subject)", colnames(merged))]

#3. Uses descriptive activity names to name the activities in the data set
  mergedSelected$Activity <- activityData$Activity[mergedSelected$ActivityID]
  mergedSelected <- select(mergedSelected,-ActivityID)

#4. Appropriately labels the data set with descriptive variable names. 

  # Cleaning up the names
  names(mergedSelected) <- gsub("-", "", names(mergedSelected))
  names(mergedSelected) <- gsub("^t", "Time", names(mergedSelected))
  names(mergedSelected) <- gsub("^f", "Frequency", names(mergedSelected))
  names(mergedSelected) <- gsub("mean\\(\\)", "Mean", names(mergedSelected))
  names(mergedSelected) <- gsub("std\\(\\)", "Std", names(mergedSelected))
  names(mergedSelected) <- gsub("BodyBody", "Body", names(mergedSelected))

#5. From the data set in step 4, creates a second, independent tidy data set with the average 
#   of each variable for each activity and each subject.

  #A. calculate average of each variable
  tidyData = ddply(mergedSelected, .(Activity, SubjectID), numcolwise(mean))

  #B. output
  write.table(tidyData, file = "./tidyData.txt", row.name=FALSE)
