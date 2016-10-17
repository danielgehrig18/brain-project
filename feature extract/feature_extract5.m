function [ x ] = feature_extract5( path_name , parameters)
%FEATURE_EXTRACT extracts percentages of ventricular, white brain mass and
%grey brain mass from an image. Limit1 and limit2 are parameters for
%gwv_weights that calculates the fractions. 

% calculate fractions
x = feature_extract3(path_name, parameters(1));

a = zeros(parameters(1),1);
a(parameters(2):parameters(3)) = 1;
b = zeros(parameters(1),1);
b(parameters(4):parameters(5)) = 1;

x = [x*a, x*b];
