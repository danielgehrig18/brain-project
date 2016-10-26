function [ weights ] = feature_extract_3peaks( path_name , parameters)
% Find number of grey values around specified center of gravity inside range
% (3 regions), using the grey intensity histogram

% Create grey value histogram (second input argument is not used, only a
% placeholder)
GH = feature_extract10(path_name,5000);

% Extract parameters
cg1 = parameters.cgone;
cg2 = parameters.cgtwo;
cg3 = parameters.cgthree;
ra1 = parameters.rangeone;
ra2 = parameters.rangetwo;
ra3 = parameters.rangethree;

% Third peak
idx1 = (cg1-ra1):(cg1+ra1);
% Second peak
idx2 = (cg2-ra2):(cg2+ra2);
% First peak
if (cg3-ra3) < 1
    idx3 = 1:(cg3+ra3);
else
    idx3 = (cg3-ra3):(cg3+ra3);
end

% Extract features from grey value histogram
white = GH(idx1);
grey = GH(idx2);
ventricle = GH(idx3);

% Count number of voxels in specified range
weights = [sum(white(:)),sum(grey(:)),sum(ventricle(:))];

% Normalize values
% weights = weights/sum(GH(:));
end

