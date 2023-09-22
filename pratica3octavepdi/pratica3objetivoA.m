clear all
close all
clc
pkg load image;
img = imread('C:\Users\Inaci\Documents\imagens\moon.png');
his = imhist(img);
imbinarizada = logical(img);
figure(1)
imhist(img)
for i=1:size(img,1)
  for j=1: size(img,2)
     if(img(i,j)<120)
     imbinarizada(i,j) = 1;
   else
     imbinarizada(i,j) = 0;
     endif
  endfor
endfor
figure(2);
imshow(imbinarizada);
L =input("Digite um número para limiarizar a imagem : " );
for i=1:size(img,1)
  for j=1:size(img,2)
    if(img(i,j)<=L)
    imbinarizada2(i,j) = 255;
  else
    imbinarizada2(i,j) = 0;
  endif

  endfor
endfor
figure(3);
imshow(imbinarizada2);
img = imread('C:\Users\Inaci\Documents\imagens\moon.png');
iminvertida = img;
for i=1:size(img,1)
  for j=1 : size(img,2)
    iminvertida(i,j) = 255 - img(i,j);
  endfor
endfor
figure(4)
imshow(iminvertida);
for i=1:size(img,1)
  for j=1:size(img,2)
    if (imbinarizada2(i,j)==255)
    imfinal(i,j) = iminvertida(i,j)^1.3;
  else
    imfinal(i,j) = iminvertida(i,j);
    endif
  endfor
endfor
figure(5);
imshow(imfinal);
