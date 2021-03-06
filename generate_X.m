function [ X ] = generate_X(folder, limit1, limit2)
%GENERATE_X Generate the data matrix from data in folder. Parameters limit1
%and limit2 are for the feature_extract function. 
%Resulting X matrix is of size #data_points x (#features + 1)
        
files = dir(folder);

% iterate through files in folder
for file = files'
    file_name = file.name;

    % skip system files (.etc)
    if file_name(1) == '.'
        continue
    end
    
    % find file number (file of the form 'test_3.nii'
    parse1 = strsplit(file_name, '.');
    parse2 = strsplit(parse1{1}, '_');
    file_number = str2num(parse2{2});
        
    % load file
    path_name = strcat(folder, '/', file_name);
    im = nii_read_volume(path_name); 
    
    % extract features from file
    x = feature_extract(im, limit1, limit2);
    X(file_number, :) = x;
end
end

