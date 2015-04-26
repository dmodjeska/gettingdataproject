# Codebook
## Analysis of Experiments with Samsung Smartphones


### Variables

#### ActivityName
Descriptive name for the activity performed by each of the experimental subjects. There are 6 activities.

   * Walking
   * Walking_upstairs
   * Walking_downstairs
   * Sitting
   * Standing
   * Laying

#### SubjectNumber
Unique identifier assigned to each of the experimental subjects. There are 30 
subjects.

   * 1..30

#### FeatureVariable
Descriptive label for the means and standard deviations of the experimental measurements. 
These measurements were of three types: acceleration of the smartphone (in 
standard gravity units 'g'), acceleration of the body (in standard gravity units 
'g'), and angular velocity (in radians/second). Many measurements were triaxial 
(i.e., having X, Y, and Z components). There are 66 labels.

   * tBodyAcc.mean...X
   * tBodyAcc.mean...Y
   * tBodyAcc.mean...Z
   * tBodyAcc.std...X
   * tBodyAcc.std...Y
   * tBodyAcc.std...Z
   * tGravityAcc.mean...X
   * tGravityAcc.mean...Y
   * tGravityAcc.mean...Z
   * tGravityAcc.std...X
   * tGravityAcc.std...Y
   * tGravityAcc.std...Z
   * tBodyAccJerk.mean...X
   * tBodyAccJerk.mean...Y
   * tBodyAccJerk.mean...Z
   * tBodyAccJerk.std...X
   * tBodyAccJerk.std...Y
   * tBodyAccJerk.std...Z
   * tBodyGyro.mean...X
   * tBodyGyro.mean...Y
   * tBodyGyro.mean...Z
   * tBodyGyro.std...X
   * tBodyGyro.std...Y
   * tBodyGyro.std...Z
   * tBodyGyroJerk.mean...X
   * tBodyGyroJerk.mean...Y
   * tBodyGyroJerk.mean...Z
   * tBodyGyroJerk.std...X
   * tBodyGyroJerk.std...Y
   * tBodyGyroJerk.std...Z
   * tBodyAccMag.mean..
   * tBodyAccMag.std..
   * tGravityAccMag.mean..
   * tGravityAccMag.std..
   * tBodyAccJerkMag.mean..
   * tBodyAccJerkMag.std..
   * tBodyGyroMag.mean..
   * tBodyGyroMag.std..
   * tBodyGyroJerkMag.mean..
   * tBodyGyroJerkMag.std..
   * fBodyAcc.mean...X
   * fBodyAcc.mean...Y
   * fBodyAcc.mean...Z
   * fBodyAcc.std...X
   * fBodyAcc.std...Y
   * fBodyAcc.std...Z
   * fBodyAccJerk.mean...X
   * fBodyAccJerk.mean...Y
   * fBodyAccJerk.mean...Z
   * fBodyAccJerk.std...X
   * fBodyAccJerk.std...Y
   * fBodyAccJerk.std...Z
   * fBodyGyro.mean...X
   * fBodyGyro.mean...Y
   * fBodyGyro.mean...Z
   * fBodyGyro.std...X
   * fBodyGyro.std...Y
   * fBodyGyro.std...Z
   * fBodyAccMag.mean..
   * fBodyAccMag.std..
   * fBodyBodyAccJerkMag.mean..
   * fBodyBodyAccJerkMag.std..
   * fBodyBodyGyroMag.mean..
   * fBodyBodyGyroMag.std..
   * fBodyBodyGyroJerkMag.mean..
   * fBodyBodyGyroJerkMag.std..

#### Mean
Mean value of a feature variable in an activity performed by a subject. 
Measurements are normalized and bounded within the range below.

   * -1.0..1.0

For a full description of the original data set that supports this analysis, 
please see the site where the data were obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Data Analysis
The following steps were taken to analyze the original data set:

1. The data set was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. The data set was unzipped to a folder on a MacBook Pro (Retina, 15-inch, Mid 
2014, base model).
3. All of the data files were read into RStudio Version 0.98.1091, with R version 3.1.2.
4. The feature names were made syntactically correct and unique for processing.
5. The activity names were converted to proper case for legibility. 
6. The measurement data was checked for missing or NA values, as well as 
all values being in range.
7. The feature data variables were subset to the means and standard
deviations of the signal measurements, for summary purposes.
8. For each data subset (training and testing), the activity, subject, and 
feature data were combined on a column basis.
9. The training and testing data subsets were combined on a row basis.
10. The activity names were merged into the data.
11. The data were reshaped into "tall" form by gathering together the 
(subset) feature variables into a single column, to tidy the data.
12. The data were sorted by activity number and subject number.
13. The data were grouped by activity name, subject number, and feature 
variable, for summary purposes.
14. The data were summarized by the measurement means for further analysis.
15. The resulting tidy, summary data were written out to a text file.




