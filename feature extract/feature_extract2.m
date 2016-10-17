function [ x ] = feature_extract2( path_name , parameters)
%FEATURE_EXTRACT Summary of this function goes here
%   Detailed explanation goes here
im = nii_read_volume(path_name); 
x = gwv_weights(im(:,:,end/2), parameters(1), parameters(2));
end