% Show what was detected in the different categories

% current optimal values
white_limit = 810;
grey_limit = 720;

V_1 = nii_read_volume('data/set_train/train_1.nii');
raw = V_1;

white = (raw > white_limit)*255;
grey_1 = raw > grey_limit;
grey_2 = raw < white_limit;
grey = (grey_1.*grey_2)*255;
ventricle_1 = raw < grey_limit;
ventricle_2 = raw > 0;
ventricle = (ventricle_1.*ventricle_2)*255;


for i = 1:176
    imshow([squeeze(V_1(i,:,:)),squeeze(white(i,:,:));...
        squeeze(grey(i,:,:)),squeeze(ventricle(i,:,:))],[])
    pause(0.1)
end
close
