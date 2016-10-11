function [ x ] = feature_extract2( path_name , limit1, limit2)
%FEATURE_EXTRACT Summary of this function goes here
%   Detailed explanation goes here
im = nii_read_volume(path_name); 
x = gwv_weights(im(:,:,end/2), limit1, limit2);
end