% main - main pipeline for training b with a training set from
% 'data/set_train' folder and submission of test values from
% 'data/set_train folder. Train_b is optimized for best r_squared
% (coefficient of determination).

%% choose function1 and its parameters
        fun1 = 'feature_extract12';
        parameters1 = struct('up', 1,...
                            'down',1,...
                            'centerpoint', 0, ...
                            'offset', 0,...
                            'target', 335);
        [model1, X1] = train_b('data/set_train', 'data/targets.csv', fun1, parameters1);
        [XX1] = generate_X('data/set_test', fun1, parameters1);
        
        fun2 = 'feature_extract13';
        parameters2 = struct('up', 1,...
                            'down',1,...
                            'centerpoint', 620,...
                            'offset', 95,...
                            'target', 0);
        [model2, X2] = train_b('data/set_train', 'data/targets.csv', fun2, parameters2);  
        [XX2] = generate_X('data/set_test', fun2, parameters2);  
        
        fun3 = 'feature_extract11';
        parameters3 = struct('up', 3,...
                            'down',3,...
                            'centerpoint', 590,...
                            'offset', 70,...
                            'target', 0);
        [model3, X3] = train_b('data/set_train', 'data/targets.csv', fun3, parameters3); 
        [XX3] = generate_X('data/set_test', fun3, parameters3); 
        
        fun4 = 'feature_extract_intensity_limits_1';
        parameters4 = struct('up', 1,...
                            'down',1,...
                            'threshold', 730,...
                            'limits', 5,...
                            'target', 0);
        [model5, X12] = train_b('data/set_train', 'data/targets.csv', fun4, parameters4); 
        [XX12] = generate_X('data/set_test', fun4, parameters4); 
        
        fun5 = 'feature_extract_3peaks';
        parameters5 = struct('cgone', 220, ...
                             'cgtwo', 750, ...
                             'cgthree', 1450, ...
                             'rangeone', 50, ...
                             'rangetwo', 35, ...
                             'rangethree', 110);
        [model6, X13] = train_b('data/set_train', 'data/targets.csv', fun5, parameters5); 
        
        [XX13] = generate_X('data/set_test', fun5, parameters5); 
        
 Y = csvread('data/targets.csv');
% X_order = orderfeatures(X1);
% model1.RMSE
% plot(X_order);
    for i = 1:278
        X4(i,1) = X1(i,1)^2;
        X5(i,1) = X1(i,1)^3;
        X6(i,1) = X2(i,1)^2;
        X7(i,1) = X2(i,1)^3;
        X8(i,1) = X3(i,1)^2;
        X9(i,1) = X3(i,1)^3;
        X10(i,1) = X3(i,2)^2;
        X11(i,1) = X3(i,2)^3;
        X14(i,1) = X12(i,1)^2;
        X15(i,1) = X12(i,1)^3; 
    end
    for i = 1:138
        XX4(i,1) = XX1(i,1)^2;
        XX5(i,1) = XX1(i,1)^3;
        XX6(i,1) = XX2(i,1)^2;
        XX7(i,1) = XX2(i,1)^3;
        XX8(i,1) = XX3(i,1)^2;
        XX9(i,1) = XX3(i,1)^3;
        XX10(i,1) = XX3(i,2)^2;
        XX11(i,1) = XX3(i,2)^3;
        XX14(i,1) = XX12(i,1)^2;
        XX15(i,1) = XX12(i,1)^3;
    end 

      X = [X1, X2, X3, X4, X5, X6, X7, X8, X9, X10, X11, X13, X14, X15];
      XX = [XX1, XX2, XX3, XX4, XX5, XX6, XX7, XX8, XX9, XX10, XX11, XX13, XX14, XX15];
      
    model4 = LinearModel.fit(X, Y, 'RobustOpts', 'on');
    RMSE = [model1.RMSE;...
            model2.RMSE;...
            model3.RMSE;...
            model5.RMSE;...
            model6.RMSE;...
            ]
    model4.RMSE
    
    
    Y = csvread('data/targets.csv');
    Mdl = fitrensemble(X,Y,'OptimizeHyperparameters','auto',...
    'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName',...
    'expected-improvement-plus'));
    yPredict = predict(Mdl, X);
    norm(Y-yPredict) / sqrt(278)