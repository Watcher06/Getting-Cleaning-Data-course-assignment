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
