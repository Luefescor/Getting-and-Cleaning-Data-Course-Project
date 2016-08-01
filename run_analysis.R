
# Download the zip file
urlFile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(urlFile,"DataSet.zip")
# Uncompress the zip file, which automatically creat a file called "UCI HAR Data set" in the work directory.
unzip("DataSet.zip")

# Before continue call libraries 'data.table' and 'dplyr'
library(data.table)
library(dplyr)

# Read the data in R,
# first the activity labels and the features,
actLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
# then the train set,
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
subTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
# finaly the test set.
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt")
subTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")


## Now proceed with the project objectives:

  ## 1. Merges the training and the test sets to create one data set.

xTotalData <- rbind(xTrain, xTest)
yTotalData <- rbind(yTrain, yTest)
subTotalData <- rbind(subTrain, subTest)

# According with the readme in "UCI HAR Data set" file, name the variables
names(xTotalData) <- features$V2
names(subTotalData) <- c("subject")
names(yTotalData) <- c("activity")

# Finaly get a variable called "TotalData"
totalData <- cbind(xTotalData, yTotalData, subTotalData)

  ## 2. Extracts only the measurements on the mean and standard deviation for each measurement.

meanList <-grep("mean()", colnames(totalData), fixed=T)
stdList <-grep("std()", colnames(totalData), fixed=T)
totalData <-totalData[, c(meanList,stdList)]



  ## 3. Uses descriptive activity names to name the activities in the data set

# Using the activity labels from the archive "./UCI HAR Dataset/activity_labels.txt", actLabels

totalData$activity <- factor(totalData$activity, levels = actLabels[,1], labels = actLabels[,2])

  ## 4. Appropriately labels the data set with descriptive variable names.

#Using gsub
names(totalData)<-gsub("^t", "time", names(totalData))
names(totalData)<-gsub("^f", "frequency", names(totalData))
names(totalData)<-gsub("Acc", "Accelerometer", names(totalData))
names(totalData)<-gsub("Gyro", "Gyroscope", names(totalData))
names(totalData)<-gsub("Mag", "Magnitude", names(totalData))
names(totalData)<-gsub("BodyBody", "Body", names(totalData))

  ## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

totalData2<-aggregate(. ~subject + activity, totalData, mean)
totalData2<-totalData2[order(totalData2$subject, totalData2$activity), ]
write.table(totalData2, file="totalData2.txt", row.name=FALSE)