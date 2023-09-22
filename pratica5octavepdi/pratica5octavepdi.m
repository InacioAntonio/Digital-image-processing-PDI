clear all;
clc;
close all;
pkg load image;
im = imread('C:\Users\Inaci\Downloads\cores.jpg');
for i=1:size(im,1)
  for j=1:size(im,2)
    cinza(i,j,:)=(im(i,j,1)*0.2989)+(im(i,j,2)*0.5870)+(im(i,j,3)*0.1140);
    red(i,j)=im(i,j,1);
    green(i,j)=im(i,j,2);
    blue(i,j)=im(i,j,3);
  endfor;
endfor;
figure(1),imshow(cinza);
figure(2),imshow(red);
figure(3),imshow(green);
figure(4),imshow(blue);
