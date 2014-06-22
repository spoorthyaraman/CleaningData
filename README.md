Getting and Cleaning Data - Course Project
===========================================

This is a part of the data science track offered by Johns Hopkins University. This course project is in the 'getting and cleaning data' module.
The purpose of this project is to demonstrate  ability to collect, work with, and clean a data set.

### Script Usage Details
Step 1: Point your current working directory in R to the dataset folder provided in the assignment called "getdata_projectfiles_UCI HAR Dataset". Be sure to extract the .zip. You could use the setwd() command in R for this operation
Step 2: Run the run_analysis.R file as is.
Step 3: A .csv file called "tidyData.csv" will be generated in your working directory, which is a tidy dataset expected for this assignment

### Project Summary
The following is a summary description of the project instructions

You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

### Data Overview
The source data for this project can be found here.(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The details of the data is given below

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the
data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From
each window, a vector of features was obtained by calculating variables from the time and frequency domain.
 
### Additional Information
You can find additional information about the variables, data and transformations in the CodeBook.md file.
