---
title: "CodeBook"

##CodeBook for "Getting and Cleaning data" project:

###Variables:
*Subject
 subject variable is an integer dat type ranging from 1 -30.

*Activity
 Activity variable has 6 values.
  *WALKING : Person was walking.
  *WALKING_UPSTAIRS : Person was walking upstairs.
  *WALKING_DOWNSTAIRS : Person was walking downstairs.
  *SITTING : Person was sitting.
  *STANDING : Person was standing.
  *Laying : Person was laying down.

###Measurements:
*Time-domain signals
*Frequency-domain signals

###Transformations:
*The training and test datasets were merged into one dataset.
*The measurements on mean and standard deviation were selected for each measurement and others were omitted.
*The activity identifiers were replaced with decriptive activity names.
*The variable names were replaced with descriptive variable names, expanded the names , removed the special characters (, -), intial f and t were expanded to frequency and time, several terms like acc, gyro etc were expanded.
*Final dataset was created with the mean of each varibale for each activity and each subject.
  
