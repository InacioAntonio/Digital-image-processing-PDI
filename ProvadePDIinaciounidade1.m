clear all;
clc;
close all;
pkg load image;
#Codigo de Inácio Antonio de SOuza Garcia
mascara = imread('C:/Users/Inaci/Documents/imagens/p10/mask_10.png');
barco = imread('C:/Users/Inaci/Documents/imagens/p10/land_10.png');
tigre = imread('C:/Users/Inaci/Documents/imagens/p10/animal_10.png');
tads = imread('C:/Users/Inaci/Documents/imagens/p10/tads_10.png');
fundo = imread('C:/Users/Inaci/Documents/imagens/p10/text_10.png');
#figure(1),imshow(barco);
barcoEstourado(:,:,:)=barco(:,:,:)+100;
#figure(1),imshow(barcoEstourado);
figure(1),imhist(mascara);
imfinal(:,:,:)=mascara(:,:,:);
for i=1:size(mascara,1)
  for j=1:size(mascara,2)
    if(mascara(i,j)>=179 && mascara(i,j)<185)
    imfinal(i,j,:)=barcoEstourado(i,j,:);
   endif
  endfor
endfor
#figure(2),imshow(imfinal);
for i=1:size(tigre,1)
  tigreRotando(:,size(tigre,2)-i+1,:)=tigre(i,:,:);
endfor
figure(2),imshow(tigreRotando);
tigreRotando=rgb2gray(tigreRotando);
tigreRotando=repmat(tigreRotando,[1,1,3]);
for i=1:size(imfinal,1)
  for j=1:size(imfinal,2)
    if(mascara(i,j)==0)
    imfinal(i,j,:)=tigreRotando(i,j,:);
    endif
  endfor
endfor
#figure(3),imshow(imfinal);
for i=1:size(imfinal,1)
  for j=1:size(imfinal,2)
    if(mascara(i,j,:)==127)
    imfinal(i,j,1)=0;
    imfinal(i,j,2)=255;
    imfinal(i,j,3)=0;
    endif
  endfor
endfor
#figure(3),imshow(imfinal);
for i=1:size(tads,1)
  for j=1:size(tads,2)
    if(tads(i,j)>200)
    tads(i,j,:)=fundo(i,j,:);

    endif
  endfor
endfor
#figure(3),imshow(tads);
for i=1:size(imfinal,1)
  for j=1:size(imfinal,2)
    if(mascara(i,j)>250)
    imfinal(i,j,:)=0;
    preto(i,j,:)=imfinal(i,j,:);
    endif
  endfor
endfor
figure(4),imshow(preto);
barcoriscado=barco;
for i=1:size(barco,1)
  for j=1:size(barco,2)
    if mod(j,7)==0
      barcoriscado(i,j,:)=0;
    endif
  endfor
endfor
#figure(3),imshow(barcoriscado);
for i=1:size(imfinal,1)
  for j=1:size(imfinal,2)
    if(mascara(i,j)==60)
    imfinal(i,j,:)=barcoriscado(i,j,:);
    endif;
  endfor;
endfor;
#figure(3),imshow(imfinal);
linham=size(preto,1)/2;
colunam=size(preto,2)/2;
for i=1:size(tads,1)
  for j=1:size(tads,2)
    preto(i,colunam+j+100,:)=tads(i,j,:);
  endfor
endfor
figure(5),imshow(preto);

for i=1:size(imfinal,1)
  for j=1:size(imfinal,2)
    if(mascara(i,j)==255)
    imfinal(i,j,:)=preto(i,j,:);
    endif
  endfor
endfor
figure(3),imshow(imfinal);
