# Getting and Cleaning Data Course Project

## The R code: run_analysis.R

Objectives   
You should create one R script called run_analysis.R that does the following.   
1. Merges the training and the test sets to create one data set.   
2. Extracts only the measurements on the mean and standard deviation for each measurement.    
3. Uses descriptive activity names to name the activities in the data set.   
4. Appropriately labels the data set with descriptive variable names.   
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.   

## The script performs the following:

### Set working Directory

### Pre Data Processing
A. Download Data file from webpage

Information from README.txt file
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

A. Obtain the Feature Data
  
B. Obtain the test Data and add additional two column for SubjectId and ActivityID

C. Obtain the train Data and add additional two column for SubjectId and ActivityID
 
A. Obtain the Activity Data

###1. Merges the training and the test sets to create one data set.

A. Merge the test and train dataset together

B. Add the column names to the merged dataset

###2. Extracts only the measurements on the mean and standard deviation for each measurement. 

A. Load the required libraries

B. Convert to tbl_df for modifications

C. Extracts only measurement on mean and standard deviation


###3. Uses descriptive activity names to name the activities in the data set
  mergedSelected$Activity <- activityData$Activity[mergedSelected$ActivityID]
  mergedSelected <- select(mergedSelected,-ActivityID)

###4. Appropriately labels the data set with descriptive variable names. 

Cleaning up the names
  
### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

A. calculate average of each variable
  
B. output the tidy Data to tidyData.txt
    
####Use of this dataset in publications must be acknowledged by referencing the following publication
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.Use of this dataset in publications must be acknowledged by referencing the following publication [1] 
