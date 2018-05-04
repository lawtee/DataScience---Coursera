# Code Book

##Source Data

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


## SubjectID

The variable represents the subject who performed the activity for each window sample. Its range is from 1 to 30. 
SubjectID: integer

## Activity

The variables represent the activity the subject is doing.

Activity: factor with 6 levels
  - Walking
  - Walking Upstairs
  - Walking Downstairs
  - Sitting
  - Standing
  - Laying

## Measurement Means

All the variables are the mean of a measurement for each subject and activity. 

All variables: num

"TimeBodyAccMeanX"             
"TimeBodyAccMeanY"            
"TimeBodyAccMeanZ"             
"TimeBodyAccStdX"              
"TimeBodyAccStdY"              
"TimeBodyAccStdZ"             
"TimeGravityAccMeanX"          
"TimeGravityAccMeanY"          
"TimeGravityAccMeanZ"          
"TimeGravityAccStdX"          
"TimeGravityAccStdY"           
"TimeGravityAccStdZ"           
"TimeBodyAccJerkMeanX"         
"TimeBodyAccJerkMeanY"        
"TimeBodyAccJerkMeanZ"         
"TimeBodyAccJerkStdX"          
"TimeBodyAccJerkStdY"          
"TimeBodyAccJerkStdZ"         
"TimeBodyGyroMeanX"            
"TimeBodyGyroMeanY"            
"TimeBodyGyroMeanZ"            
"TimeBodyGyroStdX"            
"TimeBodyGyroStdY"             
"TimeBodyGyroStdZ"             
"TimeBodyGyroJerkMeanX"        
"TimeBodyGyroJerkMeanY"       
"TimeBodyGyroJerkMeanZ"        
"TimeBodyGyroJerkStdX"         
"TimeBodyGyroJerkStdY"         
"TimeBodyGyroJerkStdZ"        
"TimeBodyAccMagMean"           
"TimeBodyAccMagStd"            
"TimeGravityAccMagMean"        
"TimeGravityAccMagStd"        
"TimeBodyAccJerkMagMean"       
"TimeBodyAccJerkMagStd"        
"TimeBodyGyroMagMean"          
"TimeBodyGyroMagStd"          
"TimeBodyGyroJerkMagMean"      
"TimeBodyGyroJerkMagStd"       
"FrequencyBodyAccMeanX"        
"FrequencyBodyAccMeanY"       
"FrequencyBodyAccMeanZ"        
"FrequencyBodyAccStdX"         
"FrequencyBodyAccStdY"         
"FrequencyBodyAccStdZ"        
"FrequencyBodyAccJerkMeanX"    
"FrequencyBodyAccJerkMeanY"    
"FrequencyBodyAccJerkMeanZ"    
"FrequencyBodyAccJerkStdX"    
"FrequencyBodyAccJerkStdY"    
"FrequencyBodyAccJerkStdZ"     
"FrequencyBodyGyroMeanX"       
"FrequencyBodyGyroMeanY"      
"FrequencyBodyGyroMeanZ"       
"FrequencyBodyGyroStdX"        
"FrequencyBodyGyroStdY"        
"FrequencyBodyGyroStdZ"       
"FrequencyBodyAccMagMean"      
"FrequencyBodyAccMagStd"       
"FrequencyBodyAccJerkMagMean"  
"FrequencyBodyAccJerkMagStd"  
"FrequencyBodyGyroMagMean"     
"FrequencyBodyGyroMagStd"      
"FrequencyBodyGyroJerkMagMean" 
"FrequencyBodyGyroJerkMagStd" 