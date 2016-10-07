
% test feature
X = generate_X('data/set_train', 720, 810);
Y = generate_X('data/set_train', 500, 800);

%%

y = csvread('data/targets.csv');

ax1 = subplot(2,1,1);
scatter(ax1,X(:,1)./X(:,2),y)

ax2 = subplot(2,1,2);
% scatter(ax2,Y(:,2)./Y(:,1),y,'filled','d')
scatter(ax2,X(:,2),y,'filled','d')


    
        

