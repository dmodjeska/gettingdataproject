# README

## Background
The data analysis performed by run_analysis.R summarizes experimental data
from a research effort around wearable computing. Researchers measured subjects
performing a variety of activities while wearing Samsung smartphones. Signals
were obtained from the smartphone accelerometers. The purposes of the current
analysis is to tidy and summarize the original data for further work.

For more information about the experiment and the original data set, please see: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Running the Script
The script run_analysis.R assumes that the experimental data set has already
been downloaded and unzipped into the current working directory. The script also 
assumes that the data set retains its original name of "UCI HAR Dataset" and its 
original file structure. The data set can be downloaded from here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

To run the script in an R environment, use the following command:

```
source("run_analysis.R")
```

The output of the script is a text file that contains the summarized data, per
the codebook described below. This text file is created in the current working
directory. This file can be read in a standard text editor or spreadsheet 
program. This file can also be read in R, using the following commands:

```
samsung_summary <- read.table("samsung_data_summary.txt", header=TRUE)
View(samsung_summary)
```

## The Codebook
A codebook for the summary data can be found in the same directory as
run_analysis.R.

This codebook contains the following information:

* A list of the variables in the summary data, along with a description of each
variable, its units, and the values that it can hold.
* A detailed list of the steps taken to tidy and summarize the original data
set. In particular, steps are outlined to tidy the data, per Hadley Wickham's 
principles.