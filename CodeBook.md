# Code Book:

- Assignment: The environment. Aside from the answers, all other variables are inside this, so they're all called using Assignment$variable_name
- features_names: Column names taken from features.txt
- train_data: Data from X_train.txt
- test_data: Data from X_test.txt
- get_activity_name: Closure to transform each activity in its named equivalent
- train_activities: Activities from y_train.txt for each row
- test_activities:  Activities from y_test.txt for each row
- train_subjects: The subjects from subject_train.txt for each row
- test_subjects: The subjects from subject_test.txt for each row
- complete_train_set: Joining Subject, Activity and the data for the train set
- complete_test_set: Joining Subject, Activity and the data for the test set
- complete_set: The whole set
- mean_std_set: The set that contains only the columns with Mean and Std in the name
- summary_by_subject: The mean for each column, sliced up by Subject
- answer1, answer2, answer3, answer4, answer5: The answers.