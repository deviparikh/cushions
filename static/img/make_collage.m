clear all; close all; clc

M = 700;

images = dir('0x*.png');

R = 2;
C = 4;
i = 1;
for r=1:R
    for c=1:C
        dummy = imresize(imread(images(i).name),0.25);
        S = size(dummy,1);
        im{r,c} = uint8(255.*ones(M,M,3));
        im{r,c}((M-S)/2+1:(M-S)/2+S,(M-S)/2+1:(M-S)/2+S,:) = dummy;
        i = i+1;
    end
end
    
imshow(cell2mat(im))
imwrite(cell2mat(im),'collage.png')