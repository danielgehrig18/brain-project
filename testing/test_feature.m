addpath('../data','../testing','../ReadData3D_version1k/nii','../feature extract');

% test feature
parameters = struct('cgone',220,'rangeone',50,'cgtwo',750,'rangetwo',35,...
                    'cgthree',1450,'rangethree',110);
X = generate_X('data/set_train', 'feature_extract_3peaks_v1', parameters);

%%
close all
y = csvread('data/targets.csv');

ax1 = subplot(2,1,1);

scatter(ax1,y,X(:,1))
%ax2 = subplot(2,1,2);
% scatter(ax2,Y(:,2)./Y(:,1),y,'filled','d')
%scatter(ax2,y,X(:,2),'filled','d')


