clear all;
clc;
close all;
pkg load image;
im = imread('C:\Users\Inaci\Downloads\neuron.jpg');
resultado=im(:,:,1)-im(:,:,2)-im(:,:,3);
figure(1),imshow(resultado);
for i=1:size(im,1)
  for j=1:size(im,2)
    red(i,j)=im(i,j,1);
    green(i,j)=im(i,j,2);
    blue(i,j)=im(i,j,3);
  endfor
endfor
figure(2),imshow(red);
figure(3),imshow(green);
figure(4),imshow(blue);
figure(5),imhist(red);
for i=1:size(im,1)
  for j=1:size(im,2)
    if(red(i,j)< 225)
    if(red(i,j)< 225)
    imMask(i,j)=0;
  else
    imMask(i,j)=255;
    endif;
  endfor
endfor
imMask = uint8(imMask);
figure(6),imshow(imMask);
imFinal = im;
for i=1:size(im,1)
  for j=1:size(im,2)
    imFinal(i,j,:)=im(i,j,:)*imMask(i,j);
  endfor
endfor
imFinal = uint8(imFinal);
figure(7),imshow(imFinal);
