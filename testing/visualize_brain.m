% show brains
for i=1:176
    V_1 = nii_read_volume('data/set_train/train_1.nii');
    V_2 = nii_read_volume('data/set_train/train_2.nii');
    V_3 = nii_read_volume('data/set_train/train_3.nii');
    V_4 = nii_read_volume('data/set_train/train_4.nii');
    imshow([squeeze(V_1(i,:,:)), squeeze(V_2(i,:,:));
            squeeze(V_3(i,:,:)), squeeze(V_4(i,:,:))],[]);
    pause(0.1)
end

    