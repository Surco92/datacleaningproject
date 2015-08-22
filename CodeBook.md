#1 LOADING DATA
I assume that data folder is in unziped form in R working directory. Subsequently, I loaded the data to R using read.table() command. I loaded training and test set separately to data frames "train" and "test". 
#2 MERGING DATA
In the next step I merged the data frames "train" and "test" to single data frame "fulldata" using merge() function.
#3 MEAN AND SD EXTRACTION 
Firstly, I loaded the variable names from text file to R object "features". Then I found which variables contain means and standard deviarion in their name using grep() function. I used this as an index to subset data and created data frame "subsdata". Finally, I put column names to the data frame.
#4 ACTIVITIES NAMES
I loaded data about activities performed for training and test set, creating data frames "trainactivities" and "testactivities". Next, I merged these two data frames to create single vector of factors, which I binded with data from previous step creating  data frame "subsdata2". Then I loaded the activity names that are avaiable in data and used them as factor levels of activity varriable in data frame "subsdata2"
#5 VARIABLE NAMES
#6 MEANS COMPUTATION