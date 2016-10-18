addpath('data','testing','ReadData3D_version1k/nii','feature extract');

% test feature
% X = generate_X('data/set_train', 720, 810);
X = generate_X('data/set_train', 150, 600);


% %%
% % simple polyfit
% p = polyfit(X(:,2),y,1);
% yfit = polyval(p,X(:,2));

%%
close all
y = csvread('data/targets.csv');

ax1 = subplot(2,1,1);
scatter(ax1,X(:,2),y)
% hold on
% plot(X(:,2),yfit,'r');
% hold off
% %%
% % Error
% error = yfit.^2 - y.^2;
% mse = 1/length(y)*sum(error);
% rmse = sqrt(1/length(y)*sum(error));
% std_error = std(error);

% ylim([0 0.5])

% ax2 = subplot(2,1,2);
% % scatter(ax2,Y(:,2)./Y(:,1),y,'filled','d')
% scatter(ax2,y,Y(:,2),'filled','d')
% % ylim([0 1])


