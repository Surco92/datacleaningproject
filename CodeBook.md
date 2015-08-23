#1 LOADING DATA
I assume that data folder is in unziped form in R working directory. Subsequently, I loaded the data to R using read.table() command. I loaded training and test set separately to data frames "train" and "test". 
#2 MERGING DATA
In the next step I merged the data frames "train" and "test" to single data frame "fulldata" using merge() function.
#3 MEAN AND SD EXTRACTION 
Firstly, I loaded the variable names from text file to R object "features". Then I found which variables contain means and standard deviarion in their name using grep() function. I used this as an index to subset data and created data frame "subsdata" only containing means and standard deviations. Finally, I put matching column names to the data frame.
#4 ACTIVITIES NAMES
I loaded data about activities performed for training and test set, creating data frames "trainactivities" and "testactivities". Next, I merged the activity data from these two data frames to create single vector of factors, which I binded with data from previous step creating  data frame "subsdata2". Then I loaded the activity names that are avaiable in  original data folder and used them as factor levels of activity variable in data frame "subsdata2".
#5 VARIABLE NAMES
I created new data frame called "subsdata3" in which I changed names to be more descriptive using the "features_info.txt" available in original data folder. To transform names I primarily used sub() function. Basically, I replaced all abbreviations with full form of word. I am aware that names are too long but I wanted them as descriptive as possible.
#6 MEANS COMPUTATION
I created new data frame named "subsdata4" to perform this part of analysis. I loaded data about subjects for training and test set from original data folder, creating data frames "trainsubjects and "testsubjects". Next, I merged these two data frames to create single vector of factors and inserted this vector as a new variable named "subjects" to "subsdata4" data frame. To compute means by subject and activity I used "tapply()" and "for()" functions. Output from this procedure for activities is matrix "activitymeans" and for subjects it is matrix "activitymeans". Next, I binded these two matrices and vector with variable names to create data frame "meandata" and I adjusted column names to be more descriptive.  In data frame "meandata", rows represents variables from original data. Columns represent for which activity or subject was mean calculated.
#7 CLEAN DATASET OUTPUT
Clean dataset is created from "subsdata3" data frame.