The dataset includes the following files:

'features_info.txt': Shows information about the variables used on the feature vector.

'features.txt': List of all features.

'activity_labels.txt': Links the class labels with their activity name.

'train/X_train.txt': Training set.

'train/y_train.txt': Training labels.

'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

'test/X_test.txt': Test set.

'test/y_test.txt': Test labels.

'train/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

Variables used in	run_analysis.R

urlFile: Contain the url where there is the data

actLabels: Contain the 'activity_labels.txt' data

features: Contain the 'features.txt' data

xTrain: Contain the 'X_train.txt' data

yTrain: Contain the 'y_train.txt' data

subTrain: Contain the 'subject_train.txt' data

xTest: Contain the 'X_test.txt' data

yTest: Contain the 'y_test.txt' data

subTest: Contain the 'subject_test.txt' data

xTotalData: It's the row merge of xTrain and y xTest 

yTotalData:  It's the row  merge of yTrain and y yTest

subTotalData:  It's the row merge of subTrain and y subTest

totalData: It's a variable tha include xTotalData, yTotalData, subTotalData col merged

totalData2: It's the total data once labels the data set with descriptive variable names.

