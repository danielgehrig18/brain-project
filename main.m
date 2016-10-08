% main - main pipeline for training b with a training set from
% 'data/set_train' folder and submission of test values from
% 'data/set_train folder. Train_b is optimized for best r_squared
% (coefficient of determination).

% add relevant folder to path
addpath('feature extract', 'ReadData3D_version1k/nii');

% train b with linear regression model and parameters
%[b, error, r_squared] = train_b('data/set_train', 'data/targets.csv', 720, 810);

% submit target values for test set  
submission(b, 'data/set_test', 'data/submit.csv', 720, 810);

