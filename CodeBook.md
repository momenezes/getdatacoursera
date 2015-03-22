Code Book for the Tidy dataset submitted for Get Data Course
-----------------


>This code book contains original description from the `README.txt` file as well as original description from the `features.txt` file, both found on the zip file containing the **HCI HAR Dataset**

Bellow are some pieces of the original description of the dataset and the experiment from which
the data was collected.

>==================================================================
>Human Activity Recognition Using Smartphones Dataset
>Version 1.0
>==================================================================
>Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
>Smartlab - Non Linear Complex Systems Laboratory
>DITEN - Universit? degli Studi di Genova.
>Via Opera Pia 11A, I-16145, Genoa, Italy.
>activityrecognition@smartlab.ws
>www.smartlab.ws
>==================================================================

# Study Design (original description)


>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.

>Feature Selection 
>=================

>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

>These signals were used to estimate variables of the feature vector for each pattern:  
>'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

    tBodyAcc-XYZ
    tGravityAcc-XYZ
    tBodyAccJerk-XYZ
    tBodyGyro-XYZ
    tBodyGyroJerk-XYZ
    tBodyAccMag
    tGravityAccMag
    tBodyAccJerkMag
    tBodyGyroMag
    tBodyGyroJerkMag
    fBodyAcc-XYZ
    fBodyAccJerk-XYZ
    fBodyGyro-XYZ
    fBodyAccMag
    fBodyAccJerkMag
    fBodyGyroMag
    fBodyGyroJerkMag

> The set of variables that were estimated from these signals are: 

    mean(): Mean value
    std(): Standard deviation
    mad(): Median absolute deviation 
    max(): Largest value in array
    min(): Smallest value in array
    sma(): Signal magnitude area
    energy(): Energy measure. Sum of the squares divided by the number of values. 
    iqr(): Interquartile range 
    entropy(): Signal entropy
    arCoeff(): Autorregresion coefficients with Burg order equal to 4
    correlation(): correlation coefficient between two signals
    maxInds(): index of the frequency component with largest magnitude
    meanFreq(): Weighted average of the frequency components to obtain a mean frequency
    skewness(): skewness of the frequency domain signal 
    kurtosis(): kurtosis of the frequency domain signal 
    bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
    angle(): Angle between to vectors.
    
>Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
    
    gravityMean
    tBodyAccMean
    tBodyAccJerkMean
    tBodyGyroMean
    tBodyGyroJerkMean
    
>The complete list of variables of each feature vector is available in 'features.txt'

Tidy Dataset Description
================

The tidy dataset is composed of 180 observations and 88 variables. Besides the *PersonId* and *Activity* columns (first two), we selected from the original dataset (merge of the Test and Train datasets) only those that contained *mean* or *std* in their names. 

Summary description
----------------

This dataset presents the **mean** value for each **subject** and for each **activity** he/she performed.

Variables description
----------------

*PersonId* (**integer variable**) represents the subject identification, ranging from 1 to 30.

*Activity* (**categorical variable**) represents one of the 6 activities the subjects were performing: 

    WALKING
    WALKING_UPSTAIRS
    WALKING_DOWNSTAIRS
    SITTING
    STANDING
    LAYING

All other variables are **numeric**, representing the measurements (`mean` and `std`). They're listed
bellow:

    tBodyAcc-mean()-X                    
    tBodyAcc-mean()-Y                   
    tBodyAcc-mean()-Z                    
    tGravityAcc-mean()-X                
    tGravityAcc-mean()-Y                 
    tGravityAcc-mean()-Z                
    tBodyAccJerk-mean()-X                
    tBodyAccJerk-mean()-Y               
    tBodyAccJerk-mean()-Z                
    tBodyGyro-mean()-X                  
    tBodyGyro-mean()-Y                   
    tBodyGyro-mean()-Z                  
    tBodyGyroJerk-mean()-X               
    tBodyGyroJerk-mean()-Y              
    tBodyGyroJerk-mean()-Z               
    tBodyAccMag-mean()                  
    tGravityAccMag-mean()                
    tBodyAccJerkMag-mean()              
    tBodyGyroMag-mean()                  
    tBodyGyroJerkMag-mean()             
    fBodyAcc-mean()-X                    
    fBodyAcc-mean()-Y                   
    fBodyAcc-mean()-Z                    
    fBodyAcc-meanFreq()-X               
    fBodyAcc-meanFreq()-Y                
    fBodyAcc-meanFreq()-Z               
    fBodyAccJerk-mean()-X                
    fBodyAccJerk-mean()-Y               
    fBodyAccJerk-mean()-Z                
    fBodyAccJerk-meanFreq()-X           
    fBodyAccJerk-meanFreq()-Y            
    fBodyAccJerk-meanFreq()-Z           
    fBodyGyro-mean()-X                   
    fBodyGyro-mean()-Y                  
    fBodyGyro-mean()-Z                   
    fBodyGyro-meanFreq()-X              
    fBodyGyro-meanFreq()-Y               
    fBodyGyro-meanFreq()-Z              
    fBodyAccMag-mean()                   
    fBodyAccMag-meanFreq()              
    fBodyBodyAccJerkMag-mean()           
    fBodyBodyAccJerkMag-meanFreq()      
    fBodyBodyGyroMag-mean()              
    fBodyBodyGyroMag-meanFreq()         
    fBodyBodyGyroJerkMag-mean()          
    fBodyBodyGyroJerkMag-meanFreq()     
    angle(tBodyAccMean,gravity)          
    angle(tBodyAccJerkMean),gravityMean)
    angle(tBodyGyroMean,gravityMean)     
    angle(tBodyGyroJerkMean,gravityMean)
    angle(X,gravityMean)                 
    angle(Y,gravityMean)                
    angle(Z,gravityMean)                 
    tBodyAcc-std()-X                    
    tBodyAcc-std()-Y                     
    tBodyAcc-std()-Z                    
    tGravityAcc-std()-X                  
    tGravityAcc-std()-Y                 
    tGravityAcc-std()-Z                  
    tBodyAccJerk-std()-X                
    tBodyAccJerk-std()-Y                 
    tBodyAccJerk-std()-Z                
    tBodyGyro-std()-X                    
    tBodyGyro-std()-Y                   
    tBodyGyro-std()-Z                    
    tBodyGyroJerk-std()-X               
    tBodyGyroJerk-std()-Y                
    tBodyGyroJerk-std()-Z               
    tBodyAccMag-std()                    
    tGravityAccMag-std()                
    tBodyAccJerkMag-std()                
    tBodyGyroMag-std()                  
    tBodyGyroJerkMag-std()               
    fBodyAcc-std()-X                    
    fBodyAcc-std()-Y                     
    fBodyAcc-std()-Z                    
    fBodyAccJerk-std()-X                 
    fBodyAccJerk-std()-Y                
    fBodyAccJerk-std()-Z                 
    fBodyGyro-std()-X                   
    fBodyGyro-std()-Y                    
    fBodyGyro-std()-Z                   
    fBodyAccMag-std()                    
    fBodyBodyAccJerkMag-std()           
    fBodyBodyGyroMag-std()               
    fBodyBodyGyroJerkMag-std() 

One should refer to the [original](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) experiment description for information about the measurement units of these variables.
