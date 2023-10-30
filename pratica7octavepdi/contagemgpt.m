close all;
clear all;
clc;
pkg load image;
im = imread('C:\Users\Inaci\Documents\imagens\pratica7octavepdi\space_invaders.png');
vizinhos = zeros(1,size(im,2));
rotulos = 0;
z = zeros(size(im));
duvidas = zeros(1,(size(im,1)));
vizinho_cima1 =0
      vizinho_esquerda1= 0;
      vizinho_diagonal1 =  0;
      vizinho_diagonald1 = 0;
for i=1:size(im,1)
  for j=1:size(im,2)
    if(im(i,j))
    if(i>1)
      vizinho_cima1 =  z(i-1,j)
    endif
    if(j>1)
    vizinho_esquerda1 = z(i,j-1)
  endif
  if(i>1 && j>1)
      vizinho_diagonal1 = z(i-1,j-1);
    endif
    if(i>1 && j<size(im,2))
      vizinho_diagonald1 = z(i-1,j+1);
    endif
      vizinhos = [vizinho_cima1 vizinho_esquerda1 vizinho_diagonal1 vizinho_diagonald1];
      vizinhos = vizinhos(vizinhos>0);
      if isempty(vizinhos)
        rotulos++;
        view2=+20
        z(i,j) = view2;
      else
        z(i,j) = min(vizinhos);

      endif
    endif
  endfor
endfor

z = uint8(z);
figure(5),imshow(z)
