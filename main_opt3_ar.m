% Run preprocessing: generate grey histograms
% Run optimization

cd('preprocess')

run('Generate_GreyHistos.m')

cd('../testing')

run('optimize_feature_ar_fe03.m')
