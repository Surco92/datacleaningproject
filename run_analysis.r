#1 LOADING DATA
train<-read.table("./UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="")
test<-read.table("./UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="")

#2 MERGING DATA
fulldata<-merge(train,test,all=TRUE)

#3 MEAN AND SD EXTRACTION
features<-read.table("./UCI HAR Dataset/features.txt", quote="\"", comment.char="")
names(features)<-c("id","featurename")
means<-grep("mean",features$featurename)
stds<-grep("std",features$featurename)
index<-c(means,stds)
subsdata<-fulldata[,sort(index)]
names(subsdata)<-features$featurename[sort(index)]

#4 ACTIVITIES NAMES
trainactivities<- read.table("C:/RWD/UCI HAR Dataset/train/y_train.txt", quote="\"", comment.char="")
testactivities <- read.table("C:/RWD/UCI HAR Dataset/test/y_test.txt", quote="\"", comment.char="")
activities<-c(as.vector(trainactivities$V1),as.vector(testactivities$V1))
subsdata2<-cbind(subsdata,as.factor(activities))
activitylabels <- read.table("C:/RWD/UCI HAR Dataset/activity_labels.txt", quote="\"", comment.char="")
levels(subsdata2[,80])<-activitylabels$V2
levels(subsdata2[,80])<-tolower(levels(subsdata2[,80]))
levels(subsdata2[,80])<-sub("_"," ",levels(subsdata2[,80]),)

#5 VARIABLE NAMES
subsdata3<-subsdata2
names(subsdata3)[80]<-"Activity"
names(subsdata3)<-sub("^t","Time Domain Signal-",names(subsdata3),)
names(subsdata3)<-sub("^f","Fast Fourier Transform-",names(subsdata3),)
names(subsdata3)<-sub("Acc","Acceleration ",names(subsdata3),)
names(subsdata3)<-sub("Gyro","Gyroscope ",names(subsdata3),)
names(subsdata3)<-gsub("Body","Body ",names(subsdata3),)
names(subsdata3)<-sub("Gravity","Gravity ",names(subsdata3),)
names(subsdata3)<-sub("Mag","Magnitude ",names(subsdata3),)
names(subsdata3)<-sub("Freq","Frequency ",names(subsdata3),)
names(subsdata3)<-sub("mean()","Mean",names(subsdata3),)
names(subsdata3)<-sub("std()","Standard Deviation",names(subsdata3),)
names(subsdata3)<-sub("X","X Axis",names(subsdata3),)
names(subsdata3)<-sub("Y","Y Axis",names(subsdata3),)
names(subsdata3)<-sub("Z","Z Axis",names(subsdata3),)

#6 MEANS COMPUTATION
subsdata4<-subsdata3
trainsubjects <- read.table("C:/RWD/UCI HAR Dataset/train/subject_train.txt", quote="\"", comment.char="")
testsubjects <- read.table("C:/RWD/UCI HAR Dataset/test/subject_test.txt", quote="\"", comment.char="")
subsdata4$subjects<-as.factor(c(as.vector(trainsubjects$V1),as.vector(testsubjects$V1)))

matrixmeans<-matrix(rep(0,(79*6*30)),nrow=(6*30))
for(i in 1:79)
	matrixmeans[,i]<-tapply(subsdata4[,i],list(subsdata4[,80],subsdata4[,81]),mean)
	
meandata<-as.data.frame(matrixmeans)
names(meandata)<-names(subsdata3)[1:79]
meandata2<-cbind(numeric(36),numeric(36),meandata)
names(meandata2)[1]<-"activity name"
names(meandata2)[2]<-"subject id"
meandata2[,1]<-rep(levels(subsdata4[,80]),30)
meandata2[,2]<-rep(1:30,each=6)

#CLEAN DATASET OUTPUT
write.table(x=meandata2,file="./output.txt",row.name=FALSE)
