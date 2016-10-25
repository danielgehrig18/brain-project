% Create csv submit file
clear
clc

% Add path
addpath('../feature extract', '../preprocess','../ReadData3D_version1k/nii','../data');

% Load betas and parameters
load('../data/safe_opt4/Struct_getCSF_Tissue_03norm.mat')

% Showed good RMSE and cvRMSE
n = 7379;   % Improved score
% n = 27292;

cg1 = Limits_cell{n}(1);
ra1 = Limits_cell{n}(2);
cg2 = Limits_cell{n}(3);
ra2 = Limits_cell{n}(4);
cg3 = Limits_cell{n}(5);
ra3 = Limits_cell{n}(6);
                
parameters = struct('cgone',cg1,'rangeone',ra1,'cgtwo',cg2,'rangetwo',ra2,...
                  'cgthree',cg3,'rangethree',ra3);

betas = Save_b{n};

% Load grey histograms
% Folder
folder = '../data/greyhisto_test/';

disp('Load grey histograms into workspace ...')

extension = '*.mat';
listing = dir(strcat(folder,extension));
NoB = length(listing);
greyHisto = cell(NoB,1);

for i = 1:length(listing)
    file_name = listing(i).name;

    % skip system files (.etc)
    if file_name(1) == '.'
        continue
    end
    
    % find file number (file of the form 'test_3.nii'
    parse1 = strsplit(file_name, '.');
    parse2 = strsplit(parse1{1}, '_');
    file_number = str2num(parse2{2});
    path_name = strcat(folder, '/', file_name);
    
    % Load grey histogram
    load(path_name);
    
    % Put into greyHisto
    greyHisto{file_number} = temp_GH;
    
end

disp('Grey histograms loaded successfully')

% Generate X_test values        
fun = 'getCSF_Tissue_03';
NoF = 3;

Xtest = generate_X_optver(greyHisto,fun,parameters,NoF,'test');

% Compute age estimates
y_hat = [ones(138,1) Xtest]*betas;

% Create submission file
% check if there is already a file with name 'submit.csv', if so delete it

file = '../data/submit.csv';
if exist(file, 'file') == 2
    delete(file);
end

data_matrix = [(1:138)' y_hat];

cd('../data')
csvwrite('submit.csv',data_matrix);
cd('../testing')



