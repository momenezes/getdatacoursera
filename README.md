Get Data Project Assignment
=============

Author: Mário O. de Menezes


This project asked us to get a bunch of data files (data sets), process them
and yield a tidy data set, as defined during the course lectures.

The dataset used for this project represent data collected from the accelerometers from the Samsung Galaxy S smartphone. It was downloaded from
the Project description page, and its link is:
    
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](Dataset)
    
After extracting the zip file, a directory structure is created, and the
base folder name is **UCI HAR Dataset**.

The `run_analysis.R` script needs the to be inside this folder, together with
the `features.txt` file.

To run the script, *source* it inside a **R** session. It might be necessary
to use `setwd()` function in order to `source` command be able to find 
the `run_analysis.R` script, or give `source` the full pathname to it.

The script works as follow:
    
1. First, all files are read (X_test, X_train, y_test, y_train, sub_test,
   sub_train, features)
2. Some duplicated names there exist in the features file (this file contains
the variable names - 561 names); they're removed to ensure that `select`
function works correctly. These variable names will not be used, since they
are related to bandsEnergy (not mean or std).
3. After removing the duplicated columns, the remaining names are assigned
to the columns of the X_testU dataset (X_testU and X_trainU are the cleaned
dataset, without duplicated columns). sub_test and sub_train data sets
have also column names assigned accordingly.
4. There're now 6 datasets ready for merging to yield 2 complete datasets
that will be latter combined. Using the `cbind` function, the TestDF and
TrainDF dataframes are formed, keeping the columns on both in the same order.
5. According to the experiment description, the test dataset contains 30%
of the subjects and the train dataset, 70%. Inspecting both dataframes,
we confirmed that there's no overlapping between them, so we need just to
combine them on a row basis. This is done using the `rbind` function, yielding
one more dataframe: MergeDF.
6. As required by the Project assignment, only columns containing *mean*  and
*std*  measurements should be used in the tidy dataset. So, we used `select` 
to filter out only columns that contains *mean* firstly (MeanDF) and then
*std* in sequence (StdDF). Here's the reason we de-duplicated column names in
an early step.
7. These two new dataframes were then merged (`cbind`) and the *PersonId* and
*Activity* columns were added back to them.
8. As required, all activities were correctly labed using the
`activity_labels.txt` file. This was accomplished using the `recode` function
from the `car` package.
9. The dataframe was then grouped by *PersonId* and *Activity* variables, and
the `summarise_each` function was used to summarize the data, computing the
mean value of each column for each subject and activity.
10. The resulting dataset is a dataframe with 180 observations and 88 variables, with *PersonId* and *Activity* as the first two columns. This
dataset is then written to the "step5tidy.txt" file using the `write.table`
function.