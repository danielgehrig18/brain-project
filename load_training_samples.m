function [x] = load_training_samples( input_args )
%LOAD_TRAINING_SAMPLES Summary of this function goes here
%   Detailed explanation goes here
training_data = [];
for i=1:80
    file_path = strcat('data/set_train/train_', num2str(i),'.nii');
    training_data(:,:,:,i) = double(nii_read_volume(file_path));
end
x = training_data;
end

