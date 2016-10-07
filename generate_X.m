function [ X ] = generate_X(folder, limit1, limit2)
%GENERATE_X Summary of this function goes here
%   Detailed explanation goes here
        
    % Check if it's the training set
    if ~isempty(strfind('train',folder))
        %trainingset
        last_index = 278;       %FIX VALUE - TO BE EDITED TO A VARIABLE
    else
        %testset
        last_index = 138;       %FIX VALUE - TO BE EDITED TO A VARIABLE
    end
    
    %perform one example to determine no_of_features
    path_name = strcat(folder, '/train_1.nii');
    im = nii_read_volume(path_name); 
    x = feature_extract(im, limit1, limit2);
    
    no_of_features = length(x);
    
    X = zeros(last_index, no_of_features, 'single');
    
    for i=1:last_index
        path_name = strcat(folder, '/train_', num2str(i), '.nii');
        im = nii_read_volume(path_name); 
        x = feature_extract(im, limit1, limit2);
        for ii=1:no_of_features
            X(i, ii) = x(ii);
        end
    end
end

