clear all;
close all;
clc;
pkg load image;
im = imread('C:\Users\Inaci\Documents\imagens\pratica7octavepdi\space_invaders.png');
im = uint8(im);
cont2=0;
view=0;

vizinho_cima=0;
vizinho_esquerda=0;
r = ones(size(im,1),size(im,2));
duvidas = zeros(1,(size(im,1)));
vizinhos = zeros(8,8);
f = 0;
for i=1:size(im,1)
  for j=1:size(im,2)
  if(im(i,j))
    if (i>1)
      vizinho_cima=(max(r(i-1,j)));
    endif
    if(j>1)
     vizinho_esquerda=(max(r(i,j-1)));
    endif
     if (vizinho_cima==0 && vizinho_esquerda==0)
       cont2++;
       view+=10;
       r(i,j) = 10+view;
     elseif vizinho_cima==0
       r(i,j)=vizinho_esquerda;
     elseif vizinho_esquerda==0
       r(i,j)=vizinho_cima;
     else
       f++;
       r(i, j) = min(vizinho_cima, vizinho_esquerda);
        duvidas(f) = (r(i,j));
       %r(i,j) = min(vizinhos(vizinhos>0));
       %for k=1:length(vizinhos)
         %if(vizinhos(k) > 0 && vizinhos(k) ~= r(i,j))
         %r(r ==vizinhos(k)) = r(i,j);
          %endif
        %endfor
      endif
    endif
  endfor
endfor
duvidas = unique(duvidas);
r = uint8(r);
figure(3),imshow(r);
tam = size(duvidas,2);
num_regioes_distintas = cont2 - tam;
duvidas2 = zeros(1,size(im,1));
z = zeros(size(im,1),size(im,2));
k=0;
t=0;
f=0;
q=0;
rotulos=0;
view2=0;
n=0;
vizinho_cima=0;
vizinho_esquerda=0;
vizinho_diagonal=0;
vizinho_diagonald=0;
vizinhos =0;
r = zeros(size(im,1),size(im,2));
im = logical(im);
rotulos = 0;
view2=0;
for i=4:size(im,1)-4
  for j=4:size(im,2)-4
   if im(i,j)
       vizinhos = im(i-4+1:i+4,j-4+1:j+4);
     if all(all(vizinhos))==0
       rotulos++;
       view2+=10;
       r(i,j)=view2;
      endif
   endif
  endfor
 endfor
 disp(rotulos);
 r = uint8(r);
 figure(5),imshow(r);
 duvidas2 = unique(duvidas2);
 tam = size(duvidas2,2);
 num_regioes_distintas8=rotulos-tam;
disp(['Número de regiões distintas na vizinhança de 4: ', num2str(num_regioes_distintas)]);
