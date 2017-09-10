#CodeBook.MD  

Coursera Data Science Specialisation  
Getting & Cleaning Data : Course Project  

Original experiment:  
--------------------
(from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#)  
30 volunteers (aged 19-48 years) each performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)  
The volunteers were wearing a smartphone (Samsung Galaxy S II) on the waist.  
Tri-axial linear acceleration and tri-axial angular velocity were captured from the smartphones  
The experiments were video-recorded to label the data manually.  
The obtained dataset was randomly partitioned into two sets  
70% of the volunteers was selected for generating the training data and 30% the test data  

Original Data Source:  
---------------------
 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
 
Files used in this Coursera Project:  
------------------------------------
Files    Description  
 * X_train.txt    		The 'training' data  
 * subject_train.txt  	The subject performing the activty resulting in each 'training' data observation  
 * y_train.txt   		The activity performed in each 'training' data observation  
 * X_test.txt   		The 'testing' data  
 * subject_test.txt     The subject performing the activty resulting in each 'testing' data observation [1-30]  
 * y_test.txt           The activity performed in each 'testing' data observation  

NOTE: Inertial signals were not included in this project, as they do not contain the required std() and mean() variables stipulated  

Tidy Data Set Details:  
----------------------
The Tidy Data output by the script is called TidyData.txt  
it can be read into R using the following command:  

TidyData <- read.table("TidyData.txt", header = TRUE)  

Data contained in Tidy Data set:  
--------------------------------
Activity  
 * Factor with 6 levels [WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING]  
 * Identifies the activity executed for each observation  

Subject  
 * Factor with 30 Levels [1-30]  
 * Identifies which of the participants produced each observation  
 
TimeBodyAccelerationMeanInXAxis  
 * Mean, in Time Domain, of Body Acceleration in the X-axis  
TimeBodyAccelerationMeanInYAxis  
 * As per previous, but in Y-axis  
TimeBodyAccelerationMeanInZAxis  
 * As per previous, but in Z-axis  

TimeBodyAccelerationStdDevInXAxis  
 * Standard Deviation, in Time Domain, of Body Accelration in the X-axis  
TimeBodyAccelerationStdDevInYAxis  
 * As per previous, but in Y-axis  
TimeBodyAccelerationStdDevInZAxis  
 * As per previous, but in Z-axis  

TimeGravitationalAccelerationMeanInXAxis  
 * Mean, in Time Domain, of Gravitational Acceleration in the X-axis  
TimeGravitationalAccelerationMeanInYAxis  
 * As per previous, but in Y-axis  
TimeGravitationalAccelerationMeanInZAxis  
 * As per previous, but in Z-axis  

TimeGravitationalAccelerationStdDevInXAxis  
 * Standard Deviation, in Time Domain, of Gravitational Acceleration in the X-axis  
TimeGravitationalAccelerationStdDevInYAxis  
 * As per previous, but in Y-axis  
TimeGravitationalAccelerationStdDevInZAxis  
 * As per previous, but in Z-axis  

TimeBodyAccelerationJerkMeanInXAxis  
 * Mean, in Time Domain, of Body 'Jerk Acceleration' in the X-axis 
TimeBodyAccelerationJerkMeanInYAxis  
 * As per previous, but in Y-axis 
TimeBodyAccelerationJerkMeanInZAxis  
 * As per previous, but in Z-axis 

TimeBodyAccelerationJerkStdDevInXAxis  
 * Standard Deviation, in Time Domain, of Body 'Jerk Acceleration' in the X-axis  
TimeBodyAccelerationJerkStdDevInYAxis  
 * As per previous, but in Y-axis  
TimeBodyAccelerationJerkStdDevInZAxis  
 * As per previous, but in Z-axis  

TimeBodyAngularVelocityMeanInXAxis  
 * Mean, in Time Domain, of Body Angular Velocity in the X-axis 
TimeBodyAngularVelocityMeanInYAxis  
 * As per previous, but in Y-axis 
TimeBodyAngularVelocityMeanInZAxis  
 * As per previous, but in Z-axis 

TimeBodyAngularVelocityStdDevInXAxis  
 * Standard Deviation, in Time Domain, of Body Angular Velocity in the X-axis  
TimeBodyAngularVelocityStdDevInYAxis  
 * As per previous, but in Y-axis  
TimeBodyAngularVelocityStdDevInZAxis  
 * As per previous, but in Z-axis  

TimeBodyAngularVelocityJerkMeanInXAxis  
 * Mean, in Time Domain, of Body 'Angular Jerk Velocity' in the X-axis  
TimeBodyAngularVelocityJerkMeanInYAxis  
 * As per previous, but in Y-axis  
TimeBodyAngularVelocityJerkMeanInZAxis  
 * As per previous, but in Z-axis  

TimeBodyAngularVelocityJerkStdDevInXAxis  
 * Standard Deviation, in Time Domain, of Body 'Angular Jerk Velocity' in the X-axis  
TimeBodyAngularVelocityJerkStdDevInYAxis  
 * As per previous, but in Y-axis  
TimeBodyAngularVelocityJerkStdDevInZAxis  
 * As per previous, but in Z-axis  

TimeBodyAccelerationMagnitudeMean  
 * Mean, in Time Domain, of Body Acceleration Magnitude  

TimeBodyAccelerationMagnitudeStdDev  
 * Standard Deviation, in Time Domain, of Body Acceleration Magnitude  

TimeGravitationalAccelerationMagnitudeMean  
 * Mean, in Time Domain, of Gravitational Acceleration Magnitude  

TimeGravitationalAccelerationMagnitudeStdDev  
 * Standard Deviation, in Time Domain, Gravitational Acceleration Magnitude  

TimeBodyAccelerationJerkMagnitudeMean  
 * Mean, in Time Domain, of Body 'Jerk Acceleration' Magnitude  

TimeBodyAccelerationJerkMagnitudeStdDev  
 * Standard Deviation, in Time Domain, of Body 'Jerk Acceleration' Magnitude  

TimeBodyAngularVelocityMagnitudeMean  
 * Mean, in Time Domain, of Body Angular Velocity Magnitude  

TimeBodyAngularVelocityMagnitudeStdDev  
 * Standard Deviation, in Time Domain, of Body  Angular Velocity Magnitude  

TimeBodyAngularVelocityJerkMagnitudeMean  
 * Mean, in Time Domain, of Body 'Angular Jerk Velocity' Magnitude  

TimeBodyAngularVelocityJerkMagnitudeStdDev  
 * Standard Deviation, in Time Domain, of Body 'Angular Jerk Velocity' Magnitude  

FreqBodyAccelerationMeanInXAxis  
 * Mean, in Frequency Domain, of Body Acceleration in the X-axis  
FreqBodyAccelerationMeanInYAxis  
 * As per previous, but in Y-axis  
FreqBodyAccelerationMeanInZAxis  
 * As per previous, but in Z-axis  

FreqBodyAccelerationStdDevInXAxis  
 * Standard Deviation, in Frequency Domain, of Body Accelration in the X-axis  
FreqBodyAccelerationStdDevInYAxis  
 * As per previous, but in Y-axis  
FreqBodyAccelerationStdDevInZAxis  
 * As per previous, but in Z-axis  

FreqBodyAccelerationJerkMeanInXAxis  
 * Mean, in Frequency Domain, of Body 'Jerk Acceleration' in the X-axis  
FreqBodyAccelerationJerkMeanInYAxis  
 * As per previous, but in Y-axis  
FreqBodyAccelerationJerkMeanInZAxis  
 * As per previous, but in Z-axis  

FreqBodyAccelerationJerkStdDevInXAxis  
 * Standard Deviation, in Frequency Domain, of Body 'Jerk Acceleration' in the X-axis  
FreqBodyAccelerationJerkStdDevInYAxis  
 * As per previous, but in Y-axis  
FreqBodyAccelerationJerkStdDevInZAxis  
 * As per previous, but in Z-axis  

FreqBodyAngularVelocityMeanInXAxis  
 * Mean, in Frequency Domain, of Body Angular Velocity in the X-axis  
FreqBodyAngularVelocityMeanInYAxis  
 * As per previous, but in Y-axis  
FreqBodyAngularVelocityMeanInZAxis  
 * As per previous, but in Z-axis  

FreqBodyAngularVelocityStdDevInXAxis  
 * Standard Deviation, in Frequency Domain, of Body Angular Velocity in the X-axis  
FreqBodyAngularVelocityStdDevInYAxis  
 * As per previous, but in Y-axis  
FreqBodyAngularVelocityStdDevInZAxis  
 * As per previous, but in Z-axis  

FreqBodyAccelerationMagnitudeMean  
 * Mean, in Frequency Domain, of Body Acceleration Magnitude  

FreqBodyAccelerationMagnitudeStdDev  
 * Standard Deviation, in Frequency Domain, of Body Acceleration Magnitude  

FreqBodyBodyAccelerationJerkMagnitudeMean  
 * Mean, in Frequency Domain, of Body 'Jerk Acceleration' Magnitude  

FreqBodyBodyAccelerationJerkMagnitudeStdDev  
 * Standard Deviation, in Frequency Domain, of Body 'Jerk Acceleration' Magnitude  

FreqBodyBodyAngularVelocityMagnitudeMean  
 * Mean, in Frequency Domain, of Body Angular Velocity Magnitude  

FreqBodyBodyAngularVelocityMagnitudeStdDev  
 * Standard Deviation, in Frequency Domain, of Body Angular Velocity Magnitude  

FreqBodyBodyAngularVelocityJerkMagnitudeMean  
 * Mean, in Frequency Domain, of Body 'Angular Jerk Velocity' Magnitude  

FreqBodyBodyAngularVelocityJerkMagnitudeStdDev  
 * Standard Deviation, in Frequency Domain, of Body 'Angular Jerk Velocity' Magnitude  