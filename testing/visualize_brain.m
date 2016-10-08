% show brains
for i=1:176
    V_1 = nii_read_volume('data/set_train/train_23.nii');   %Age: 18
    V_2 = nii_read_volume('data/set_train/train_172.nii');  %Age: 45
    V_3 = nii_read_volume('data/set_train/train_14.nii');   %Age: 70
    V_4 = nii_read_volume('data/set_train/train_118.nii');  %Age: 90
    imshow([squeeze(V_1(i,:,:)), squeeze(V_2(i,:,:));
            squeeze(V_3(i,:,:)), squeeze(V_4(i,:,:))],[]);
    %pause(0.1)
end

    