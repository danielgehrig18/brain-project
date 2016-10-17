function [ x ] = feature_extract3( path_name , parameters)
%FEATURE_EXTRACT extracts percentages of ventricular, white brain mass and
%grey brain mass from an image. Limit1 and limit2 are parameters for
%gwv_weights that calculates the fractions. 

% calculate fractions
im = double(nii_read_volume(path_name)); 

im = im*parameters/max(im(:));

x = zeros(1,parameters);
for i=0:parameters-1
    p_region = im<i+1;
    m_region = im>i;
    
    total = p_region.*m_region;
    
    x(i+1) = sum(total(:));
end
end

