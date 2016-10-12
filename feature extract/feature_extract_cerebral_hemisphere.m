%function [ x ] = feature_extract_cerebral_hemisphere( path_name, threshold )
%FEATURE_EXTRACT_CEREBRAL_HEMISPHERE Summary of this function goes here
%   Detailed explanation goes here
clear all
for threshold =  440:2:480 
X = zeros(1,278);
%threshold = 462;    % 0 to 1524 // optimal threshold 462 determined
%through numerical iteration


parfor i=1:278
    path_name = ['data/set_train/train_'  num2str(i) '.nii'];



    im = double(nii_read_volume(path_name));
    cerebral_hemisphere_tissue_volume = 0;
    sz = size(im);
    nonzeros = 0;

    for z=115:sz(3)   %area between top of brain and ventricles
        area = 0;
        for y=1:sz(2)
            for x=1:sz(1)     
                if (im(x,y,z) ~= 0)
                    nonzeros = nonzeros + 1;    %count entire brain volume
                end
                
                if (im(x,y,z) < threshold && im(x,y,z) > 0)
                   area = area + 1;         %found pixel above threshold --> count it to area
                   im(x,y,z) = 0;           %short visualization
                end
            end
        end
            cerebral_hemisphere_tissue_volume = cerebral_hemisphere_tissue_volume + area*1; %thickness of slice = 1
    end
    normalized_tissue = cerebral_hemisphere_tissue_volume/nonzeros;
    X(1,i) = normalized_tissue;
end

Y = csvread('data/targets.csv');

scatter(Y,X);

hold on;

y_dash = mean(Y);
x_dash = mean(X);

sz = size(Y);
Sxx = 0;
Syy = 0;
Sxy = 0;

yCalc = zeros(1,sz(1));
Error = 0;

for i=1:sz(1)
    Sxx = Sxx + (X(1,i) - x_dash)^2;
    Syy = Syy + (Y(i,1) - y_dash)^2;
    Sxy = Sxy + (X(1,i) - x_dash)*(Y(i,1) - y_dash);
end

m = Sxy/Sxx;
b = y_dash - m*x_dash;

for i=1:sz(1)
    yCalc(1,i) = m * X(1,i) + b;
    Error = Error + (yCalc(1,i) - Y(i,1))^2;
end

disp(['The MEAN-Error is: ' num2str(sqrt(Error/278)) ' years @ Threshold: ' num2str(threshold)]);


plot(yCalc,X)
hold off
end


