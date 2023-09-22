clear all
close all
clc
pkg load image;
im = imread('C:\Users\Inaci\Documents\imagens\lake.png');
im = double(im);
mini = 9999999;
maxe = 0;
for i=1:size(im,1)
  for j=1:size(im,2)
    pixel = im(i,j);
    if (pixel <mini)
      mini = im(i,j);
    endif;
      if (pixel > maxe)
        maxe = im(i,j);
      endif
  endfor
endfor
novomin = 0;
novomax = 255;
interatual = maxe - mini;
internovo = novomax - novomin;
for i=1:size(im,1)
  for j=1:size(im,2)
    imalargada(i,j) = (im(i,j) - mini) * (internovo / interatual) + novomin;
  endfor
 endfor
 imalargada = uint8(imalargada);
 figure(8),imalargada;
figure(4),imhist(im);
hist = imhist(im(:));
for i=1:3:size(hist,1)
  v1(i)=hist(i);
endfor

Min = min(im(:));
Min = double(Min);
Max = max(im(:));
Max = double(Max);
dif = Max - Min;
dif = double(dif);
x = double(im);
y = 255 * (x-Min) / dif;
y = uint8(y);
figure(1)
imshow(y);
figure(2),imhist(y);
