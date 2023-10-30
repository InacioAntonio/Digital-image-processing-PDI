clc;
clear all;
close all;
pkg load image;
im = imread('C:\Users\Inaci\Documents\imagens\pratica6octavepdi\mapa_menor.png');
imshow(im(:,:,1));
linhai = 0;
colunai = 0;
limiar(:,:,:)=im(:,:,:);
limiar(:,:,1)=0;
limiar(:,:,2)=0;
limiar(:,:,3)=im(:,:,3);
for i=1:size(im,1)
  for j=1:size(im,2)
  if(limiar(i,j,3)>=200)
    limiar(i,j,:)=255;
  else
    limiar(i,j,:)=0;
    endif
  endfor
 endfor
figure(3),imshow(limiar);
for i=1:size(im,1)
  for j=1:size(im,2)
    if(limiar(i,j,:)==255)
    linhai=i;
    colunai=j;
    flag=true;
  endif
  if(flag)
  break;
    endif
  endfor
endfor
imgrafico(:,:,:)=im(:,:,:);
imgrafico(linhai,:,:)=0;
imgrafico(:,colunai,:)=0;
figure(7),imshow(imgrafico);
linhaf=0;
colunaf=0;
flag = false;
for i=size(im,1):-1:1
  for j=size(im,2):-1:1
    if(limiar(i,j,:)==255)
    linhaf=i;
    colunaf=j;
    flag = true;
  endif
  if(flag)
    break;
    endif
  endfor
endfor
d = ((linhaf-linhai)^2+(colunaf-colunai)^2)^0.5;
disp(d);
figure(2),imshow(im);
comecoL=0;
comecoC=0;
flag = false;
for i=1:size(im,1)
  for j=1:size(im,2)
    if(im(i,j,1)>=200)
    comecoL=i;
    comecoC=j;
    flag = true;
  endif
  if(flag)
  break;
    endif
  endfor
endfor
fimL=0;
fimC=0;
flag = false;
for i=size(im,1):-1:1
  for j=size(im,2):-1:1
    if(im(i,j,1)>=170)
    fimL=i;
    fimC=j;
    flag=true;
  endif
  if(flag)
  break;
  endif
  endfor
endfor
dv = ((fimL-comecoL)^2+(fimC-comecoC)^2)^0.5;
disp(dv);
x = (dv*10)/139.82;
fprintf('A distancia dos 2 pontos  vermelhos em km é %d',x);
altura = fimL-comecoL;
base = fimC - comecoC;
alturaK = (altura*10/d);
baseK = (base*10/d);
area = alturaK*baseK;
fprintf('A area em destaque pelos pixels vermelhos é %d',area);
