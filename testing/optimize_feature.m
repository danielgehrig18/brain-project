
% test feature
%training_samples = load_training_samples();
%targets = load_targets();
z = zeros(60,90);
p = 0;
for limit1=680:5:720
    limit1
    for limit2=810:5:850
        X = [];
        for i=1:80
            x = feature_extract(training_samples(:,:,:,i), limit1, limit2);
            X = [X; x];
        end

        b = inv(X'*X)*X'*targets; 

        z(limit1/5,limit2/5) = (X*b-targets)'*(X*b-targets);
        p = p-1
    end
end
    
        

