setwd("C:/coursera/Documents/C3Project/UCI HAR Dataset/")
headers <- read.table("features.txt")
headers <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt") 

##Read test files
test_subject <- read.table("test/subject_test.txt") 
test_subject$subject <- test_subject$V1
test_activity <- read.table("test/y_test.txt") 
test_activity$activity <- test_activity$V1
test <- read.table("test/X_test.txt") 

##Read train files
train_subject <- read.table("train/subject_train.txt")
train_subject$subject <- train_subject$V1
train_activity <- read.table("train/y_train.txt") 
train_activity$activity <- train_activity$V1
train <- read.table("train/X_train.txt") 

##Complete test merge
testcheck <- cbind(test,subject = test_subject$subject,activity = test_activity$activity)
testcheck <- as.data.frame(testcheck)

##Complete train merge
traincheck <- cbind(train,subject = train_subject$subject,activity = train_activity$activity)
traincheck <- as.data.frame(traincheck)

##Final merged set
main <- rbind(traincheck,testcheck)
main <- as.data.frame(main)

##merge complete

##extract std and mean columns
headers$checking <- grepl("std|mean", headers$V2,ignore.case = FALSE)
extract <- data.frame(main$subject,main$activity)
for (i in 1:561)
{
    headers$V2 <- as.character(headers$V2)
    if (headers$checking[i] == TRUE)
    {
        columnnames <- colnames(extract)
        name <- headers$V2[i]
        extract <- cbind(extract,name = main[,i])
        colnames(extract) <- c( columnnames, name)
    }
    else{}
}

##Renaming activity labels
for (i in seq_along(extract$main.activity))
{
    if(extract$main.activity[i]==1)
    {extract$main.activity[i]<-"walking"}
    if(extract$main.activity[i]==2)
    {extract$main.activity[i]<-"walking upstairs"}
    if(extract$main.activity[i]==3)
    {extract$main.activity[i]<-"walking downstaird"}
    if(extract$main.activity[i]==4)
    {extract$main.activity[i]<-"sitting"}
    if(extract$main.activity[i]==5)
    {extract$main.activity[i]<-"standing"}
    if(extract$main.activity[i]==6)
    {extract$main.activity[i]<-"laying"}
    
}

##split the data based on activity and subject variables
library(reshape2)
split1 <- melt(extract,id=c("main.activity","main.subject"))

##write the tidy data set to an output file
write.table(dcast(split1, split1$main.activity + split1$main.subject ~ variable, mean),"TidyDataSet.txt")
