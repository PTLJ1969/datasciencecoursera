# 1 - Merge the training and the test sets to create one data set.
#-----------------------------------------------------------------

#Read Training Data into Data Frames:
feature_train<-read.table("./train/X_train.txt")
subject_train<-read.table("./train/subject_train.txt")
activity_train<-read.table("./train/y_train.txt")

#Read Test Data into Data Frames:
feature_test<-read.table("./test/X_test.txt")
subject_test<-read.table("./test/subject_test.txt")
activity_test<-read.table("./test/y_test.txt")

# Merge Training and Test Data Frames via rbind, which preserves order:
mergedSubjects<-rbind(subject_train, subject_test)
mergedActivities<-rbind(activity_train,activity_test)
mergedFeatures<-rbind(feature_train, feature_test)

# Add Column Names for Subject, Activity:
names(mergedSubjects) <- as.factor("Subject")
names(mergedActivities) <- as.factor("Activity")

# Merge Subject, Activity and Feature Data Frames via cbind:
mergedData<-cbind(mergedSubjects,mergedActivities,mergedFeatures)

# 2 - Extract only the measurements on the mean and standard deviation for each measurement.
#-------------------------------------------------------------------------------------------

# Find 'std' and 'mean' columns by looking at the features.txt file:
featurenames <-read.table("./features.txt")

# Taking literally the assignment instruction to extract only measurments for mean() and std(),
# this script excludes features referring to 'meanFreq()' and 'angle' features such as angle(Z,gravityMean)
# as these seem to be 'compound' features for which mean() is just a component.

# Creating integer vector 'requiredColumns" and using to subset mergedData
requiredColumns<-featurenames$V1[!featurenames$V2 %like% "Freq()" & featurenames$V2 %like% "mean()|std()"]


# Incrementing the required column numbers as we have inserted 2 columns to the left
# in the merged data, namely 'Subject' & 'Activity':
requiredColumns<-requiredColumns+2

# Adding referneces for 'Subject' & 'Activity' columns:
requiredColumns<-c(1,2,requiredColumns)

# Subsetting merged Data using required columns:
mergedData<-mergedData[,requiredColumns]

# 3 - Use descriptive activity names to name the activities in the data set:
#---------------------------------------------------------------------------

# Load the activity labels: 
activityLabels <-read.table("./activity_labels.txt")

# Set Merged Data 'Activity' Column to type 'Factor'
mergedData$Activity<-as.factor(mergedData$Activity)

# Assign Descriptive Activity Labels to Activity Column:
levels(mergedData$Activity) <- activityLabels$V2


# 4 - Appropriately label the data set with descriptive variable names.
#----------------------------------------------------------------------
# Read full feature name list provided:
featurenames <-read.table("./features.txt")

# Create vector 'requiredFeatureLabels", only variables referring to mean() and std() are required
# this vector will correspond to the requiredColumns vector created in step 2:
requiredFeatureLabels<-featurenames$V2[!featurenames$V2 %like% "Freq()" & featurenames$V2 %like% "mean()|std()"]

# Simply replacing Acronyms, Delimiters & Parentheses, however,
# using 'StdDev' rather than 'StandardDeviation' for brevity:
requiredFeatureLabels<-gsub("^t", "Time", requiredFeatureLabels)
requiredFeatureLabels<-gsub("^f", "Freq", requiredFeatureLabels)
requiredFeatureLabels<-gsub("Acc", "Acceleration", requiredFeatureLabels)
requiredFeatureLabels<-gsub("Gravity", "Gravitational", requiredFeatureLabels)
requiredFeatureLabels<-gsub("Gyro", "AngularVelocity", requiredFeatureLabels)
requiredFeatureLabels<-gsub("Mag", "Magnitude", requiredFeatureLabels)
requiredFeatureLabels<-gsub("-mean", "Mean", requiredFeatureLabels)
requiredFeatureLabels<-gsub("-std", "StdDev", requiredFeatureLabels)
requiredFeatureLabels<-gsub("\\()", "", requiredFeatureLabels)
requiredFeatureLabels<-gsub("-X", "InXAxis", requiredFeatureLabels)
requiredFeatureLabels<-gsub("-Y", "InYAxis", requiredFeatureLabels)
requiredFeatureLabels<-gsub("-Z", "InZAxis", requiredFeatureLabels)


# First two column names in place, however overwriting for code brevity:
names(mergedData)<-c("Subject", "Activity", requiredFeatureLabels)

# 5 - From the data set in step 4, create a second, independent tidy data   
# set with the average of each variable for each activity and each subject.
#--------------------------------------------------------------------------

# 'reshape' library required to Melt and Recast:
library(reshape)
# 'Subject', like 'Activity' should be a Factor:
mergedData$Subject<-as.factor(mergedData$Subject)

# Melt data to narrow form, seting 'Subject' & 'Activity' as Id fields, and all other fields as variable fields:
dataMelt <- melt(mergedData, id.vars = c("Subject","Activity"),measure.vars=c(requiredFeatureLabels))

# Cast melted data in wide form, calculating average (mean) of each variable for each activity and each subject:
MeanData<-dcast(dataMelt,Subject+Activity~variable,mean)

# Write Tidied data out to file:
write.table(MeanData, file = "TidyData.txt", row.names = FALSE)
