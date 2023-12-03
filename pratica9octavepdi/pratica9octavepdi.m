clear all;
clc;
close all;
pkg load image;
im=imread('C:\Users\Inaci\Documents\imagens\pratica9octavepdi\brain.png');
im2=imread('C:\Users\Inaci\Documents\imagens\pratica9octavepdi\orgao.png');
im3=imread('C:\Users\Inaci\Documents\imagens\pratica9octavepdi\ruido.png');
imLogical = logical(im);
acao=input('Digite 1 para ERODiR ou 2 para Dilatar: ');
patch = zeros(
if acao==1
  formato=input('Gostaria 1 para quadrado ou 2 rhombus: ');
  if formato==1
    largura=input('Digite a largura do elemento');
    altura=input('Digite a altura do elemento');
    estrutura=ones(altura,largura);
    img_erodida=zeros(size(im));
    for i=1+largura:size(im,1)-largura
      for j=1+altura:size(im,2)-altura
        if im(i,j)==1
          if i+ altura-1 <= size(im,1) && j+largura <= size(im,2)
          estrutura= im(i:i + altura - 1, j:j + largura - 1);
          if all(all(estrutura))==1
            img_erodida(i,j)=1;
          else
            img_erodida(i,j)=0;
            endif
          endif
        endif
      endfor
    endfor
    img_erodida=uint8(img_erodida*255);
    figure(1),imshow(img_erodida);
    else
        raio =input('Digite o raio do elemento estruturante: ');
        estrutura=logical(zeros(raio*2,raio*2));
        distancia =  sqrt((i - medida - 1).^2 + (j - medida - 1).^2 )
        for i=1:size(estrutura,1)
          for j=1:size(estrutura,2)
             if sqrt((i - medida - 1).^2 + (j - medida - 1).^2 ) <= medida
               estrutura(i,j)=1;
             endif
          endfor
        endfor
        for i=1+(raio*2):size(im,1)-(raio*2)
          for j=1+(raio*2):size(im,2)-(raio*2)
            if im(i,j)==1
               if i + (raio*2) - 1 <= size(im, 1) && j + (raio*2) - 1 <= size(im, 2)
                 for k=i:(raio*2)-1
                   for l=j:(raio*2)-1
                  ##nao entendi krl de aza nenhum infelizmente
                   endfor
                   endfor
                 endif
               endif
            endif
          endfor
        endfor
  endif
else
  formato=input('Gostaria q para quadrado ou r rhombus');
  if formato==q
    largura=input('Digite a largura do elemento');
    altura=input('Digite a altura do elemento');
    estrutura=ones(altura,largura);
    img_dilatada(:,:)=im(:,:);
    for i=1+largura:size(im,1)-largura
      for j=1+altura:size(im,2)-altura
        if im(i,j)==0
          if i+altura-1<=size(im,1) && j+largura<=size(im,2)
            estrutura=im(i:i+altura -1,j:j+largura-1);
            if any(any(estrutura))==1
              ##cropei a imagem largura e altura e dps eu vejo se ele cumpi
              img_dilatada(i,j)=1;
            else
              img_dilatada(i,j)=0;
            endif
          endif
        endif
      endfor
    endfor
    img_dilatada=uint8(img_dilatada*255);
    figure(1),imshow(img_dilatada);
    else
    endif
  endif
