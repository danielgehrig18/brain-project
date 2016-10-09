function [ x ] = feature_extract3( path_name , limit1, limit2)
%FEATURE_EXTRACT extracts percentages of ventricular, white brain mass and
%grey brain mass from an image. Limit1 and limit2 are parameters for
%gwv_weights that calculates the fractions. 

% calculate fractions
im = csvread(path_name);
h = size(im);

for i=h(2):-1:1
    if im(i) ~= 0
        effective_size = i;
        break
    end
end
adj_limit_1 = limit1 * effective_size/h(2);
adj_limit_2 = limit2 * effective_size/h(2);

x = sum(im(ceil(adj_limit_1):floor(adj_limit_2)));
x = x + (ceil(adj_limit_1)-adj_limit_1)*im(floor(adj_limit_1));
x = x - (floor(adj_limit_2)-adj_limit_2)*im(ceil(adj_limit_2));
end

