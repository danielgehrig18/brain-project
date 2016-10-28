diary;
samples = [];
hold on;

% test feature
fun = 'feature_extract11';
lambda = 0:0.01:3;
alpha = 0.01:0.01:1;

RMSE = [];

% iterate through parameters and display results
disp(strcat('STARTED OPTIMIZATION OF "', fun, '".'));

for a=alpha
    % define parameter struct
    parameters = struct('alpha', a, ...
                        'lambda', l);

    % train the model with the parameters and function
    [B, FitInfo] = lasso(X,y, 'Alpha',a, 'CV', 10); 
    
    % display information
    disp(['Parameters: ', ' Lambda opt: ', num2str(FitInfo.LambdaMinMSE), ...
          ' Alpha: ', num2str(a), ' CV: ', num2str(FitInfo.MSE(FitInfo.IndexMinMSE))]);
    RMSE = [RMSE, FitInfo.MSE(FitInfo.IndexMinMSE)];
    plot(RMSE);
    pause(0.5)
end