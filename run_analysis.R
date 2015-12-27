# "run_analysis.R" script does the following.
# 1. Merges the training and the test data sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activity in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the
#    average of each variable for each activity and each subject.

library(reshape2)

# load 'train' data into data frame
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

# load 'test' data into data frame
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

# load 'activity labels'
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = T)

# load list of 'features'
features <- read.table("./UCI HAR Dataset/features.txt")
feature_names <- features[,2]
# only interested in mean and standard deviation.
target_features <- grepl("mean\\(\\)|std\\(\\)", feature_names)

##
## use more descriptive column names.
##
# 'activity labels' data
names(activity_labels) <- c("activity_id", "activity_name")

# 'train' data
names(subject_train) <- c("subject_id")
names(X_train) <- feature_names
X_train <- X_train[,target_features]
y_train[,2] <- activity_labels[,"activity_name"][y_train[,1]]
names(y_train) <- c("activity_id", "activity_name")

# 'test' data
names(subject_test) <- c("subject_id")
names(X_test) <- feature_names
X_test <- X_test[,target_features]
y_test[,2] <- activity_labels[,"activity_name"][y_test[,1]]
names(y_test) <- c("activity_id", "activity_name")

# combine all train data
train_dataset <- cbind(subject_train, y_train, X_train)

# combine all test data
test_dataset <- cbind(subject_test, y_test, X_test)

# combine train and test dataset
combined_dataset <- rbind(train_dataset, test_dataset)

# create tidy dataset
melted_dataset <- melt(combined_dataset, id = c("subject_id", "activity_name"), measure.vars = feature_names[target_features])
tidy_dataset <- dcast(melted_dataset, subject_id+activity_name ~ variable, mean)

write.table(tidy_dataset, file = "./tidy-dataset.txt", row.names = F)

