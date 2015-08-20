#LOADING DATA
test<-read.table("./UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="")
train<-read.table("./UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="")
#MERGING DATA
fulldata<-merge(test,train,all=TRUE)
#MEAN AND SD EXTRACTION
features<-read.table("./UCI HAR Dataset/features.txt", quote="\"", comment.char="")
names(features)<-c("id","featurename")
means<-grep(".mean.",features$featurename)
stds<-grep(".std.",features$featurename)
index<-c(means,stds)
subsdata<-fulldata[,sort(index)]
