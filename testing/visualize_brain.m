% show brains

close all

V_1 = nii_read_volume('data/set_train/train_23.nii');   %Age: 18
V_2 = nii_read_volume('data/set_train/train_172.nii');  %Age: 45
V_3 = nii_read_volume('data/set_train/train_14.nii');   %Age: 70
V_4 = nii_read_volume('data/set_train/train_118.nii');  %Age: 90
for i=1:176
    V_1 = mean(V_1, 1);
    V_2 = mean(V_2, 1);
    V_3 = mean(V_3, 1);
    V_4 = mean(V_4, 1);
    
    V_1 = uint8(V_1 * 255 / max(V_1(:)));
    V_2 = uint8(V_2 * 255/ max(V_2(:)));
    V_3 = uint8(V_3 * 255/ max(V_3(:)));
    V_4 = uint8(V_4 * 255/ max(V_4(:)));
    
    imshow([squeeze(V_1), squeeze(V_2);
            squeeze(V_3), squeeze(V_4)],[]);
   % pause(0.2)
end

    