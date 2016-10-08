function [ x ] = feature_extract( im , limit1, limit2)
%FEATURE_EXTRACT extracts percentages of ventricular, white brain mass and
%grey brain mass from an image. Limit1 and limit2 are parameters for
%gwv_weights that calculates the fractions. 

% calculate fractions
x = gwv_weights(im, limit1, limit2);

% add 1 to the end of the matrix to simplify beta calculation 
x(end+1) = 1;
end

