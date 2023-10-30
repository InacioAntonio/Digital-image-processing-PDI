clear all;
close all;
clc;
pkg load image;
im = imread('C:\Users\Inaci\Documents\imagens\Pratica 8ocatvepdi\imagem.png');
linha = (size(im,1))/2;
coluna = (size(im,2))/2;
reducao = zeros(linha,coluna,3);
for i=2:2:size(im,1);
  for j=2:2:size(im,2)
    reducao(i/2,j/2,:)=im(i,j,:);
  endfor
endfor
k=0;
i2=0;
z=0;
reducao=uint8(reducao);
figure(1),imshow(reducao);
reducao2 = zeros(linha,coluna,3);
soma =0;
media=0;
vizinho_esquerda=0;
vizinho_cima=0;
vizinho_diagonal=0;
vizinho_diagonald=0;
im = double(im);
for i=2:2:size(im,1)
  for j=2:2:size(im,2)
    if(i>1)
    vizinho_cima=im(i-1,j,:);
    %soma+=vizinho_cima;
  endif
  if (j>1)
    vizinho_esquerda=im(i,j-1,:);
    %soma+=vizinho_esquerda;
  endif
  if (i>1 && j>1)
    vizinho_diagonal=im(i-1,j-1,:);
    %soma+=vizinho_diagonal;
    endif
    if(j<size(im,2))
    vizinho_diagonald=im(i-1,j+1,:);
    %soma+=vizinho_diagonald;
    endif
    %media=(soma/4)
    reducao2(i/2,j/2,:)=(vizinho_cima+vizinho_esquerda+vizinho_diagonal+vizinho_diagonald)/4;
  endfor
endfor
reducao2=uint8(reducao2);
figure(2),imshow(reducao2);
linha2=size(im,1)*2;
coluna2=size(im,2)*2;
aumento=zeros(linha2,coluna2,3);
for i=2:2:linha2
  for j=2:2:coluna2
    aumento(i,j,:)=im(i/2,j/2,:);
  endfor
endfor
aumento = uint8(aumento);
figure(3),imshow(aumento);
tic;
simples(:,:,:)=aumento(:,:,:);
im = double(simples);
for i=1:linha2
  for j=1:coluna2
    if simples(i,j,:)==0
      if i>1
      vizinho_esquerda=double(simples(i-1,j,:));
    endif
     if j>1
       vizinho_cima=double(simples(i,j-1,:));
     endif
     if i>1 && j>1
       vizinho_diagonal=double(simples(i-1,j-1,:));
     endif
     if i>1  && j<size(simples,2)
       vizinho_diagonald=double(simples(i-1,j+1,:));
      endif
      simples(i,j,:)=(vizinho_cima+vizinho_esquerda+vizinho_diagonal+vizinho_diagonald)/4;
  else
    simples(i,j,:)=simples(i,j,:);
    endif
  endfor
endfor
toc;
simples=uint8(simples);
figure(7),imshow(simples);
simplesv(:,:,:)=aumento(:,:,:);
tic;
for i=1:size(aumento,1)
  for j=1:size(aumento,2)
    if aumento(i,j,:)==0
      if i>1
        vizinho_esquerda=double(simples(i-1,j,:));
      endif
      if j>1
        vizinho_cima=double(simples(i,j-1,:));
      endif
      if i>1 && j>1
        vizinho_diagonal=double(simples(i-1,j-1,:));
      endif
      if i>1 && j<size(im,2)
        vizinho_diagonald=double(simples(i-1,j+1,:));
      endif
      if(vizinho_cima!=0)
      simplesv(i,j,:)=vizinho_cima;
    elseif vizinho_diagonal!=0
      simplesv(i,j,:)=vizinho_diagonal;
    elseif vizinho_diagonald!=0
      simplesv(i,j,:)=vizinho_diagonald;
    elseif vizinho_esquerda!=0
      simplesv(i,j,:)=vizinho_esquerda;
    endif
    endif
  endfor
endfor
simplesv=uint8(simplesv);
figure(10),imshow(simplesv);
toc;
bicubica(:,:,:)=aumento(:,:,:);
media =0;
aumento=double(aumento);
bicubica=double(bicubica);
vizinho_diagonalz=0;
vizinho_diagonalf=0;
vizinho_baixo=0;
vizinho_direita=0;
vizinho_cima=0;
qtd1=2;
qtd2=4;
qtd3=8;
tic
for i=1:size(aumento,1)
  for j=1:size(aumento,2)
    if aumento(i,j,:)==0
      if i<size(aumento,1) && j<size(aumento,2)
      vizinho_diagonal=double(bicubica(i+1,j+1,:));
    endif
    if i>1 && j<size(aumento,2)
      vizinho_diagonald=double(bicubica(i-1,j+1,:));
    endif
    if i>1 && j>1
      vizinho_diagonalz=double(bicubica(i-1,j-1,:));
    endif
    if i<size(aumento,1) && j>1
      vizinho_diagonalf=double(bicubica(i+1,j-1,:));
      endif
      if (i==1 || j==1)
        if i>size(im,1)
        vizinho_direita=double(bicubica(i+1,j,:));
        endif
        if j<size(im,2)
        vizinho_baixo=double(bicubica(i,j+1,:));
      endif
      if vizinho_baixo==0
        bicubica(i,j,:)=vizinho_direita;
      elseif vizinho_direita==0;
        bicubica(i,j,:)=vizinho_baixo;
        endif
      elseif (i==size(aumento,1) || j==size(aumento,2))
        if j>1
        vizinho_cima=bicubica(i, j-1, :);
      endif
      if i>1 && j>1
        vizinho_esquerda=double(bicubica(i-1,j-1,:));
      endif
      if vizinho_cima==0;
        bicubica(i,j,:)=vizinho_esquerda;
      elseif vizinho_esquerda==0
        bicubica(i,j,:)=vizinho_cima;
        endif
      elseif(vizinho_diagonal>0 && vizinho_diagonald > 0 && vizinho_diagonalf > 0 && vizinho_diagonalz > 0)
        if j>1
      vizinho_cima=bicubica(i,j-1,:);
       endif
        if i>1
        vizinho_esquerda=bicubica(i-1,j,:);
      endif
      if i<size(im,1)
        vizinho_baixo=bicubica(i+1,j,:);
      endif
      if j<size(im,1)
        vizinho_direita=bicubica(i,j+1,:);
      endif
      qtd3=8;
      if vizinho_cima==0
        qtd3--;
      endif
      if vizinho_esquerda==0
        qtd3--;
      endif
     if vizinho_direita==0
       qtd3--;
     endif
     if vizinho_baixo==0
       qtd3--;
       endif
        bicubica(i,j,:)=(vizinho_baixo+vizinho_cima+vizinho_diagonal+vizinho_diagonald+vizinho_diagonalz+vizinho_diagonalf+vizinho_esquerda+vizinho_direita)/qtd3;
      else
        if j>1
        vizinho_cima=bicubica(i,j-1,:);
      endif
      if i>1
        vizinho_esquerda=bicubica(i-1,j,:);
      endif
       if i<size(aumento,1) && j<size(aumento,2)
      vizinho_diagonal=double(bicubica(i+1,j+1,:));
    endif
    if i>1 && j<size(aumento,2)
      vizinho_diagonald=double(bicubica(i-1,j+1,:));
    endif
    qtd2=4;
    if vizinho_cima==0
      qtd2--;
    endif
    if vizinho_diagonal==0
      qtd2--;
    endif
    if vizinho_esquerda==0
      qtd2--;
    endif
    if vizinho_diagonald==0
      qtd2--;
    endif
        bicubica(i,j,:)=(vizinho_cima+vizinho_diagonal+vizinho_diagonald+vizinho_esquerda)/4;
      endif
    else
      bicubica(i,j,:)=bicubica(i,j,:);
    endif
  endfor
endfor
toc;
bicubica=uint8(bicubica);
figure(12),imshow(bicubica);


