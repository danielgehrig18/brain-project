function [ model, X, c] = train_b( x_folder, y_file, fun, parameters )
%TRAIN_B Trains a b parameter vector for linear regression with data from
%the x_folder and targets from the y_file. limit1 and limit2 are parameters
%for the feature_extract function.

% load targets
y = csvread(y_file);

% generate #data_points x (#features+1) data matrix
X = generate_X(x_folder, fun, parameters); 

c = pca([X,y]);
x_new = [X,y]*c;
X = x_new(:,1:parameters.cutoff);

% create linear model
model = LinearModel.fit(X, y, 'RobustOpts', 'off');
end

