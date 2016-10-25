% main - main pipeline for training b with a training set from
% 'data/set_train' folder and submission of test values from
% 'data/set_train folder. Train_b is optimized for best r_squared
% (coefficient of determination).

% add relevant folder to path
addpath('feature extract', 'preprocess','ReadData3D_version1k/nii');

%% choose function1 and its parameters
fun1 = 'feature_extract10';
parameters1 = struct('cutoff', 4, ...
                    'bins', 2000);
[model1, X1, c1] = train_b('data/set_train', 'data/targets.csv', fun1, parameters1);                    
                

%% train b with linear regression model and parameters
disp('Training finished successfully!');

disp('Creating submission file using Data: data/set_test and Targets: data/submit.csv ...');
% submit target values for test set 
submission('data/set_test', 'data/submit.csv', {model1}, {fun1}, {parameters1}, c1);
disp('Submission file created successfully!');
