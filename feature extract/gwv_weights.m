function [ weights ] = gwv_weights( raw, grey_limit, white_limit )
%COLOR_AREAS Summary of this function goes here
%   Detailed explanation goes here

white = double(raw > white_limit);
grey_1 = raw > grey_limit;
grey_2 = raw < white_limit;
grey = grey_1.*grey_2;
ventricle_1 = raw < grey_limit;
ventricle_2 = raw > 0;
ventricle = ventricle_1.*ventricle_2;

weights = [sum(white(:)),sum(grey(:)),sum(ventricle(:))];
weights = weights/sum(weights(:));
end

