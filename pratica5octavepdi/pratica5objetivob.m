clear all;
clc;
close all;
pkg load image;
im = imread('C:\Users\Inaci\Downloads\milho.png');
for i=1:size(im,1)
  for j=1:size(im,2)
    blue(i,j)=im(i,j,3);
    green(i,j)=im(i,j,2);
    red(i,j)=im(i,j,1);
  endfor
endfor
figure(1),imshow(blue);
figure(2),imshow(green);
figure(3),imshow(red);
figure(4),imhist(red);
for i=1:size(im,1)
  for j=1:size(im,2)
    if(red(i,j)<=160)
    imMask(i,j)=0;
  else
    imMask(i,j)=255;
    endif
  endfor
endfor
figure(5),imshow(imMask);
for i=1:size(im,1)
  for j=1:size(im,2)
    imFinal(i,j,:)=im(i,j,:)*imMask(i,j);
  endfor
endfor
figure(6),imshow(imFinal);
