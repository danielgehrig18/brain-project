function [ x ] = feature_extract12( path_name, parameters )
%FEATURE_EXTRACT11 Summary of this function goes here
%   Detailed explanation goes here
%   parameters: target = line of first peaks
%
%
histo = feature_extract10(path_name, parameters);
x = histo(parameters.target);                    %to be optimized ~15

end

