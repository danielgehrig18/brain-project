function [ b, error, r_squared ] = train_b( x_folder, y_file, limit1, limit2 )
%TRAIN_B Trains a b parameter vector for linear regression with data from
%the x_folder and targets from the y_file. limit1 and limit2 are parameters
%for the feature_extract function.

% load targets
y = csvread(y_file);

% generate #data_points x (#features+1) data matrix
X = generate_X(x_folder, limit1, limit2);    

% minimization of square error -> derivation w. resp. to beta = 0
% TODO: possibly regularize to avoid numerical instability
b = pinv(X)*y;

% total error for all datapoints
error = (X*b-y)'*(X*b-y);

% calculate coefficient of determination
SStot = (length(y)-1)*var(y);

r_squared = 1 - error/SStot;
end

