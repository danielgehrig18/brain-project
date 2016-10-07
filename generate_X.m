function [ X ] = generate_X(folder, limit1, limit2)
%GENERATE_X Summary of this function goes here
%   Detailed explanation goes here
    if strcmp(folder(10:end), 'train')
        last_index = 278;
    else
        last_index = 138;
    end
    
    feature_num = 3; %currently: WM, GM, Ventricle - should be assigned somewhere else
    X = zeros(last_index,feature_num);
    
    for i=1:last_index
        path_name = strcat(folder, '/', folder(10:end), '_', num2str(i), '.nii');
        im = nii_read_volume(path_name); 
        X(i,:) = feature_extract(im, limit1, limit2);
    end
end

