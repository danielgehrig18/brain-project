function [ betas, X, RMSE, cvRMSE] = train_b_cv( x_folder, y_file, fun, parameters, NoF )
%TRAIN_B Trains a b parameter vector for linear regression with data from
%the x_folder and targets from the y_file. limit1 and limit2 are parameters
%for the feature_extract function.
% Only compatible with optimize_feature_ar

% load targets
y = csvread(y_file);

% generate #data_points x (#features+1) data matrix
X = generate_X_optver(x_folder, fun, parameters, NoF);

% create linear model
% model = LinearModel.fit(X, y, 'RobustOpts', 'off');

% Do cross-validation
% Add ones column to X matrix (intercept)
XincOnes = [ones(length(y),1),X];
% Choose partition style
% Number of observed data
n = size(XincOnes,1);
% Data part hold out for cross-validation
p = 0.15;
c = cvpartition(n,'HoldOut',p);

% Function for multilinear regression needed in crossval
regf =@(XTRAIN,ytrain,XTEST)(XTEST*regress(ytrain,XTRAIN));

% Cross-validation, output MSE
cvMSE = crossval('mse',XincOnes,y,'Predfun',regf,'partition',c);
cvRMSE = sqrt(cvMSE);

% Compute beta vector (estimator), simple multi-linear regression
betas = regress(y,XincOnes);
% Compute Root mean squared error
RMSE = sqrt(mean((y-XincOnes*betas).^2));

end

