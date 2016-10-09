function [ x ] = feature_extract4( path_name , limit1, limit2)
%FEATURE_EXTRACT extracts percentages of ventricular, white brain mass and
%grey brain mass from an image. Limit1 and limit2 are parameters for
%gwv_weights that calculates the fractions. 

% calculate fractions
im = nii_read_volume(path_name); 
x = gwv_weights(im, limit1, limit2);
x = x(2:end);
end
