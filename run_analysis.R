require(plyr); require(dplyr)
old_wd<-getwd()
setwd("~/Desktop/coursera/datascience/03_get_and_clean/UCI HAR Dataset/")

activity_labels<-read.table("activity_labels.txt")
features<-read.table("features.txt")
f<-as.character(features$V2)
f<-gsub("[()]","_",f)
cnames<-c("subject","activity",f)

s_train<-read.table("./train/subject_train.txt")
y_train<-read.table("./train/y_train.txt")
y_train<-join(y_train,activity_labels, by="V1")
y_train<-as.data.frame(y_train$V2)
x_train<-read.table("./train/x_train.txt")
syx_train<-cbind(s_train,y_train,x_train)
names(syx_train)<-cnames

s_test<-read.table("./test/subject_test.txt")
y_test<-read.table("./test/y_test.txt")
y_test<-join(y_test,activity_labels, by="V1")
y_test<-as.data.frame(y_test$V2)
x_test<-read.table("./test/x_test.txt")
syx_test<-cbind(s_test,y_test,x_test)
names(syx_test)<-cnames

rm("cnames","activity_labels")
rm(list=c("s_train","s_test","y_train","y_test","x_train","x_test"))

syx_all<-rbind(syx_train,syx_test)

rm(list=c("syx_train","syx_test"))

list4mean<-grep("mean_", f)
list4std<-grep("std_", f)

subs_syx_all<-tbl_df(syx_all[c("subject","activity",f[list4mean],f[list4std])])

f<-names(subs_syx_all)
f<-gsub("-","_",f)
f<-gsub("__","_",f)
f<-gsub("___","_",f)
f<-gsub("_$","",f)
f<-gsub("__","_",f)
names(subs_syx_all)<-f

byS_byA_syx<-group_by(subs_syx_all,subject,activity)
tidy_mean_subs_syx<-summarise_each(byS_byA_syx,funs(mean))
setwd(old_wd)
write.table(tidy_mean_subs_syx,"tidy_mean_subs_syx.txt", row.name=FALSE)
rm(list=c("f","list4mean","list4std","old_wd", "byS_byA_syx", "features"))
