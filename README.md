## GETTING & CLEANING DATA Project:
This is project to complete the course "GETTING AND CLEANING DATA".
This repo consists of the following files:
*README.md - This file gives a brief overview of the dataset, how it was collected and the other files related to this project.
*run_analysis.R - This contains the R script which transforms the raw data into tidy data.
*tidydata.txt - It contains the tidydata set or the result of the R script. 
*CodeBook.md - It explains about the contents of the R script such as dataset, variables used and transformations used to create a tidy data set.

### About dataset used:
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
It includes labels of postural transitions between activities and also the full raw inertial signals instead of the ones pre-processed into windows.

### Transforming raw data into tidy data:

run_analysis.R contains R script which transforms the given raw data set into a tidy set. The following is the brief explaination of how it works:

*Downloaded and unzipped the source data.
*Read data into individual tables.
*Merged training and test datasets into one dataset.
*Used descriptive activity names to define the activities in the dataset.
*Created an independent tidy dataset with the mean of each variable for each activity.
*Written the dataset to tidydata.txt file.
