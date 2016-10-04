function [ x ] = feature_extract2( im , limit1, limit2)
%FEATURE_EXTRACT Summary of this function goes here
%   Detailed explanation goes here
x = gwv_weights(im, limit1, limit2);
x(end+1) = 1;
end

