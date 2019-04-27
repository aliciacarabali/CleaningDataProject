#Author: Alicia Carabali
#Date:27-Apr-2019

#Loading libraries
library(lubridate)
library(dplyr)

#Loading Data
TestSubject<-read.table("./SamsungDat/UCIHARDataset/test/subject_test.txt")
TestX<-read.table("./SamsungDat/UCIHARDataset/test/X_test.txt")
TestY<-read.table("./SamsungDat/UCIHARDataset/test/y_test.txt")
TrainSubject<-read.table("./SamsungDat/UCIHARDataset/train/subject_train.txt")
TrainX<-read.table("./SamsungDat/UCIHARDataset/train/X_train.txt")
TrainY<-read.table("./SamsungDat/UCIHARDataset/train/y_train.txt")
activitylabels<-read.table("./SamsungDat/UCIHARDataset/activity_labels.txt")
features<-read.table("./SamsungDat/UCIHARDataset/features.txt")

#Joining together all train and test information
TestInfo<-cbind(TestSubject,TestY,TestX)
TrainInfo<-cbind(TrainSubject,TrainY,TrainX)

#Creating the new dataset and adding proper labels to the columns
NewDataset<-rbind(TestInfo,TrainInfo)

#The labels of the features were taken from the features data
featuresNames<-as.character(features$V2)%>%gsub(pattern="\\()", replacement="")
names(NewDataset)[3:NumColumns]<-featuresNames

#Selecting Columns with means and stds creating the dataset only with them
TargetColumns<-c(grep("mean",names(NewDataset)),grep("std",names(NewDataset)))%>%sort.int(TargetColumns)
NewDataset<-cbind(NewDataset[1],NewDataset[2],NewDataset[,TargetColumns])

names(NewDataset)[1]<-"Subject"
names(NewDataset)[2]<-"Activity"

#Adding proper names to the activities
NewDataset$Activity<-factor(NewDataset$Activity,levels = c(1,2,3,4,5,6),labels = activitylabels$V2)

#Grouping for activity and subject and extracting the average for each of the variables
FinalDataset<-tbl_df(NewDataset)%>%group_by(Activity,Subject)%>%summarise_at(NewNames[3:ncol(NewDataset)],funs(mean))

write.table(FinalDataset, file = "./FinalDataset.txt",row.names = FALSE)
