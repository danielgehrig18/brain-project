function [ ] = submission( b, folder, file, limit1, limit2 )
%   SUBMISSION Calculates the expected target values with b for test data and
%   writes it into file

% generate test data matrix. Has dimensions 
% #test_data_points x (#features + 1)
X = generate_X(folder, limit1, limit2);
y = X * b;
y_length = length(y);

% writes calculated values into file.
data_matrix = ([(1:y_length)',y]);

% check if there is already a file with name 'submit.csv', if so delete it
if exist(file, 'file') == 2
    delete(file);
end

% write matrix to csv file
dlmwrite(file,data_matrix,'delimiter',',','-append');
end

