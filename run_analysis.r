#LOADING DATA
setwd("C:/RWD")
train<-read.table("./UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="")
test<-read.table("./UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="")
#MERGING DATA
fulldata<-merge(train,test,all=TRUE)
#MEAN AND SD EXTRACTION
features<-read.table("./UCI HAR Dataset/features.txt", quote="\"", comment.char="")
names(features)<-c("id","featurename")
means<-grep("mean",features$featurename)
stds<-grep("std",features$featurename)
index<-c(means,stds)
subsdata<-fulldata[,sort(index)]
names(subsdata)<-features$featurename[sort(index)]
#ACTIVITIES NAMES
trainactivities<- read.table("C:/RWD/UCI HAR Dataset/train/y_train.txt", quote="\"", comment.char="")
testactivities <- read.table("C:/RWD/UCI HAR Dataset/test/y_test.txt", quote="\"", comment.char="")
activities<-c(as.vector(trainactivities$V1),as.vector(testactivities$V1))
subsdata2<-cbind(subsdata,as.factor(activities))
activitylabels <- read.table("C:/RWD/UCI HAR Dataset/activity_labels.txt", quote="\"", comment.char="")
levels(subsdata2[,80])<-activitylabels$V2
levels(subsdata2[,80])<-tolower(levels(subsdata2[,80]))
levels(subsdata2[,80])<-sub("_"," ",levels(subsdata2[,80]),)
#VARIABLE NAMES
subsdata3<-subsdata2
names(subsdata3)<-sub("Acc","Acceleration",names(subsdata3),)
names(subsdata3)<-sub("Gyro","Gyroscope",names(subsdata3),)
names(subsdata3)<-sub("Gravit","Gravity",names(subsdata3),)
names(subsdata3)<-sub("Mag","Magnitude",names(subsdata3),)
names(subsdata3)<-sub("Freq","Frequency",names(subsdata3),)






