diary;
samples = [];

% test feature
fun = 'feature_extract3';
intervals = 1:20;

% iterate through parameters and display results
disp(strcat('STARTED OPTIMIZATION OF "', fun, '".')); 
for i=intervals
    % define parameter struct
    parameters = struct('intervals', i);
    
    % train the model with the parameters and function
    [model, X] = train_b('data/set_train', 'data/targets.csv', fun, p);
    
    % save sample in data structure
    RMSE = [RMSE, struct('RMSE', model.RMSE, 'Parameters', parameters)];
   
    % display information
    disp('------------------');
    disp(strcat('Parameters: ',  num2str(p)));
    disp(strcat('RMSE: ',  num2str(model.RMSE)));
end



