#LOADING DATA

train<-read.table("./UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="")
test<-read.table("./UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="")
#MERGING DATA
fulldata<-merge(train,test,all=TRUE)
#MEAN AND SD EXTRACTION
features<-read.table("./UCI HAR Dataset/features.txt", quote="\"", comment.char="")
names(features)<-c("id","featurename")
means<-grep(".mean.",features$featurename)
stds<-grep(".std.",features$featurename)
index<-c(means,stds)
subsdata<-fulldata[,sort(index)]
names(subsdata)<-features$featurename[sort(index)]
#ACTIVITIES
trainactivities<- read.table("C:/RWD/UCI HAR Dataset/train/y_train.txt", quote="\"", comment.char="")
testactivities <- read.table("C:/RWD/UCI HAR Dataset/test/y_test.txt", quote="\"", comment.char="")
activities<c(as.vector(trainactivities$V1),as.vector(stactivities$V1))
