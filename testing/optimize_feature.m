diary;
samples = [];
hold on;

% test feature
fun = 'feature_extract10';
cutoff = 4;
bins = 50:50:2000;

RMSE = [];
y = [];
% iterate through parameters and display results
disp(strcat('STARTED OPTIMIZATION OF "', fun, '".')); 
for g=cutoff
    for h=bins
        % define parameter struct
        parameters = struct('bins', h, ...
                            'cutoff', g);

        % train the model with the parameters and function
        [model, X] = train_b('data/set_train', 'data/targets.csv', fun, parameters);

        % save sample in data structure
        RMSE = [RMSE, struct('RMSE', model.RMSE, ...
                             'Parameters', parameters, ...
                             'BIC', model.ModelCriterion.BIC, ...
                             'Rsquared', model.Rsquared)];

        % display information
        disp('------------------');
        disp('Parameters: ');
        disp(parameters);
        disp('RMSE: ');
        disp(model.RMSE);
        disp('R values: '); 
        disp(model.Rsquared);
        disp('Bayesian Information Criterion: ');
        disp(model.ModelCriterion.BIC);
        y = [y, model.ModelCriterion.BIC];
        plot(y);
        pause(0.5)
    end
end


