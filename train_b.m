function [ b, error, r_squared ] = train_b( x_folder, y_file, limit1, limit2 )
%TRAIN_B Summary of this function goes here
%   Detailed explanation goes here

y = csvread(y_file);

X = generate_X(x_folder, limit1, limit2);    

% b = inv(X'*X)*X'*y; 
b = pinv(X)*y;

error = (X*b-y)'*(X*b-y);

rho_xx = corr(X);
c = corr(X, y);

r_squared = c'*rho_xx*c;

end

