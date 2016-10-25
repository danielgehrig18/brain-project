function [ x ] = feature_extract10( path_name, parameters )
%FEATURE_EXTRACT Summary of this function goes here
%   Detailed explanation goes here
im = nii_read_volume(path_name); 

[x,y,z] = size(im);

h = imhist(reshape(im, x,y*z), 2*parameters.bins);
x = h(parameters.bins+2:end);