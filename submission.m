function [y_hat] = submission( folder, file, model,  fun, parameters)
%   SUBMISSION Calculates the expected target values with b for test data and
%   writes it into file

% extract coefficients
coefficient_info = table2array(model.Coefficients);
coefficients = coefficient_info(:,1);

% generate test data matrix. Has dimensions 
% #test_data_points x (#features + 1)
X = generate_X(folder, fun, parameters);

% calculate the test targets
y_hat = X * coefficients(2:end,:) + coefficients(1); 

% writes calculated values into file.
y_length = length(y_hat);

data_matrix = ([(1:y_length)',y_hat]);
% check if there is already a file with name 'submit.csv', if so delete it

if exist(file, 'file') == 2
    delete(file);
end

% data = num2cell(data_matrix);
submit = {'ID', 'Prediction'};
submit = [submit; num2cell(data_matrix)];

% write matrix to csv file
cell2csv(file,submit);

%end

