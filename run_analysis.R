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
