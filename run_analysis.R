## Create the folder in the directory and unzip the folder
#folder created. Note: method is auto as it is a windows system

library(data.table)
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
#therefore remove meanFreq
View(sub_data)
dim(sub_data)
rmmeanFreq<-grep('meanFreq',names(sub_data))
newsubdata<-sub_data[,-(rmmeanFreq)]
dim(newsubdata)



