function [ X ] = generate_X(folder, limit1, limit2)
%GENERATE_X Summary of this function goes here
%   Detailed explanation goes here
    X = [];
    if strcmp(folder(10:end), 'train')
        last_index = 278;
    else
        last_index = 138;
    end
    
    for i=1:last_index
        path_name = strcat(folder, '/', folder(10:end), '_', num2str(i), '.nii');
        im = nii_read_volume(path_name); 
        x = feature_extract(im, limit1, limit2);
        X = [X; x];
    end
end

