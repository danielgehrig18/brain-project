function [ average_error ] = submission( b, file, limit1, limit2 )
%   SUBMISSION Summary of this function goes here
%   Detailed explanation goes here
X = generate_X(validation_folder, limit1, limit2);
y = X * b;

csvwrite(file,y,2,2);

end

