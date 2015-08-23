# This script creates a temp environment and returns the answers
# to the global environment. It also assumes that the files for
# this assignment are unpacked at the current directory.

#Loading Plyr
library(dplyr)

#Environment Assignment
Assignment <- new.env() 

#Reading from Test and Train data.
Assignment$feature_names <- read.table("features.txt")
Assignment$train_data <- read.table("./train/X_train.txt")
Assignment$test_data <- read.table("./test/X_test.txt")
#Assigning Column Names
names(Assignment$test_data) <- names(Assignment$train_data) <- Assignment$feature_names$V2

#Defining a closure as a function to get the activities names
Assignment$get_activity_name <- local({
  #Getting the activity labels, i just drop the first column since in R the vector/list starts with 1
  activity_labels <- read.table("activity_labels.txt", stringsAsFactors = FALSE)$V2
  function(label_number) {
    activity_labels[[label_number]]
  }
})

#Reading the activities
Assignment$train_activities <- read.table("train/y_train.txt")
Assignment$train_activities["V1"] <- sapply(Assignment$train_activities$V1, Assignment$get_activity_name)
Assignment$test_activities <- read.table("test/y_test.txt")
Assignment$test_activities["V1"] <- sapply(Assignment$test_activities$V1, Assignment$get_activity_name)
names(Assignment$train_activities) <- names(Assignment$test_activities) <- c("Activity")

#Getting subjects
Assignment$train_subjects <- read.table("train/subject_train.txt")
names(Assignment$train_subjects) <- c("Subject")
Assignment$train_data <- cbind(Assignment$train_subjects, Assignment$train_data)
Assignment$test_subjects <- read.table("test/subject_test.txt")
names(Assignment$test_subjects) <- c("Subject")
Assignment$test_data <- cbind(Assignment$test_subjects, Assignment$test_data)

#Assembling all together
Assignment$complete_train_set <- cbind(Assignment$train_subjects, Assignment$train_activities, Assignment$train_data)
Assignment$complete_test_set <- cbind(Assignment$test_subjects, Assignment$test_activities, Assignment$test_data)
Assignment$complete_set <- rbind(Assignment$complete_train_set, Assignment$complete_test_set)

#Answer 1:
answer1 <- Assignment$complete_set

#Finding out the mean and std columns, then subsetting it. This RegEx will catch all columns with mean and std in the name
Assignment$mean_std_cols <- grep("([Mm]ean|[Ss]td)",names(Assignment$complete_set))
Assignment$mean_std_set <- Assignment$complete_set[, c(1, 2, Assignment$mean_std_cols)]

#Answer 2:
answer2 <- Assignment$mean_std_set

#Answer 3 and 4 are already done in earlier steps, so I'll just copy the results.
answer4 <- answer3 <- answer2

#Exclude Activity(it's not numeric, can't have mean) => group by Subject => Summarize using means
Assignment$summary_by_subject <- select(answer4, -c(Activity)) %>% group_by(Subject) %>% summarise_each(funs(mean))
answer5 <- Assignment$summary_by_subject

#removing the environment, leaving only the answers
rm(Assignment)