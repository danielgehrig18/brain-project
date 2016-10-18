function [ x ] = feature_extract6( path_name)
%FEATURE_EXTRACT extracts percentages of ventricular, white brain mass and
%grey brain mass from an image. Limit1 and limit2 are parameters for
%gwv_weights that calculates the fractions. 

% calculate fractions
im = nii_read_volume(path_name);

z_range = parameters.lower_limit_x:parameters.upper_limit_x;
y_range = parameters.lower_limit_y:parameters.upper_limit_y;
x_range = parameters.lower_limit_z:parameters.upper_limit_z;

temp = double(im < parameters.threshold*max(im(:)));

chunk = temp(x_range, y_range, z_range);

x = sum(chunk(:));