function [ x ] = feature_extract13( path_name, parameters )
%FEATURE_EXTRACT11 Summary of this function goes here
%   Detailed explanation goes here
%   parameters: target = centerpoint of slope measurement
%               offset = width of slope measurement (+- from centerpoint)
%
histo = feature_extract10(path_name, parameters);

offset = parameters.offset;
centerpoint = parameters.centerpoint;

x = ((histo(centerpoint + offset) - histo(centerpoint - offset)) / (offset*2));  %to be optimized ~130-400
end
