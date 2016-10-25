function [ x ] = feature_extract11( path_name, parameters )
%FEATURE_EXTRACT11 Summary of this function goes here
%   Detailed explanation goes here

histo = feature_extract10(path_name, parameters);
segm = histo(30:73);
[max_val, max_id] = max(segm);

high = max_id + parameters.band;
low = max_id - parameters.band;

x = [sum(segm(low:high))];
end

