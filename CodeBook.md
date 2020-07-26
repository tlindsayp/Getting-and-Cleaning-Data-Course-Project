# CODEBOOK

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

All the raw data is composed in different tables for training and testing, such as Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration; Triaxial Angular velocity from the gyroscope; A 561-feature vector with time and frequency domain variables; Its activity labels; An identifier of the subject who carried out the experiment.
- 'features.txt': List of all 561 features.
- 'activity_labels.txt': Links the class labels with their activity name. Its range is from 1 to 6.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

To summarize the data from the triaxial acceleration and body acceleration signals, the features dataset provides a set of variables that were estimated from these signals, like mean, standard deviation, median, etcetera, and devided in the following patterns:
- tBodyAcc-XYZ;
- tGravityAcc-XYZ;
- tBodyAccJerk-XYZ;
- tBodyGyro-XYZ;
- tBodyGyroJerk-XYZ;
- tBodyAccMag;
- tGravityAccMag;
- tBodyAccJerkMag;
- tBodyGyroMag;
- tBodyGyroJerkMag;
- fBodyAcc-XYZ;
- fBodyAccJerk-XYZ;
- fBodyGyro-XYZ;
- fBodyAccMag;
- fBodyAccJerkMag;
- fBodyGyroMag;
- fBodyGyroJerkMag.

## Make a clean and tidy dataset (open README.md and run_analysis.R to read the code)
### STEP 1. Create a big data set with the measurements.
We will start our tidy dataset joining horizontally the 561-feature dataframe with the subject and the activity vectors, and vertically the 3 training sets with the 3 testing sets.

### STEP 2. Extract only the mean and standard deviation measurements.
We should include the names of the variables to the big dataset we just created. With this, we can search the columns with "mean" and "standard deviation" on their names and select only those.

### STEP 3. Name the activities with their actual names.
To do this, we need to merge our big dataset with the vector of activity names, using as key the number of the activity labels in each set.

### STEP 4. Name the variables.
We already did this in step 2, due to the need of name the variables to search for specific columns in the dataset. Later we can make some arrangements and sortings to make the set even better, with this we will have our clean and tidy dataset.

### STEP 5. Independent dataset with the average of each variable for each activity and each subject.
Here we just need to do a group by subjects and activity, and apply a mean function to these groups, resulting in our second and final dataset!
