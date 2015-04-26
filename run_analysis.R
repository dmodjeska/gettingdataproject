##----------------------------------
## LOAD, CHECK, AND COMBINE THE DATA
##----------------------------------

destdir <- "UCI HAR Dataset"

## Check if the data set is in the working directory
if (!file.exists(destdir)) {
        errorMessage <- sprintf("This script requires the folder '%s' to be in the working directory.", 
                                destdir)
        stop(errorMessage)
}

## Set the working directory to the top level of the data set
oldWd <- getwd()
setwd(destdir)

library(ifultools)
library(dplyr)
library(readr)

## Load the feature variable names (and ensure that column names are unique)
features <- read.table("./features.txt")
feature_names <- make.names(features[, 2], unique = TRUE) 

## Load the activity labels
colNames <- c("ActivityNumber", "ActivityName")
activity_labels <- read.table("./activity_labels.txt", col.names = colNames)
activity_labels[, 2] <- properCase(as.character(activity_labels[, 2]))

## Helper function for loading and checking an individual data file
loadData <- function(datafile, myColNames, min.value, max.value, useReadr) {
        
        ## Load the data file
        if (useReadr) {  ## Readr performs well on some file formats
                data <- read_table(datafile, col_names = myColNames)
        }
        else data <- read.table(datafile, col.names = myColNames)

        ## Check the data for missing values
        are_no_NAs <- all(colSums(is.na(data)) == 0)
        if (!are_no_NAs) {
                print(sprintf("%s has missing data values\n", datafile))
        }
        ## Check the data for out-of-range values
        isInvalidRange <- function(x) { x < min.value | x > max.value }
        are_valid_range <- all(colSums(isInvalidRange(data)) == 0)
        if (!are_valid_range) {
                print(sprintf("%s has values out of range.\n", datafile))
        }
        ## Return the data
        return(data)
}

extractRegExpr <- "\\.mean\\.|\\.std\\."

## Helper function for loading and checking sets of data files
## Extract the direct means and standard deviations of the feature variables 
loadDataMaster <- function (dataFile, activitiesFile, subjectsFile) {
        
        ## Call helper function to load and check data
        data <- loadData(dataFile, feature_names, -1.0, 1.0, TRUE)
        activities <- loadData(activitiesFile, "ActivityNumber", 1, 6, FALSE)
        subjects <- loadData(subjectsFile, "SubjectNumber", 1, 30, FALSE)
        
        ## Extract and combine data
        extractData <- dplyr::select(data, matches(extractRegExpr))
        all_data <- bind_cols(activities, subjects, extractData)
}

## Load, check, extract, and combine the data via the helper functions
all_train_data <- loadDataMaster("./train/X_train.txt", 
                                 "./train/y_train.txt", 
                                 "./train/subject_train.txt")
all_test_data <- loadDataMaster("./test/X_test.txt", 
                                "./test/y_test.txt", 
                                "./test/subject_test.txt")
comboData <- bind_rows(all_train_data, all_test_data)

## Merge in the activity names
comboData2 <- full_join(activity_labels, comboData, by = "ActivityNumber")

## Restore the original working directory
setwd(oldWd)

##-------------------------------
## RESHAPE AND SUMMARIZE THE DATA
##-------------------------------

library(reshape2)
library(tidyr)

## Reshape the data to long form by activity, subject, and feature
moltenData <- comboData2 %>% 
        gather(FeatureVariable, Measurement, matches(extractRegExpr)) %>% 
        arrange(ActivityNumber, SubjectNumber)           

## Summarize the data by activity, subject, and feature, using measurement means
summaryData <- moltenData %>% 
                group_by(ActivityName, SubjectNumber, FeatureVariable) %>% 
                summarize(Mean = mean(Measurement))

##-----------------------
## SAVE THE SUMMARY DATA
##-----------------------

write.table(summaryData, file = "samsung_data_summary.txt", row.names = FALSE)
