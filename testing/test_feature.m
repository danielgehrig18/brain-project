addpath('data','testing','ReadData3D_version1k/nii','feature extract');

% test feature
parameters = struct('band', 5, ...
                    'bins', 2000);
X = generate_X('data/set_train', 'feature_extract11', parameters);

%%
close all
y = csvread('data/targets.csv');

ax1 = subplot(2,1,1);

scatter(ax1,y,X(:,3))
%ax2 = subplot(2,1,2);
% scatter(ax2,Y(:,2)./Y(:,1),y,'filled','d')
%scatter(ax2,y,X(:,2),'filled','d')


