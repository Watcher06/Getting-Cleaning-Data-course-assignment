## Create the folder in the directory and unzip the folder
#folder created. Note: method is auto as it is a windows system

library(data.table)
library(dplyr)

fileurl<-("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
 if(!file.exists("Samsungdata.zip")){
 download.file(fileurl,destfile="Samsungdata.zip",method="auto")
 }

#Unzip
if(!file.exists("UCI HAR Dataset")){
unzip("Samsungdata.zip")
}

##Read the different files in the UCI HAR Dataset folder

#Features file
features<-read.table('./UCI HAR Dataset/features.txt', header=FALSE)
str(features)
features<-as.character(features[,2])

#Train Data, three files are read and joined to get a dataframe
traindataX<-read.table('./UCI HAR Dataset/train/X_train.txt')
traindataY<-read.csv('./UCI HAR Dataset/train/Y_train.txt',header=FALSE,sep=' ')
traindatasubject<-read.csv('.UCI HAR Dataset/train/subject_train.txt',header=FALSE,sep=' ')

traindata<-data.frame(traindatasubject,traindataY,traindataX)
names(traindata)<-c(c('subject','activity'),features)
#For a check to make sure the table has proper values)
View(traindata)

#Do the same for test data
testdataX<-read.table('./UCI HAR Dataset/test/X_test.txt')
testdataY<-read.csv('./UCI HAR Dataset/test/y_test.txt', header = FALSE, sep = ' ')
testdatasubject<-read.csv('./UCI HAR Dataset/test/subject_test.txt', header = FALSE, sep = ' ')

testdata<-data.frame(testdatasubject,testdataY,testdataX)
names(testdata)<-c(c('subject','activity'),features)
View(testdata)

#Part1 - Merge both train and test data
alldata<-rbind(traindata,testdata)
View(alldata)

#Part2 - Select mean and std data only

select_mean_std<-grep('mean|std',names(alldata))
sub_data<-alldata[,c(select_mean_std)]

#the sub_data has columns with meanFreq as well, not clear if assignment requires these columns as well.
#therefore removed meanFreq

View(sub_data)
dim(sub_data)
rmmeanFreq<-grep('meanFreq',names(sub_data))
newsubdata<-sub_data[,-(rmmeanFreq)]
dim(newsubdata)

#Part3 - Uses descriptive activity names to name the activities in the data set 
#(Used the dataset with meansFreq)
activitylabel<-read.table('./UCI HAR Dataset/activity_labels.txt', header = FALSE)
activitylabel<-as.character(activitylabel[,2])
sub1<-alldata[,c(1:2)]
newsubdata1<-cbind(sub1,sub_data)
newsubdata1$activity<-activitylabel[newsubdata1$activity]

#Part4 - Appropriately labels the data set with descriptive variable names.
newnames<-names(newsubdata1)
newnames<-gsub("[(][)]", "",newnames)
newnames<-gsub("^t", "TimeDomain_",newnames)
newnames<-gsub("^f", "FrequencyDomain_",newnames)
newnames<-gsub("Acc", "Accelerometer",newnames)
newnames<-gsub("Gyro", "Gyroscope",newnames)
newnames<-gsub("Mag", "Magnitude",newnames)
newnames<-gsub("-mean-", "_Mean_",newnames)
newnames<-gsub("-std-", "_StandardDeviation_",newnames)
newnames<-gsub("-", "_",newnames)
newnames<-gsub("_std","_StandardDeviation",newnames)
View(newnames)
names(newsubdata1)<-newnames

#Part5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidydata<-aggregate(newsubdata1[,3:81],by=list(activity=newsubdata1$activity,subject=newsubdata1$subject),FUN=mean)
write.table(x=tidydata,file="tidydata.txt",row.names=FALSE)



