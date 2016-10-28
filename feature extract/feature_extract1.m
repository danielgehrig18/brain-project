function [ x ] = feature_extract1( path_name, parameters )
%FEATURE_EXTRACT Summary of this function goes here
%   Detailed explanation goes here
im = nii_read_volume(path_name); 
[x,y,z] = size(im);

% feature vector

% parameters
x_segments = parameters.x_segments;
y_segments = parameters.y_segments;
z_segments = parameters.z_segments;

x_regions = floor(x/x_segments *(0:x_segments));
y_regions = floor(y/y_segments *(0:y_segments));
z_regions = floor(z/z_segments *(0:z_segments));


x = [];

for x_i = 1:x_segments
    for y_i=1:y_segments
        for z_i=1:z_segments
            % cut out chunk from image
            chunk = im(x_regions(x_i)+1:x_regions(x_i + 1),...
                       y_regions(y_i)+1:y_regions(y_i + 1),...
                       z_regions(z_i)+1:z_regions(z_i + 1));
            
            % take mean of intensity in chunk       
            x = [x,mean(chunk(:))]; 
        end
    end
end

end

