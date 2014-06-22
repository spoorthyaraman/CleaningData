CodeBook for the Course Project Assignment
===========================================

###Information about variables

####activityId
	ID of the different activities 
	1 WALKING
	2 WALKING_UPSTAIRS
	3 WALKING_DOWNSTAIRS
	4 SITTING
	5 STANDING
	6 LAYING

subjectId
	-Indicates different people who took the experiment. Each person is mapped to a subjectId
	
timeBodyAccMagnitudeMean
	Mean of the time for BodyAccelerationMagnitude
	Unit - seconds

timeBodyAccMagnitudeStdDev
	Standard deviation of the time for BodyAccelerationMagnitude
	Continuous unit
	
timeGravityAccMagnitudeMean
	Mean of the time for GravityAccelerationMagnitude
	Unit - Seconds
	
timeGravityAccMagnitudeStdDev
	Standard deviation of the time for GravityAccelerationMagnitude
	Continuous unit

timeBodyAccJerkMagnitudeMean	
	Mean of the time for BodyAccelerationJerkMagnitude
	Unit - Seconds

timeBodyAccJerkMagnitudeStdDev	
	Standard deviation of the time for BodyAccelerationJerkMagnitude
	Continuous unit
	
timeBodyGyroMagnitudeMean	
	Mean of the time for BodyGyroMagnitude
	Unit - Seconds

timeBodyGyroMagnitudeStdDev	
	Standard deviation of the time for BodyGyroMagnitude
	Continuous unit
	
timeBodyGyroJerkMagnitudeMean
	Mean of the time for BodyGyroJerkMagnitude
	Unit - Seconds	

timeBodyGyroJerkMagnitudeStdDev	
	Standard deviation of the time for BodyGyroJerkMagnitude
	Continuous unit
	
freqBodyAccMagnitudeMean
	Mean of the frequency for BodyAccelerationMagnitude
	Unit - Hertz
	
freqBodyAccMagnitudeStdDev
	Standard deviation of the frequency for BodyAccelerationMagnitude
	Continuous unit
	
freqBodyAccJerkMagnitudeMean
	Mean of the frequency for BodyAccelerationJerkMagnitude
	Unit - Hertz
	
freqBodyAccJerkMagnitudeStdDev
	Standard deviation of the frequency for BodyAccelerationJerkMagnitude
	Continuous unit
		
freqBodyGyroMagnitudeMean
	Mean of the frequency for BodyGyroMagnitude
	Unit - Hertz
	
freqBodyGyroMagnitudeStdDev	
	Standard deviation of the frequency for BodyGyroMagnitude
	Continuous unit
	
freqBodyGyroJerkMagnitudeMean
	Mean of the frequency for BodyGyroJerkMagnitude
	Unit - Hertz
		
freqBodyGyroJerkMagnitudeStdDev	
	Standard deviation of the frequency for BodyGyroJerkMagnitude
	Continuous unit
	
activityType
	Type of the activity performed when these readings were recorded
	Factor
	
###Information about Summary choices made

1. Condensed the various test and train datasets into one dataset by using the cbind and rbind operators which resulted in a dataset that had both test and train data for different features for all subjects and activities
2. Removed the columns from this dataset that are not needed in the final required dataset - reduced the columns to 20 from 531
3. Renamed the column names from the raw names to a more readable name
4. Averaged out the readings for the required columns (20) by subjectId and activityId - this indicates the mean values of the features observed for different trials of the experiment where the same subject performed the same activity

###Study Design
The dataset was provided to me as a part of the assignment and here is what the study design may be for this data set

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.