#ReadMe.MD  

Coursera Data Science Specialisation  
Getting & Cleaning Data : Course Project  

This file describes the run_analysis.R and how the script works  

Purpose of script:  
------------------  
1 - Merge the training and the test sets to create one data set.  
2 - Extract only the measurements on the mean and standard deviation for each measurement.  
3 - Use descriptive activity names to name the activities in the data set.  
4 - Appropriately label the data set with descriptive variable names.  
5 - From the data set in step 4, create a second, independent tidy data set,  
	with the average of each variable for each activity and each subject.  

Assumptions:  
------------  
1 - The User has Downloaded the UCI HAR Dataset from its original source:  
	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
2 - The User has unzipped the above Dataset to its default folder ('UCI HAR Dataset')  
3 - The User's has set their Working Directory to the above folder  
4 - The Script is to be run in the User's Working Directory  
5 - The project brief states the script should extract:  
	'only the measurements on the mean and standard deviation for each measurement'  
	for this reason the inertial signals data is excluded from processing, as  
	there would be no point in including it only to remove it at a later stage.  
6 - Further to assumption 5 above - The script uses a strict definition of the brief,  
	therefore features in the unprocessed data referring to 'meanFreq' or angular  
	measurements such as 'angle(Z,gravityMean)' are also excluded.  

1: The run_analysis.R script merges the training and the test sets to create one data set:  
It reads the train and test data files into corresponding dataframes using read.table()  
It performs the above illustrated rbind & cbind operations:  
Each train and test pair are joined using rbind()  
It labels the column of the 'Subject' and 'Activity' Data Frame  
The resulting dataframes are then joined via cbind()  

Thus the resulting Data Frame has column headers as follows:  
"Subject"  "Activity" "V1" "V2" "V3" "V4"......"V559" "V560" "V561"  

2: The script extracts only the measurements on the mean and standard deviation for each measurement:  
It finds 'std()' and 'mean()' columns by looking at the features.txt file, and, taking literally the assignment instruction to extract only measurments for mean() and std(),  
features referring to 'meanFreq()' and 'angle' features such as angle(Z,gravityMean) are excluded, as these seem to be 'compound' features for which mean() is just a component.  

It creates an integer vector 'requiredColumns' for use in subsetting the merged data, incrementing the required column numbers as we have inserted 2 columns to the left  
of the merged data, namely 'Subject' & 'Activity'  

It Adds referneces (1 & 2) for 'Subject' & 'Activity' columns, and then subsets merged data using the 'requiredColumns' vector  

3: the script uses the descriptive activity names provided in 'activity_labels.txt' to name the activities in the data set:  
It loads the activity labels from activity_labels.txt into a data frame 'activityLabels'  
It sets the merged data 'Activity' Column to type 'Factor' and applies the descriptive activity labels to it by setting the levels  

4: The script labels the data set with descriptive variable names:  

It reads the full feature name list provided in features.txt  
It creates a vector containing only features referring to mean() and std() and corresponding to the requiredColumns vector created in step 2.  
The resulting vector of 66 features is then made tidy by using gsub() to remove parentheses and expand or replace acronyms with more descriptive names  
however 'StdDev' is used in place of 'StandardDeviation' for brevity  
Column headers "Subject" and Activity' are appended to the start of the vector and the resulting vector is used to overwrite the column headers in the merged data  

5: The script uses the data set in step 4 to create a second, independent tidy data set with the average of each variable for each activity and each subject.  

It loads the 'reshape' library which is required to Melt and Recast  
It sets the 'Subject' column to type Factor  
It Melts the data to narrow form, seting 'Subject' & 'Activity' as Id fields, and all other fields as variable fields  
It Casts the melted data in wide form, calculating average (mean) of each variable for each activity and each subject  
It writes the tidied data out to file  

This tidy data set consists of 180 rows (30 Subjects x 6 Activities) and 68 Columns ('Subject','Activity' + 66 Feature Columns)  
Thus each row in the table contains:  
A Subject  
An Activity carried out by that subject  
An average of all the observations made for each Feature as a result of that activity  

The data complies with the primary 'tidy data' requirements specified at in Hadley Wickham's paper at https://www.jstatsoft.org/article/view/v059i10  
Namely:  
1. Each variable forms a column of its own  
2. column headers are variable names  
3. Each observation forms a row.  
4. A single type of observational unit (averaged Feature measuremnts) are stored a single table  


