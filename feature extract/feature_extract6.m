function [ x ] = feature_extract6( path_name)
%FEATURE_EXTRACT extracts percentages of ventricular, white brain mass and
%grey brain mass from an image. Limit1 and limit2 are parameters for
%gwv_weights that calculates the fractions. 

% calculate fractions
im = nii_read_volume(path_name);

z_range = parameters(1):parameters(2);
y_range = parameters(3):parameters(4);
x_range = parameters(5):parameters(6);

temp = double(im < 43/256*max(im(:)));

chunk = temp(x_range, y_range, z_range);

x = sum(chunk(:));