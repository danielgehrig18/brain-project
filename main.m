% main - main pipeline for training b with a training set from
% 'data/set_train' folder and submission of test values from
% 'data/set_train folder. Train_b is optimized for best r_squared
% (coefficient of determination).

% add relevant folder to path
addpath('feature extract', 'preprocess','ReadData3D_version1k/nii');

% choose function and its parameters
fun = 'feature_extract3';
parameters = struct('segments',6);
% train b with linear regression model and parameters
[model, X, cvMSE] = train_b_cv('data/set_train', 'data/targets.csv', fun, parameters);
disp('Training finished successfully!');

fprintf('The cross-validation mean squared error is: %d \n',cvMSE);
% disp('Creating submission file using Data: data/set_test and Targets: data/submit.csv ...');
% % submit target values for test set 
% y_hat = submission('data/set_test', 'data/submit.csv', model, fun, parameters);
% disp('Submission file created successfully!');