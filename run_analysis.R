library(dplyr)
setwd("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")

test <- read.table("./test/X_test.txt") #Test observations
train <- read.table("./train/X_train.txt") #Train observations
test_subject <- read.table("test/subject_test.txt") #Subject of each test observation
train_subject <- read.table("train/subject_train.txt") #Subject of each train observation
test_label <- read.table("test/y_test.txt") #Activity label of each test observation
train_label <- read.table("train/y_train.txt") #Activity label of each train observation

test_table <- bind_cols(test_subject, test_label, test)
train_table <- bind_cols(train_subject, train_label, train)
dataset <- bind_rows(test_table, train_table)

features <- read.table("features.txt") #Variable names table

str(features) #identifying the column with the variable names (column 2)
features <- features[,2] #A vector with the variable names of the test and train observations
variable_names <- c("subject","activity_label",features) #Same vector including names for 1st and 2nd columns
names(dataset) <- variable_names #naming the dataset variables 
mean_std <- grep("subject|activity_label|mean[()]|std[()]",variable_names) #searching for the variables of mean and standard deviation, including '()' to leave behind variables like 'meanFreq'
dataset<-dataset[,mean_std]

activities <- read.table("activity_labels.txt") #Activity labels
final_dataset <- dataset %>% 
  merge(activities, by.x="activity_label", by.y="V1") %>%
  mutate(activity_label=V2) %>%
  select(-V2) %>%
  relocate(subject,activity_label) %>%
  arrange(subject,activity_label)

# final_dataset IS THE RESULT FOR STEPS 1:4

final2<-aggregate(x=final_dataset,by=list(final_dataset$subject,final_dataset$activity_label),FUN=mean)
write.table(final2,"Assignment",row.name=FALSE)

# final2 IS THE RESULT FOR STEP 5