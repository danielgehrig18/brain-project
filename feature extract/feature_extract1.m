function [ x ] = feature_extract1( im )
%FEATURE_EXTRACT Summary of this function goes here
%   Detailed explanation goes here

x = [];

x_step = 43;
y_step = 51;
z_step = 43;

x(1) = 1;
index = 2;

for i = 1:x_step+1:176
    for j=1:y_step+1:208
        for k=1:z_step+1:176
            chunk = im(i:i+x_step,j:j+y_step,k:k+z_step); %cut 3D brain image into cubes
            a = mean(chunk(:)); %take mean intensity of cube
            if a~=0
                x(index)=a;     %extract mean intensity as feature
                index = index + 1;
            end
        end
    end
end















end

