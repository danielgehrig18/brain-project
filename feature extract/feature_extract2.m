function [ x ] = feature_extract2( im , limit1, limit2)
%FEATURE_EXTRACT Summary of this function goes here
%   Detailed explanation goes here
x = gwv_weights(im(:,:,end/2), limit1, limit2);
end