clear all;
close all;
clc;
pkg load image;
imdan = imread('C:\Users\Inaci\Documents\imagens\dance.png');
imdeth = imread('C:\Users\Inaci\Documents\imagens\dance_depth.png');
figure(1),imhist(imdan);
figure(2),imhist(imdeth);
for i=1:size(imdeth,1)
  for j=1:size(imdeth,2)
    if(imdeth(i,j)<=190)
    imdethf(i,j) = 0;
  else
    imdethf(i,j) = imdeth(i,j);
    endif
  endfor
endfor
figure(3),imshow(imdethf);

for i=1:size(imdan,1)
  for j=1:size(imdan,2)
    if(imdethf(i,j)>190)
    imdeth2(i,j) = imdan(i,j);
  else
    imdeth2(i,j) = 0;
    endif
  endfor
endfor
imdeth2 = uint8(imdeth2);
figure(8),imshow(imdeth2);
for i=1:size(imdan,1)
  for j=1:size(imdan,2)
    if(imdeth(i,j)>=100 && imdeth(i,j)<=175)
    imdanf(i,j) =255;
  else
    imdanf(i,j) = 0;
endif

  endfor
endfor
imdanf = uint8(imdanf);
figure(4),imshow(imdanf);
imdanff = imdanf;
for i=1:size(imdan,1)
  for j=1:size(imdan,2)
    if(imdanf(i,j)==255)
    imdanff(i,j) = imdan(i,j);
  else
    indanff(i,j) = imdanf(i,j);
    endif
  endfor
endfor
imdanff =uint8(imdanff);
figure(10),imshow(imdanff);
