clear all;
clc;
close all;
pkg load image;
passaro = imread('C:\Users\Inaci\Downloads\images\object_3.jpg');
mascara = imread('C:\Users\Inaci\Downloads\images\mask_1.bmp');
fundo = imread('C:\Users\Inaci\Downloads\images\background_5.jpg');
montanha = imread('C:\Users\Inaci\Downloads\images\object_5.jpg');
quadro = zeros(512,512, "uint8");
quadro = 255;
contador = 512;
figure(90),imshow(mascara);
mascara = logical(mascara);
figure(4),imshow(passaro);
for i=1:size(passaro,1)
  for j=1:size(passaro,2)
    negativop(i,j)=255-passaro(i,j);%negativo%
  endfor
endfor
figure(3),imshow(negativop);
for i=1:size(negativop,1)
  for j=1:size(negativop,2)
    npfund(i,j)=fundo(i,j)-negativop(i,j);%subtrair com o fundo%
  endfor
endfor
figure(2),imshow(npfund);
for i=1:size(npfund,1)
  contador=512;
  for j=1:size(npfund,2)
    npfunde(i,j)=npfund(i,(contador--));
  endfor
endfor
figure(6),imshow(npfunde);
for i=1:size(npfunde,1)
  for j=1:size(npfunde,2)
    npfudem(i,j)=npfunde(i,j)*mascara(i,j);
  endfor
endfor
figure(9),imshow(npfudem);
contador = 512;
for i=1:size(npfudem,1)
  for j=1:size(npfudem,2)
    npfudemr(i,j)=npfudem(contador,j);
  endfor
  contador--;
endfor
quadro = npfudemr;
figure(1),imshow(quadro);

