clear all;
close all;
clc;
pkg load image;
im = imread('C:\Users\Inaci\Documents\imagens\Pratica10Octave.pdi\bode1.png');
ruido = imread('C:\Users\Inaci\Documents\imagens\Pratica10Octave.pdi\ruido.png');
filtro_media =ones(3,3);
soma_filtro_media = sum(sum(filtro_media));

filtro_SobelVertical = [-1,0,-1;-2,0,2;-1,0,1];

soma_filtro_Sobel_Vertical = sum(sum(filtro_SobelVertical));

filtro_SobelHorizontal = [-1,-2,-1;0,0,0;1,2,1];

soma_filtro_Horizontal = sum(sum(filtro_SobelHorizontal));

filtro_Laplace = [0,1,0;1,-4,1;0,1,0];

soma_filtro_Laplace = sum(sum(filtro_Laplace));

filtro_Prewitt_Vertical =[-1,0,1;-1,0,1;-1,0,1];

soma_filtro_Prewitt_Vertical = sum(sum(filtro_Prewitt_Vertical));

filtro_Prewiit_Horizontal = [-1,-1,-1;0,0,0;1,1,1];

soma_filtro_Prewitt_Horizontal = sum(sum(filtro_Prewiit_Horizontal));

filtro_Sharpening = [0,-1,0;-1,5,-1;0,-1,0];

filtro_Normalizacao = [-1,-1,-1;-1,8,1;-1,-1,-1];

soma_filtro_Sharpening = sum(sum(filtro_Sharpening));

im_large = zeros(size(im,1)+2,size(im,2)+2);

cabra = rgb2gray(im);

for i=1:size(im_large,1)-2
  for j=1:size(im_large,2)-2
    im_large(i,j)=cabra(i,j);
  endfor
endfor
viz = zeros(4,4);
for i=size(im_large,1):-1:4
  for j=size(im_large,2):-1:4
    if im_large(i,j)==0
      im_large(i,j) = im_large(i-2,j-2);
      endif
  endfor
endfor
testes=uint8(im_large)
figure(2),imshow(testes);
resultado = double(zeros(3,3));
im_SaidaMedia = zeros(size(im_large,1),size(im_large,2),3);
%%for canal=1:3
%%cont = 0;
for canal=1:3
  for i=1:size(im_large,1),
    for j=1:size(im_large,2)
    if i< size(im_large,1)-3 && j<size(im_large,2)-3
    ElementoEs = im_large(i:i+3,j:j+3,canal);
    im_SaidaMedia(i,j,canal) =sum(sum(sum(ElementoEs)))/9;
    %%cont = 0;
    endif
    endfor
  endfor
endfor
im_SaidaMedia = uint8(im_SaidaMedia);
figure(1),imshow(im_SaidaMedia);

im_SaidaSobelVertical = zeros(size(im_large,1),size(im_large,2));

resultado = zeros(1,9);

z1 = 1;

im_large = double(im_large);

ElementoEs = double(ElementoEs);

im_SaidaSobelVertical = double(im_SaidaSobelVertical);

im_Saida_Normaliza(:,:) = double(im_large(:,:));
im_Saida_Normaliza = double(im_Saida_Normaliza);
%%for canal=1:3
  for i=2:size(im_large,1)-1
    for j=2:size(im_large,2)-1
             resultado = double ((im_large(i-1:i+1,j-1:j+1).*filtro_SobelHorizontal));
             im_SaidaSobelVertical(i,j) = sum(sum(resultado));
      endfor
    endfor
  %%endfor
  im_SaidaSobelVertical= uint8(im_SaidaSobelVertical);
  figure(5),imshow(im_SaidaSobelVertical);
figure(3),imshow(im_SaidaSobelVertical);im_SaidaSobelVertical = conv2(cabra,filtro_SobelHorizontal,'valid');

