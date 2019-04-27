# Codebook

Here the information of the variables used in the `run_analysis.R` is presented.

First the variables to store the downloaded data were created
- **_TestSubject_** 2947 observations of 1 variable. Contains information of the subjects during the testing part of the experiment
- **_TextX_**  2947 observations of 561 variable. Contains information of the information extracted from the data collected during the testing part of the experiment
- **_TestY_** 2947 observations of 1 variable. Contains information of the activities performed during the testing part of the experiment
- **_TrainSubject_** 7352 observations of 1 variable. Contains information of the subjects during the training part of the experiment
- **_TrainX_**  7352 observations of 561 variables. Contains information of the information extracted from the data collected during the training part of the experiment
- **_TrainY_** 7352 observations of 1 variable. Contains information of the activities performed during the training part of the experiment
- **_activitylabes_** 6 observations of 2 variables. Contains the codes of the activities
- **_features_** 561 observations of 2 variables. Contains the names of the features of the original dataset

Then, the test and train subsets were created
- **_TestInfo_** 2947 observations of 563 variables.
- **_TrainInfo_** 7352 observations of 563 variables.

Then, the unified dataset was created and the operations for extracting the desired information were performed
- **_NewDataset_** 10299 observations. This dataset contains the information from the train and the test sesions together. Initially it has 563 but it is subsetted after line 31 to 81 variables.
- **_featuresNames_** Charracter array 561 elements. Contains the names of the features as strings.
- **_TargetColumns_** Integer arrray 79 elements. Contains the index of the featurs that are means or standard deviations.
- **_FinalDataset_** 30 observations of 81 variables. Is the summary of the data grouped by subject and activity.

