## GETTING AND CLEANING DATA PROJECT##

library(dplyr)

#------------------------------------------------------------------------------------------------------
## 1) Merging the training and the test sets to create one data set.
#------------------------------------------------------------------------------------------------------

#Downloading the dataset into the working directory:

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipfile <- "UCI HAR Dataset.zip"

if (!file.exists(zipfile)) {
    download.file(url, zipfile, mode = "wb")
}

Path <- "UCI HAR Dataset"
if (!file.exists(Path)) {
    unzip(zipfile)
}

#Reading training data into R:
subject_train <- read.table(file.path(dataPath, "train", "subject_train.txt"))
x_train <- read.table(file.path(dataPath, "train", "X_train.txt"))
y_train <- read.table(file.path(dataPath, "train", "y_train.txt"))

#Reading test data into R:
subject_test <- read.table(file.path(Path, "test", "subject_test.txt"))
x_test <- read.table(file.path(Path, "test", "X_test.txt"))
y_test <- read.table(file.path(Path, "test", "y_test.txt"))

#Reading features data into R:
features <- read.table(file.path(Path, "features.txt"), as.is = TRUE)

#Reading activity data into R:
activity_labels <- read.table(file.path(dataPath, "activity_labels.txt"))
colnames(activities) <- c("activityId", "activityLabel")

#Merging the tables:
merged_data <- rbind(
    cbind(subject_train, x_train, y_train),
    cbind(subject_test, x_test, y_test))

# Removing individual data tables to save memory:
rm(subject_train, x_train, y_train, 
   subject_test, x_test, y_test)

colnames(merged_data) <- c("Subject", features[, 2], "Activity")

#--------------------------------------------------------------------------------------------------------
# 2) Extracting only the measurements on the mean and standard deviation for each measurement.
#--------------------------------------------------------------------------------------------------------

mean_sd <- grepl("Subject|Activity|mean|std", colnames(merged_data))

merged_data <- merged_data[, mean_sd]


#--------------------------------------------------------------------------------------------------------
# 3) Uses descriptive activity names to name the activities in the data set
#--------------------------------------------------------------------------------------------------------

merged_data$Activity <- factor(merged_data$Activity,levels = activity_labels[, 1], labels = activity_labels[, 2])


#--------------------------------------------------------------------------------------------------------
# 4) Appropriately labels the data set with descriptive variable names.
#--------------------------------------------------------------------------------------------------------

merged_data_columns <- colnames(merged_data)

merged_data_columns <- gsub("[\\(\\)-]", "", merged_data_columns)
merged_data_columns <- gsub("^t", "Time Domain", merged_data_columns)
merged_data_columns <- gsub("Acc", "Accelerometer", merged_data_columns)
merged_data_columns <- gsub("Gyro", "Gyroscope", merged_data_columns)
merged_data_columns <- gsub("Mag", "Magnitude", merged_data_columns)
merged_data_columns <- gsub("Freq", "Frequency", merged_data_columns)
merged_data_columns <- gsub("mean", "Mean", merged_data_columns)
merged_data_columns <- gsub("std", "Standard Deviation", merged_data_columns)
merged_data_columns <- gsub("BodyBody", "Body", merged_data_columns)
merged_data_columns <- gsub("JerkMag", "JerkMagnitude", merged_data_columns)
merged_data_columns <- gsub("AccMag", "AccMagnitude", merged_data_columns)

colnames(merged_data) <- merged_data_columns




#--------------------------------------------------------------------------------------------------------
# 5) From the data set in step 4, creates a second, independent tidy data set with the average of each 
#    variable for each activity and each subject.
#--------------------------------------------------------------------------------------------------------


mergeddatacolumns_mean <- merged_data %>%
    group_by(Subject, Activity) %>%
    summarise_all(funs(mean))

write.table(mergeddatacolumns_mean, "tidydata.txt", row.names = FALSE, quote = FALSE)

