## This script cleans and modifies the original data set, and creates a new data set
## containing the means of variables for each subject and activity.

# load features, activities, test data and subject labels, train data and subject labels.
activity <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")

test_data <- read.table("UCI HAR Dataset/test/X_test.txt")
test_activity <- read.table("UCI HAR Dataset/test/y_test.txt")
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")

training_data <- read.table("UCI HAR Dataset/train/X_train.txt")
training_activity <- read.table("UCI HAR Dataset/train/y_train.txt")
training_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")


# set colnames of test and training data to be variable names from features
colnames(test_data) <- features[,2]
colnames(training_data) <- features[,2]


# subset columns for 'mean()', 'std()' in test and train
test_data <- test_data[, grep("mean\\(\\)|std\\(\\)", features[,2])]
training_data <- training_data[, grep("mean\\(\\)|std\\(\\)", features[,2])]


# put activity and subject columns into the test and training data
colnames(test_activity) <- "activity"
colnames(training_activity) <- "activity"
colnames(test_subjects) <- "subject"
colnames(training_subjects) <- "subject"

test_data <- cbind(test_activity, test_data)
training_data <- cbind(training_activity, training_data)

test_data <- cbind(test_subjects, test_data)
training_data <- cbind(training_subjects, training_data)


# join test and train data and order by subject
tidy_data <- rbind(test_data, training_data)
tidy_data <- tidy_data[order(tidy_data[,1]),]


# clean variable names:
# This is a function that converts the variable names into snake_case.
clean_variables<-function(text){
  for(i in 1:length(text)){
    text[i]<-gsub("([a-z])([A-Z])", "\\1_\\2", text[i])
    text[i]<-gsub("-", "_", text[i])
    text[i]<-gsub("\\(|\\)", "", text[i] )
    text[i]<-tolower(text[i])
  }
  return(text)
}

colnames(tidy_data) <- clean_variables(colnames(tidy_data))


# set activity labels to be the label names
activity[,2] <- tolower(activity[,2])
for(i in 1:length(tidy_data[,2])){
  tidy_data[i,2] <- activity[tidy_data[i,2],2]
}


# write tidy_data to tidy_data.txt
write.table(tidy_data, file="tidy_data.txt")


# create a new data frame containing the means for each subject, each activity, and each variable: 180*68
averages <- data.frame(matrix(ncol=68, nrow=180))
colnames(averages)<-colnames(tidy_data)

row = 1
for(sub in 1:30){
  for(act in activity[,2]){
    averages[row,1] <- sub
    averages[row,2] <- act
    
    for(var in 3:68){
      averages[row,var] <- mean(tidy_data[tidy_data[,1]==sub & tidy_data[,2]==act, var])
    }
    row <- row+1
  }
}


# write averages to means.txt
write.table(averages, file="averages.txt")