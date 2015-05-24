# The analysis for creating tidy data created using the flows according to the
# course project descriptions

library(plyr)


###################################################################
# 1. Merges the training and the test sets to create one data set.#
###################################################################

# read the data from train folder where x_train is the data and y_train is the
# names of the variables
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# read the data from test folder where x_test is the data and y_test is the
# names of the variables
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# combine the data from train and test folder
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

################################################################################
# 2. Extracts only the measurements on the mean and standard deviation for each#
# measurement.                                                                 #
################################################################################

# read the textual data
features <- read.table("./UCI HAR Dataset/features.txt")

# get the mean and standard deviation
mean_std <- grep("-(mean|std)\\(\\)", features[,2])

# subset the data from the first step with the measurements
x_data <- x[,mean_std]

#############################################################################
# 3. Uses descriptive activity names to name the activities in the data set #
#############################################################################

# read the activities textual data
activities_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# change the data in x with the descriptive activities
y[,1] <- activities_labels[y[,1],2]
y_data <- y

#########################################################################
# 4. Appropriately labels the data set with descriptive variable names. #
#########################################################################

# set the names of the variables with the features 
names(x_data) <- features[mean_std,2]


# set the variable name of the y data
names(y_data) <- "activities"

# set the variable name of the subject
names(subject) <- "subject"

# combine all data into one
complete_data <- cbind(x_data, y_data, subject)

#################################################################################
# From the data set in step 4, creates a second, independent tidy data set with #
# the average of each variable for each activity and each subject.              #
#################################################################################

avg <- ddply(complete_data,.(subject, activities), function(temp) colMeans(temp[,1:66]))

write.table(avg,"averages_data.txt", row.name=FALSE)
