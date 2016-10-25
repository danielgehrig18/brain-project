function [ x ] = feature_extract10( path_name, parameters )
%FEATURE_EXTRACT Summary of this function goes here
%   Detailed explanation goes here
im = nii_read_volume(path_name); 

[x,y,z] = size(im);

h = histogram(reshape(im, x,y*z), 1:5000 );
x = h.Values;
