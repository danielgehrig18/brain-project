i = 176/2;
grey_limit = 300;
white_limit = 800;

V_1 = nii_read_volume('data/set_train/train_1.nii');

cross_section = V_1(:,:,i);

color = color_areas(cross_section, grey_limit, white_limit);

imshow(squeeze(color),[]);