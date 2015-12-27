# Code book
## Variables
* For the detail information about the feature variables, please refer to the feature_info.txt file in UCI HAR Dataset package. For this particular analysis, it only looks at mean and std deviation. 
* 'subject_id': ID number for subject who performed the activities
* 'activity_id': ID number for the activity
* 'activity_name': descriptive name associated with the activity ID

## Transformation performed to clean up the data
1. Load the following files into R data frame.
   * 'subject_train.txt' ('subject_train')
   * 'X_train.txt' ('X_train')
   * 'y_train.txt' ('y_train')
   * 'subject_test.txt' ('subject_test')
   * 'X_test.txt' ('X_test')
   * 'y_test.txt' ('y_test')
   * 'activity_labels.txt' ('activity_labels')
   * 'features.txt' ('features')
2. Since the files didn't include descriptive column names, they were added to the R data frame.
3. Combined the data frames from '*_train.txt' files into one dataset.
4. Combined the data frames from '*_test.txt' files into one dataset.
5. As for the features, since we are only interested in 'mean' and 'std', other feature variables and columns were filtered out.
6. Data frames from 3 and 4 above were appended into one dataset.
7. Dataset from 6 was "melted" where 'subject_id' and 'activity_name' were used as its id field whereas all features (mean and std) were used as measure variables.
8. Then, average values for features for every combination of subject and the activity performed were computed. (each subject performed 6 activities.)
