% show brains
    V_1 = nii_read_volume('data/set_train/train_168.nii');   %Age: 18
    V_2 = nii_read_volume('data/set_train/train_114.nii');  %Age: 45
    V_3 = nii_read_volume('data/set_train/train_99.nii');   %Age: 70
    V_4 = nii_read_volume('data/set_train/train_163.nii');  %Age: 90
    i = 115;
                     imshow([squeeze(V_1(:,:,i)), squeeze(V_2(:,:,i));
                 squeeze(V_3(:,:,i)), squeeze(V_4(:,:,i))],[]);
                             hold on;
    while 1
        str = input('up = 1 // down = 0    : ');
        switch str
            case 1
                i = i+1
                 imshow([squeeze(V_1(:,:,i)), squeeze(V_2(:,:,i));
                 squeeze(V_3(:,:,i)), squeeze(V_4(:,:,i))],[]);
            case 0
                i = i-1
                imshow([squeeze(V_1(:,:,i)), squeeze(V_2(:,:,i));
                 squeeze(V_3(:,:,i)), squeeze(V_4(:,:,i))],[]);
            case 2
                i = i+5
                 imshow([squeeze(V_1(:,:,i)), squeeze(V_2(:,:,i));
                 squeeze(V_3(:,:,i)), squeeze(V_4(:,:,i))],[]);
            case 9
                i = i-5
                imshow([squeeze(V_1(:,:,i)), squeeze(V_2(:,:,i));
                 squeeze(V_3(:,:,i)), squeeze(V_4(:,:,i))],[]);
            case 3
                i = i+10
                 imshow([squeeze(V_1(:,:,i)), squeeze(V_2(:,:,i));
                 squeeze(V_3(:,:,i)), squeeze(V_4(:,:,i))],[]);
            case 8
                i = i-10
                imshow([squeeze(V_1(:,:,i)), squeeze(V_2(:,:,i));
                 squeeze(V_3(:,:,i)), squeeze(V_4(:,:,i))],[]);
            otherwise
                continue;
        end
end

    