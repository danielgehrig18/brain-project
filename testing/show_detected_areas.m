% Show what was detected in the different categories

addpath('../data/set_train','../ReadData3D_version1k/nii')
% current optimal values
white_limit = 1000;
grey_limit = 500;

V_1 = nii_read_volume('data/set_train/train_1.nii');
raw = V_1;

white = (raw > white_limit)*1000;
grey_1 = raw > grey_limit;
grey_2 = raw < white_limit;
grey = (grey_1.*grey_2)*1000;
ventricle_1 = raw < grey_limit;
ventricle_2 = raw > 0;
ventricle = (ventricle_1.*ventricle_2)*1000;


for i = 115:176
    imshow([squeeze(V_1(:,:,i)),squeeze(white(:,:,i));...
        squeeze(grey(:,:,i)),squeeze(ventricle(:,:,i))],[])
    pause(0.5)
end
close
