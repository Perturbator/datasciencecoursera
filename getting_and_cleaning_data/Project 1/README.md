==================================================================
Getting and Cleaning Data Project 1
==================================================================
Perturbator
==================================================================
This is a script to make tidy data from data on accelerometers in smart phones from source [1].

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the data[1] contains measures of 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

In our end result tidy data we have only variables measuring means and standard deviations of the variables measured in the original data.

The raw data is in the "UCI HAR Dataset" in this directory.

The final tidy data is in this directory in the file "tidy_data.txt".

In the tidying process I used the dplyer package

Process: After reading in the training and test data, I combined them into a single dataframe.  I treated the subject and activity data similary and placed each into its own vector.  I converted the activity data to it's description (e.g., 1 was converted to "WALKING").  I then made a features vector and used it to name the columns of the combined testing/training data.  I finally added the subject and activity columns. I then subsetted the columns only retaining the activity, subject and columns containing means and stantard deviations using grepl.  Finally with dplyr I grouped data by subject and activity and output to file the tidy data with means of the data for activities by subject. 

To read the tidy data into R use:
    read.table(<file>, header=TRUE)
Notes: 
======
- Features are normalized and bounded within [-1,1].

Data used from:
 [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012