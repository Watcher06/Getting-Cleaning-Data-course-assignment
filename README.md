# Getting-Cleaning-Data-course-assignment
This is the course final assignment for the Getting and Cleaning Data Coursera course.
The R script, `run_analysis.R`, does the following:

1. Download the dataset if it does not already exist in the working directory and unzip it
2. Load the feature, train and test files and keep them in a dataframe
4. Combine all the files to get the required dataset 
3. Extract only those columns which give a mean or standard deviation
4. Loads the activity file to label the activities of the dataset. Add the activity labels as well as add the subject column to the dataset created in step 3.
5. Use descriptive labels for the columns of the variables
6. Create a tidy dataset that consists of the average (mean) value of each
   variable for each activity and subject pair.

The end result is shown in the file `tidydata.txt`.

# The description and source of data

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' (in the below link) for more details.

The files used to write the run_analysis.R script is taken from 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The all the related information can be found in this site below

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
