%function [ output_args ] = feature_extract_grey_matter( input_args )
%FEATURE_EXTRACT_GREY_MATTER Summary of this function goes here
%   Detailed explanation goes here
clear all
smallesterror = 9999999999999999;
optimalthreshold = 0;
optimallimits = 0;
for threshold = 10:10:1500
    for limits = 5:5:400

X = zeros(1,278);       %Greymatter vector
%threshold = 700;    % 0 to 1524 

parfor i=1:278
    path_name = ['data/set_train/train_'  num2str(i) '.nii'];
    im = nii_read_volume(path_name);
%     imx = im;
    sz = size(im);
    

    
    %find mean intensities of images and a total mean
        for z=1:sz(3)   %area between top of brain and ventricles
            meanintensity = 0;
            for y=1:sz(2)
                pixels = 0;
                intensity = 0;
                for x=1:sz(1)     
                    if (im(x,y,z) > (threshold-limits) && im(x,y,z) < (threshold+limits))
                         X(1,i) = X(1,i) + 1;
%                         imx(x,y,z) = 0;
                    end
                end
            end
%         imshow([squeeze(imresize(im(:,:,z),3)),squeeze(imresize(imx(:,:,z),3))],[]);  
%         if (z == 125)
%             f = input('Press any key to continue');
%         end
        end
end

Y = csvread('data/targets.csv');
scatter(Y,X);
hold on;

y_dash = mean(Y);
x_dash = mean(X);

Sxx = 0;
Syy = 0;
Sxy = 0;

yCalc = zeros(1,278);
Error = 0;

for j=1:278
    Sxx = Sxx + (X(1,j) - x_dash)^2;
    Syy = Syy + (Y(j,1) - y_dash)^2;
    Sxy = Sxy + (X(1,j) - x_dash)*(Y(j,1) - y_dash);
end

m = Sxy/Sxx;
b = y_dash - m*x_dash;

for j=1:278
    yCalc(1,j) = m * X(1,j) + b;
    Error = Error + (yCalc(1,j) - Y(j,1))^2;
end
meanerror = sqrt(Error/278);

disp(['The MEAN-Error is: ' num2str(meanerror) ' years @ Threshold: ' num2str(threshold) ' @ Limits ' num2str(limits)]);

if (meanerror < smallesterror)
    smallesterror = meanerror;
    optimalthreshold = threshold;
    optimallimits = limits;
end
plot(yCalc,X)
end
end
disp(['Found optimal MEAN-Error: ' num2str(smallesterror) ' years @ Threshold: ' num2str(optimalthreshold) ' @ Limits ' num2str(optimallimits)]);

