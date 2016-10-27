% main - main pipeline for training b with a training set from
% 'data/set_train' folder and submission of test values from
% 'data/set_train folder. Train_b is optimized for best r_squared
% (coefficient of determination).

% add relevant folder to path
% addpath('feature extract', 'preprocess','ReadData3D_version1k/nii');
% bestparams = [];
% besterror = 999;
% 
% iteration_1_lower = 300;
% iteration_1_upper = 340;
% iteration_1_step = 5;
% 
% iteration_2_lower = 65;
% iteration_2_upper = 75;
% iteration_2_step = 1;

% for iteration1 = iteration_1_lower:iteration_1_step:iteration_1_upper
%     for iteration2 = iteration_2_lower:iteration_2_step:iteration_2_upper
%% choose function1 and its parameters
        fun1 = 'feature_extract12';
        parameters1 = struct('up', 1,...
                            'down',1,...
                            'centerpoint', 0, ...
                            'offset', 0,...
                            'target', 335);
        [model1, X1] = train_b('data/set_train', 'data/targets.csv', fun1, parameters1);
        
        fun2 = 'feature_extract13';
        parameters2 = struct('up', 1,...
                            'down',1,...
                            'centerpoint', 620,...
                            'offset', 95,...
                            'target', 0);
        [model2, X2] = train_b('data/set_train', 'data/targets.csv', fun2, parameters2);  
        
        fun3 = 'feature_extract11';
        parameters3 = struct('up', 3,...
                            'down',3,...
                            'centerpoint', 590,...
                            'offset', 70,...
                            'target', 0);
        [model3, X3] = train_b('data/set_train', 'data/targets.csv', fun3, parameters3); 
        
       fun4 = 'feature_extract_intensity_limits_1';
        parameters4 = struct('up', 1,...
                            'down',1,...
                            'threshold', 730,...
                            'limits', 5,...
                            'target', 0);
        [model5, X12] = train_b('data/set_train', 'data/targets.csv', fun4, parameters4); 
        
 Y = csvread('data/targets.csv');
% X_order = orderfeatures(X1);
% model1.RMSE
% plot(X_order);
%disp('Training finished successfully!');
%         disp(['The RMSE is: ' num2str(model1.RMSE) ' for centerpoint: ' num2str(iteration1)...
%             ' offset: ' num2str(iteration2) ' - ' num2str(100*(iteration1 - iteration_1_lower) /...
%             (iteration_1_upper - iteration_1_lower)) ' % done!']);
%         if (model1.RMSE < besterror)
%             besterror = model1.RMSE;
%             bestparams = [centerpoint, offset];
%         end
%     end
% end
    
    for i = 1:278
        X4(i,1) = X1(i,1)^2;
        X5(i,1) = X1(i,1)^3;
        X6(i,1) = X2(i,1)^2;
        X7(i,1) = X2(i,1)^3;
        X8(i,1) = X3(i,1)^2;
        X9(i,1) = X3(i,1)^3;
        X10(i,1) = X3(i,2)^2;
        X11(i,1) = X3(i,2)^3;
        
    end
    X = [X1 , X2, X3, X4, X5, X6, X7, X8, X9, X10];
    model4 = LinearModel.fit(X, Y, 'RobustOpts', 'on');
    RMSE = [model1.RMSE;...
            model2.RMSE;...
            model3.RMSE;...
            model5.RMSE;...
    ]
    model4.RMSE
% disp(['Optimization terminated with best error: ' num2str(besterror)...
%     ' @centerpoint: ' num2str(bestparams(1,1)) ' and offset: ' num2str(bestparams(1,2))]);
%% train b with linear regression model and parameters

disp('Creating submission file using Data: data/set_test and Targets: data/submit.csv ...');
% submit target values for test set 
submission('data/set_test', 'data/submit.csv', model1, fun1, parameters1);
disp('Submission file created successfully!');