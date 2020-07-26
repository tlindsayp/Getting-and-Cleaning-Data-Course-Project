## COURSE PROJECT
#### First of all, we need to download the folder ("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip") and unzip it in the directory
library(dplyr) #We will use the dplyr package
setwd("getdata_projectfiles_UCI HAR Dataset/UCI HAR Datase") #Changing the direcory to the specific folder with the files

#### Reading all the files needed to create the tidy dataset
test <- read.table("./test/X_test.txt") #Test observations
train <- read.table("./train/X_train.txt") #Train observations
test_subject <- read.table("test/subject_test.txt") #Subject of each test observation
train_subject <- read.table("train/subject_train.txt") #Subject of each train observation
test_label <- read.table("test/y_test.txt") #Activity label of each test observation
train_label <- read.table("train/y_train.txt") #Activity label of each train observation

#### Binding the files to create one big dataset
test_table <- bind_cols(test_subject, test_label, test) #This is the TEST set (observations, subjects and activity labels)
train_table <- bind_cols(train_subject, train_label, train) #This is the TRAIN set (observations, subjects and activity labels)
dataset <- bind_rows(test_table, train_table) #This is the unified dataset
## "dataset" will be the result of step 1.

#### Now we will name the variables in the dataset, to select the columns only of the mean and standard deviation of the observations
features <- read.table("features.txt") #Reading the file with the variable names
str(features) #Identifying the column with the variable names (that is column 2)
features <- features[,2] #Creating a vector with the variable names
variable_names <- c("subject","activity_label",features) #Same vector but including names for 1st and 2nd columns
names(dataset) <- variable_names #Naming the dataset variables 
mean_std <- grep("subject|activity_label|mean[()]|std[()]",variable_names) #Searching for the variables that have "mean" and "std" on their names, will include also "subject" and "activity_label"
dataset<-dataset[,mean_std] #Now with this we have our dataset only with the variables of mean and standard deviation
## At this point, "dataset" is now our result of step 2. Also will include the variable names, so it will be the result of step 4 as well.

#### Now we will add a column with the activity names
activities <- read.table("activity_labels.txt") #Reading activity labels file
final_dataset <- dataset %>% 
  merge(activities, by.x="activity_label", by.y="V1") %>% #Merging the dataset with the activity labels file
  mutate(activity_label=V2) %>%
  select(-V2) %>%
  relocate(subject,activity_label) %>%
  arrange(subject,activity_label) #Sorting by "subject" and "activity_label"
## "final_dataset" will be the result of step 3.
