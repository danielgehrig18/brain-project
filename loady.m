function [ im ] = loady( folder, index )
%LOAD Summary of this function goes here
%   Detailed explanation goes here
    file_path = strcat('data/set_',folder,'/',folder,'_', num2str(index),'.nii');
    im = double(nii_read_volume(file_path));
end

