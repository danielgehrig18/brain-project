function [ x ] = feature_extract1( im )
%FEATURE_EXTRACT Summary of this function goes here
%   Detailed explanation goes here

x = [];

x_step = 43;
y_step = 51;
z_step = 43;

index = 1;
for i = 1:44:176
    for j=1:52:208
        for k=1:44:176
            chunk = im(i:i+x_step,j:j+y_step,k:k+z_step);
            a = mean(chunk(:));
            if a~=0
             x(index)=a;
             index = index + 1;
            end
        end
    end
end
x(end+1) = 1;

end

