#You should create one R script called run_analysis.R that does 
#the following.

#1. Merges the "training" and the "test sets" to create one data set.

# 'train/y_train.txt': Training labels.
# 'test/X_test.txt': Test set.

# Test data
setwd("D:/Equipo/D/Cosas importantes/PROYECTOS/Coursera/Curso 3/Project/data/UCI HAR Dataset/test")
dir()
xtest<- read.table("X_test.txt")
ytest<- read.table("y_test.txt")
stest<- read.table("subject_test.txt")

## Train data
setwd("D:/Equipo/D/Cosas importantes/PROYECTOS/Coursera/Curso 3/Project/data/UCI HAR Dataset/train")
xtrain<- read.table("X_train.txt")
ytrain<- read.table("y_train.txt")
strain<- read.table("subject_train.txt")

# merge train, test data
xdata <- rbind(xtrain, xtest)
ydata <- rbind(ytrain, ytest)
sdata <- rbind(strain, stest)
syx<- cbind(sdata,ydata,xdata)

#Colnames for syx data frame sdata= "SubjetId"; ydata = "Activity"
# xdata = features vector (included in features.txt)
# it is data set labels with descriptive variable names.

setwd("D:/Equipo/D/Cosas importantes/PROYECTOS/Coursera/Curso 3/Project/data/UCI HAR Dataset/")
features<- read.table("features.txt")
features<- as.character(features[,2])

names(syx)<-c("SubjectId","Activity", features)
head(names(syx),5)

#2. Extracts only the measurements on the mean and standard deviation 
# for each measurement.

measurement_mean<- syx[grep("*mean",colnames(syx))]
measurement_sdt<- syx[grep("*std",colnames(syx))]

#3. Uses descriptive activity names to name the activities in the 
# data set
activitynames<-read.table("activity_labels.txt")
activitynames

syx$Activity<-as.factor(syx$Activity)
levels(syx$Activity)<- activitynames[,2]
levels(syx$Activity)
head(syx$Activity,10)
names(syx)[1:10]

#4. Appropriately labels the data set with descriptive variable names.

names(syx)<- gsub("*Gravity","Gravity",names(syx))
names(syx)<- gsub("*Acc","Acelerometer",names(syx))
names(syx)<- gsub("*Gyro", "Gyroscope",names(syx))
names(syx)<- gsub("^t", "Time", names(syx))
names(syx)<- gsub("^f", "Frequency", names(syx))
names(syx)

# 5. From the data set in step 4, creates a second, 
# independent tidy data set with the average of each variable for 
# each activity and each subject.
library(reshape2)
meltedData <- melt(syx, id = c("SubjectId", "Activity"))
finalData <- dcast(meltedData, SubjectId + Activity ~ variable, mean)

write.table(finalData, "Final_dataset.txt", row.names = FALSE, quote = FALSE)



