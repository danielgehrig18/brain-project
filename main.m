% main - main pipeline for training b with a training set from
% 'data/set_train' folder and submission of test values from
% 'data/set_train folder. Train_b is optimized for best r_squared
% (coefficient of determination).

% add relevant folder to path

addpath('feature extract', 'preprocess','ReadData3D_version1k/nii');

disp('Training Model with Data: data/set_train and Labels: data/targets.csv ...');
% train b with linear regression model and parameters
model = train_b('data/set_train', 'data/targets.csv', 500, 810);
disp('Training finished successfully!');

disp('Creating submission file using Data: data/set_test and Targets: data/submit.csv ...');
% submit target values for test set  
submission(model, 'data/set_test', 'data/submit.csv', 500, 810);
disp('Submission file created successfully!');
