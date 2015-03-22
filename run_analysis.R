# To use this script, save it on the "UCI HAR Dataset" folder, having
# the "train" and "test" folders immediately under it
#
#  UCI HAR Dataset/
#                 /test
#                 /train
#                 /run_analysis.R
#                 /features.txt

# set this variable to the base path where UCI HAR Dataset was
# extracted
#UCIHAR_basepath <- "/home/mario/docs/cursos/Coursera/getdata/datasets/UCI HAR Dataset"
#setwd(UCIHAR_basepath)
# reading required libraries
library('dplyr')

# reading files
X_test <- read.table("test/X_test.txt", header=FALSE)
X_train <- read.table("train/X_train.txt", header=FALSE)
y_test <- read.table("test/y_test.txt", header=FALSE)
y_train <- read.table("train/y_train.txt",header=FALSE)
sub_test <- read.table("test/subject_test.txt", header=FALSE)
features <- read.table("features.txt",as.is=TRUE, header=FALSE)
sub_train <- read.table("train/subject_train.txt",header=FALSE)

# There are duplicated names in features.txt files
# these duplicated names are in the bandsEnergy columns.
# these columns will not be used, so I'll drop then early
# to avoid confusion and troubles latter

X_testU <- X_test[,!duplicated(features[,2])]
X_trainU <- X_train[,!duplicated(features[,2])]

# removing some objects from memory
rm(X_test)
rm(X_train)

# let's remove duplicated features names
featuresU <- features[!duplicated(features[,2]),]

# cleaning variable names to remove parenthesis
#featuresU[,2] <- gsub("\\)","",featuresU[,2])
#featuresU[,2] <- gsub("\\(","",featuresU[,2])
#featuresU[,2] <- gsub("\\(\\)","",featuresU[,2])

colnames(X_testU) <- featuresU[,2]
colnames(X_trainU) <- featuresU[,2]
colnames(sub_test) <- "PersonId"
colnames(sub_train) <- "PersonId"
colnames(y_test) <- "Activity"
colnames(y_train) <- "Activity"

# Now that we have all datasets, let's combine them to form one
TestDF <- cbind(sub_test,y_test,X_testU)
TrainDF <- cbind(sub_train,y_train,X_trainU)

# TestDF contains only 30% percent of all subjects that performed the test
# TrainDF contains the other 70% subjects
# They have unique subjects, that is, no subject in the TestDF is also
# in the TrainDF
# We test this getting the levels of the Person Id column from both datasets

#levels(as.factor(TrainDF$"PersonId"))
#levels(as.factor(TestDF$"PersonId"))

# Since they have no matching Person Id, we can't do a merge by column
# We need just to row combine these two dataframes

MergeDF <- rbind(TestDF, TrainDF)

# Now, taking the levels of Person Id column, we get all 30 subjects

#levels(as.factor(MergeDF$"PersonId"))

# Extracting only column names that contains "mean" word
MeanDF <- select(MergeDF,contains("mean"))
# Extracting only column names that contains "std" word
StdDF <- select(MergeDF,contains("std"))

# combining MeanDF and StdDF into ResDF
ResDF <- cbind(MeanDF,StdDF)

# Adding back the Person Id and Activity columns to MeanDF
ResDF <- cbind(MergeDF[,c(1,2)],ResDF)

# Cleaning column (variable) names
#colnames(ResDF) <- gsub("-","",colnames(ResDF))
#colnames(ResDF) <- gsub(",","",colnames(ResDF))

# loading car package because we need recode function
require('car')

# Giving Activity proper names instead of numbers
# 1 WALKING
# 2 WALKING_UPSTAIRS
# 3 WALKING_DOWNSTAIRS
# 4 SITTING
# 5 STANDING
# 6 LAYING

ResDF[,2] <- recode(ResDF[,2],"1='WALKING';2='WALKING_UPSTAIRS';3='WALKING_DOWNSTAIRS';4='SITTING';5='STANDING';6='LAYING'",as.factor.result=TRUE)

# removing some objects from memory
rm(list=c("MeanDF","StdDF","TestDF","TrainDF","X_testU","X_trainU","MergeDF"))

# grouping by PersonId and Activity
groupedDF <- group_by(ResDF,PersonId,Activity)

# summarizing each column by mean
summDF <- summarise_each(groupedDF,funs(mean))

# writting results to file 'step5tidy.txt'
write.table(summDF,file="step5tidy.txt", row.name=FALSE)

