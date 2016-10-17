diary;
% test feature
fun = 'feature_extract3';
parameters = 300;

% iterate through parameters and display results
disp(strcat('STARTED OPTIMIZATION OF "', fun, '".')); 
for p=parameters
    [model, X] = train_b('data/set_train', 'data/targets.csv', fun, p);
    disp(strcat('Parameters: ',  num2str(p)));
    disp(strcat('RMSE: ',  num2str(model.RMSE)));
    disp('------------------');
end



