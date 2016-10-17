function [ x ] = feature_extract7( path_name, parameters)
%FEATURE_EXTRACT7 Summary of this function goes here
%   Detailed explanation goes here

im = nii_read_volume(path_name);
threshold = parameters(1)*max(im(:));

im = imgaussfilt3(im, parameters(2));

z = im > 0;

search_space = im < threshold;
search_space = z.*search_space;

blobs = bwconncomp(search_space, parameters(3));
numPixels = cellfun(@numel,blobs.PixelIdxList);

x = sort(numPixels);
x = x(end);
end