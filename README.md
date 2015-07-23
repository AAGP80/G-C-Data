## Run_analysis readme
It is necessary the dplyr package.

It is assumed that the UCI HAR Dataset was downloaded in 
"~/Desktop/coursera/datascience/03_get_and_clean/UCI HAR Dataset" if the destination 
directory is different modify line 3 accordingly.

Lines 5 and 6 upload the activity_labels and features files.
Lines 7 to 9 take the list of features, eliminate the parathesis "()" and make a vector
cnames that will be used to name the following dataframe.

Lines 11 to 17 deal with train data.
Lines 11 and 12 upload the subject_train and y_train files. 
In lines 13 and 14 the number related to each activity is associated to the activity name 
by a join command.
Line 15 upload the x_train file. 
The s,y and x datasets are joined by cbind command to obtain syx_test dataframe.
Line 17 change the columns name of syx_test dataframe.

Lines 19 to 25 repeat the previous operations for the test data.

Line 30 joins train and test dataframe by rbind command to obtain the syx_all dataframe
Lines 34 and 35 take the position of mean and std data from syx_all

Lines 37 makes a new datatable with the selected columns called subs_syx_all 
Lines 39 to 45 manipulate the columns name of subs_syx_all to make them more readable 

Lines 47 groups  subs_syx_all by subject and activity in a third datatable called 
byS_byA_syx (it is used byS_byA_syx and not byS_byA_subs_syx_all for compactness)
Lines 48 summarise each column of byS_byA_syx using the mean of the variables in the
columns

Line 50 write a wide tidy datatable called tidy_mean_subs_syx, the description of the
datatable is provided in the codebook

Lines 27 and 28 clear some variables
Line 32 clears some variables
Line 51 clears some variables

