function [ x ] = feature_extract3( path_name , parameters)
% Divide grey histogram in several parts of the same length 

% calculate fractions
im = double(nii_read_volume(path_name)); 

im = im*parameters.segments/max(im(:));

x = zeros(1,parameters.segments);
for i=0 : parameters.segments - 1
    p_region = im < i + 1;
    m_region = im > i;
    
    total = p_region .* m_region;
    
    x(i+1) = sum(total(:));
end
end

