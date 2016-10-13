addpath('data','testing','ReadData3D_version1k/nii','feature extract');

% test feature
X = generate_X('data/set_train', 720, 810);
Y = generate_X('data/set_train', 300, 800);

%%
close all
y = csvread('data/targets.csv');

ax1 = subplot(2,1,1);
scatter(ax1,y,X(:,3)./X(:,2))
% ylim([0 0.5])

ax2 = subplot(2,1,2);
% scatter(ax2,Y(:,2)./Y(:,1),y,'filled','d')
scatter(ax2,y,Y(:,2),'filled','d')
% ylim([0 1])

    
        

