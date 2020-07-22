Getting and Cleaning Data - Course Project

This document describes processing analysis to "Human Activity Recognition Using Smartphones Data Set". It is explicit in 
in script called run_analysis.R

The original data was modifies by:
1. Merging the "training" and the "test sets" files to create one data set.

2. Asssig names variables to data set using file "features.txt" and file "activity_labels.txt" for different treatments in variable 
Activity: The first two columns correspond to SubjectId and Activity (Name of the Activity performed by the subject during experiment), 
the others correspond to features.

3. Extracting only the measurements on the mean and standard deviation for each measurement.

4. Assign descriptive activity names to name the activities in the data set 

5. Appropriately labeling the data set with descriptive variable names.

6. Creating a second, independent tidy data set with the average of each variable for each activity and each subject.


