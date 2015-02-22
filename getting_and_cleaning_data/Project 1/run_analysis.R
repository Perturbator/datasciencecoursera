library(dplyr)

activity_labels = read.table("UCI HAR Dataset/activity_labels.txt")[,2]

# function used to convert activity numbers to their description
convert_num_to_activity <- function(num) {
   return <- activity_labels[num]
}

train_activity = read.table("UCI HAR Dataset/train/y_train.txt")[,1]
train_activity = as.character(sapply(train_activity, convert_num_to_activity))

test_activity = read.table("UCI HAR Dataset/test/y_test.txt")[,1]
test_activity = as.character(sapply(test_activity, convert_num_to_activity))

# get subjects  and activities into a single vector
activity = c(train_activity,test_activity)

train_subject = read.table("UCI HAR Dataset/train/subject_train.txt")[,1]
test_subject = read.table("UCI HAR Dataset/test/subject_test.txt")[,1]
subject = c(train_subject,test_subject)

# Set up the training set data frame 
train_set = read.table("UCI HAR Dataset/train/X_train.txt")

# Set up test set data
test_set = read.table("UCI HAR Dataset/test/X_test.txt")


# create single data frame and name features
data <- rbind(train_set, test_set)
features = as.character(read.table("UCI HAR Dataset/features.txt")[,2])
names(data) <- features


# use only the wanted features
substring = "mean()|std()" # Added the "()" to avoid grabbing unwanted features e.g., those in tail(features)
mean_and_std_vec = grepl(substring, colnames(data))

dat <- data[,mean_and_std_vec]

# add subject and activity columns to data
dat$subject = subject
dat$activity = activity

# final tidy data
dat_final <- dat %>% group_by(subject,activity) %>% summarise_each(funs(mean),-subject,-activity)

# write to txt
write.table(dat_final, "tidy_data.txt", row.names = FALSE)
