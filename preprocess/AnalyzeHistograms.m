% Show grey histograms

% Load certain histograms into workspace
folder = '../data/greyhisto_train/';
% Which histograms are loaded (Number)
ages = {'20','20','50','50','87','89','89','90','96','94'};
loadHistogram = [124 129 214 217 31 99 89 118 168 114];

% ages = {'87','89','89','90','96','94'};
% loadHistogram = [31 99 89 118 168 114];

% Handle cell
H = cell(1,length(loadHistogram));
count = 0;
for i = loadHistogram
    count = count+1;
    load(strcat(folder,'train_',num2str(i),'.mat'));
    H{count} = temp_GH;
end

%%
% Scale grey values w.r.t. the largest grey value of all loaded images
% Find largest grey value
maxval = 0;
for i = 1:length(loadHistogram)
    if maxval < size(H{i},1)
        maxval = size(H{i},1);
    end
end


% plot
close
for i = 1:length(loadHistogram)
%     X = normhisto(H{i})*maxval;
    plot(H{i})
    hold on
end
legend(ages)
xlabel('Grey values')
ylabel('Quantity')
xlim([0 2000])
hold off

