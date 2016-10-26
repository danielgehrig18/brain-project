function [ x ] = feature_extract13( path_name, parameters )
%FEATURE_EXTRACT11 Summary of this function goes here
%   Detailed explanation goes here
%   parameters: target = centerpoint of slope measurement
%               offset = width of slope measurement (+- from centerpoint)
%
histo = feature_extract10(path_name, parameters);
x = ((histo(parameters.centerpoint + parameters.offset) - histo(parameters.centerpoint - parameters.offset)) / (parameters.offset*2));  %to be optimized ~10-30
end
