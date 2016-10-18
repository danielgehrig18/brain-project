function [ ] = submission( model, folder, file, limit1, limit2 )
%   SUBMISSION Calculates the expected target values with b for test data and
%   writes it into file

% extract coefficients
coefficient_info = table2array(model.Coefficients);
coefficients = coefficient_info(:,1);

% generate test data matrix. Has dimensions 
% #test_data_points x (#features + 1)
X = generate_X(folder, limit1, limit2);

% calculate the test targets
y = X * coefficients(2:end,:) + coefficients(1); 

% writes calculated values into file.
y_length = length(y);

data_matrix = ([(2:y_length+1)',y]);
data_matrix(1,1) = 'ID';
data_matrix(1,2) = 'Prediction';
% check if there is already a file with name 'submit.csv', if so delete it
if exist(file, 'file') == 2
    delete(file);
end

% write matrix to csv file
cell2csv(file,data_matrix);
% csvwrite(file,header);
% dlmwrite(file,data_matrix,'delimiter',',','-append');

end

