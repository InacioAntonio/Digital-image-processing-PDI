clear all;
clc;
pkg load image;
mask1 = imread('C:\Users\Inaci\Documents\imagens\images\mask_3.tif');
mask2 = imread('C:\Users\Inaci\Documents\imagens\images\mask_2.tif');
mask2 = logical(mask2);
mask3 = mask1;
for i=1:size(mask2,1)
  for j=1:size(mask2,2)
  if mask1(i,j)==1
    mask3(i,j)= mask2(i,j);
  else
    mask3(i,j)= mask1(i,j);
  endif
  endfor
endfor
figure(1),imshow(mask3);

