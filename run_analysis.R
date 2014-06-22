##########################################################################################################

## Here is the code for the getting the tiday data set from the given data set about Samsung.

##Note - Ensure that your working directory points to the samsung data set provided in the assignment

## Author : Spoorthy Raman
##########################################################################################################


## Clean up workspace
rm(list=ls())

##Section 1. Merge the training and the test sets to create one data set.


## Read in the data from files in the directory

features     = read.table('./features.txt',header=FALSE); ##imports features.txt
activityType = read.table('./activity_labels.txt',header=FALSE); ##imports activity_labels.txt
subjectTrain = read.table('./train/subject_train.txt',header=FALSE); ##imports subject_train.txt
xTrain       = read.table('./train/x_train.txt',header=FALSE); ##imports x_train.txt
yTrain       = read.table('./train/y_train.txt',header=FALSE); ##imports y_train.txt

## Assigin readable column names to the data imported above
colnames(activityType)  = c('activityId','activityType');
colnames(subjectTrain)  = "subjectId";
colnames(xTrain)        = features[,2]; 
colnames(yTrain)        = "activityId";

## Create the final training set by column merging yTrain, subjectTrain, and xTrain
trainingData = cbind(yTrain,subjectTrain,xTrain);

## Read in the test data
subjectTest = read.table('./test/subject_test.txt',header=FALSE); ##imports subject_test.txt
xTest       = read.table('./test/x_test.txt',header=FALSE); ##imports x_test.txt
yTest       = read.table('./test/y_test.txt',header=FALSE); ##imports y_test.txt

## Assign readable column names to the test data imported above
colnames(subjectTest) = "subjectId";
colnames(xTest)       = features[,2]; 
colnames(yTest)       = "activityId";


## Create the final test set by column merging the xTest, yTest and subjectTest data
testData = cbind(yTest,subjectTest,xTest);


## Combine training and test data to create a final data set by row merging the 2
finalData = rbind(trainingData,testData);

## Create a vector for the column names from the finalData, which will be used
## to select the desired mean() & stddev() columns
colNames  = colnames(finalData); 

####At the end of this section, we have a single data set to work up on#####
##################################################################################

## Section 2. Extract only the measurements on the mean and standard deviation for each measurement.

## Create a logicalVector that contains TRUE values for the ID, mean() & stddev() columns and FALSE for others. The grepL command is used to pattern match the column names and then create a vector of column names that we are intersted in. "?grepl" for more info
logicalVector = (grepl("activity..",colNames) | grepl("subject..",colNames) | grepl("-mean..",colNames) & !grepl("-meanFreq..",colNames) & !grepl("mean..-",colNames) | grepl("-std..",colNames) & !grepl("-std()..-",colNames));

# Subset finalData table based on the logicalVector to keep only desired columns
finalData = finalData[logicalVector==TRUE];

##### At the end of this section, there is a trimmed data set that has only the columns that we need ##########
##################################################################################

## Section 3. Use descriptive activity names to name the activities in the data set

## Merge the finalData set with the acitivityType table to include descriptive activity names
finalData = merge(finalData,activityType,by='activityId',all.x=TRUE);

## Updating the colNames vector to include the new column names after merge
colNames  = colnames(finalData);

###### At the end of this stage we have a dataset that contains readble activity names for the data present#########
##################################################################################

##Section 4: Appropriately label the data set with descriptive variable names.

## Cleaning up the variable names. The loop examines the names of each column and based on the text present, assigns a standard text across for all columns. Examp - mean is renamed to Mean for all types of means. Some of the names are exapnded for better readability - GyroMag is renamed to GyroMagnitude. Pattern matching is used to eliminate the noise and replace the text."?gsub" for more info
for (i in 1:length(colNames)) 
{
  colNames[i] = gsub("\\()","",colNames[i])
  colNames[i] = gsub("-std$","StdDev",colNames[i])
  colNames[i] = gsub("-mean","Mean",colNames[i])
  colNames[i] = gsub("^(t)","time",colNames[i])
  colNames[i] = gsub("^(f)","freq",colNames[i])
  colNames[i] = gsub("([Gg]ravity)","Gravity",colNames[i])
  colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i])
  colNames[i] = gsub("[Gg]yro","Gyro",colNames[i])
  colNames[i] = gsub("AccMag","AccMagnitude",colNames[i])
  colNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",colNames[i])
  colNames[i] = gsub("JerkMag","JerkMagnitude",colNames[i])
  colNames[i] = gsub("GyroMag","GyroMagnitude",colNames[i])
};

# Reassigning the new descriptive column names to the finalData set
colnames(finalData) = colNames;

###### At the end the data has all columns that are more readable#########
##################################################################################

## Section 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

## Create a new table, finalDataNoActivityType without the activityType column
finalDataNoActivityType  = finalData[,names(finalData) != 'activityType'];

## Summarizing the finalDataNoActivityType table to include just the mean of each variable for each activity and each subject. This is an aggregate operation that calculates the mean per subjectID and activityID
tidyData    = aggregate(finalDataNoActivityType[,names(finalDataNoActivityType) != c('activityId','subjectId')],by=list(activityId=finalDataNoActivityType$activityId,subjectId = finalDataNoActivityType$subjectId),mean);

## Merging the tidyData with activityType to include descriptive acitvity names
tidyData    = merge(tidyData,activityType,by='activityId',all.x=TRUE);


#### Now, the data has a tidy dataset with all qualities of a tidy dataset#######
##################################################################################


## Export the tidyData set to a csv file to upload for the assignment
write.table(tidyData, file = "tidayData.csv", sep = ",", col.names = NA,
qmethod = "double")
