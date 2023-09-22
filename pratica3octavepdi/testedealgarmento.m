clear all
close all
clc
pkg load image;
im = imread('C:\Users\Inaci\Documents\imagens\lake.png');
histograma = zeros(1,256);
for i=1:size(im,1)
  for j=1:size(im,2)
    intensidade=im(i,j)+1;%+1 para evitar indices negativos
    histograma(intensidade)=histograma(intensidade)+1;
  endfor
  endfor
 total=179200;
 hist_cum = zeros(1,256)
 hist_cum(1)=histograma(1);
 for i=2:256
   hist_cum(i)=hist_cum(i-1)+histograma(i);
 endfor
 hist_cum = hist_cum/total;
 map = round(hist_cum*255);
for i=1:size(im,1)
  for j=1:size(im,2)
    intensidade= im(i,j)+1;
    imalargada(i,j) = map(intensidade);
  endfor
 endfor
 imalargada=uint8(imalargada);
 imwrite(imalargada,'lakealargado.png');
 fprintf('A imagem foi salva com sucesso como lakealargado.png\n');
 figure(1),imalargada;
 figure(2),imhist(imalargada);

