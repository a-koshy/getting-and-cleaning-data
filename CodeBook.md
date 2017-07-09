# Human Activity Recognition Using Smartphones

### Human Activity Recognition Using Smartphones Dataset - `tidy_data.txt`

Experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities while wearing a smartphone on the waist. Data was collected from its embedded accelerometer and gyroscope.

There are 68 columns and 10299 rows in this data set. The columns are `subject`, `activity`, and 66 variables listed below.

`subject`- The individual performing the activity, takes values from 1 to 30.
`activity` - The activity performed, a factor with 6 levels: "walking", "walking_upstairs", "walking_downstairs", "sitting", "standing", "laying".
```
t_body_acc_mean_x 
t_body_acc_mean_y             
t_body_acc_mean_z              
t_body_acc_std_x              
t_body_acc_std_y               
t_body_acc_std_z              
t_gravity_acc_mean_x           
t_gravity_acc_mean_y          
t_gravity_acc_mean_z           
t_gravity_acc_std_x           
t_gravity_acc_std_y            
t_gravity_acc_std_z           
t_body_acc_jerk_mean_x         
t_body_acc_jerk_mean_y        
t_body_acc_jerk_mean_z         
t_body_acc_jerk_std_x         
t_body_acc_jerk_std_y          
t_body_acc_jerk_std_z         
t_body_gyro_mean_x           
t_body_gyro_mean_y            
t_body_gyro_mean_z             
t_body_gyro_std_x             
t_body_gyro_std_y              
t_body_gyro_std_z             
t_body_gyro_jerk_mean_x        
t_body_gyro_jerk_mean_y       
t_body_gyro_jerk_mean_z        
t_body_gyro_jerk_std_x        
t_body_gyro_jerk_std_y         
t_body_gyro_jerk_std_z        
t_body_acc_mag_mean          
t_body_acc_mag_std           
t_gravity_acc_mag_mean        
t_gravity_acc_mag_std         
t_body_acc_jerk_mag_mean      
t_body_acc_jerk_mag_std       
t_body_gyro_mag_mean         
t_body_gyro_mag_std           
t_body_gyro_jerk_mag_mean      
t_body_gyro_jerk_mag_std      
f_body_acc_mean_x        
f_body_acc_mean_y             
f_body_acc_mean_z              
f_body_acc_std_x              
f_body_acc_std_y               
f_body_acc_std_z              
f_body_acc_jerk_mean_x        
f_body_acc_jerk_mean_y        
f_body_acc_jerk_mean_z         
f_body_acc_jerk_std_x         
f_body_acc_jerk_std_y          
f_body_acc_jerk_std_z         
f_body_gyro_mean_x           
f_body_gyro_mean_y            
f_body_gyro_mean_z             
f_body_gyro_std_x             
f_body_gyro_std_y              
f_body_gyro_std_z             
f_body_acc_mag_mean            
f_body_acc_mag_std            
f_body_body_acc_jerk_mag_mean  
f_body_body_acc_jerk_mag_std  
f_body_body_gyro_mag_mean
f_body_body_gyro_mag_std      
f_body_body_gyro_jerk_mag_mean
f_body_body_gyro_jerk_mag_std
```

### Averages of each variable, activity and subject - `averages.txt`

This data set has 180 rows and 68 columns. The columns are `subject`, `activity` and 66 variables, like `tidy_data.txt`. Each row contains a subject, activity, and for each variable, the mean value for that subject and activity.

### Work performed to clean the data

To clean the original data set, the following steps were taken:
  1. Load the test data, training data, activities, subjects and variable names from the original data set.
  2. Restructure the data frames - add meaningful and consistent variable names to the columns, add columns for `subject` and `activity`, and rename the factors in `activity`.
  3. Subset the data set for columns containing `mean()` or `std()` in the variable name.
  4. Join the test and training data frames to form `tidy_data` and order the rows by `subject`.
  5. Write `tidy_data` to `tidy_data.txt`.
  6. Create a new data frame called `averages` with 68 columns and 180 rows, and name the columns with variable names from `tidy_data`.
  7. Fill `averages` with the mean of each variable, for each subject and each activity. The means are calculated from `tidy_data`.
  8. Write `averages` to `averages.txt`.