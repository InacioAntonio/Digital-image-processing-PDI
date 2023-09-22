pkg load image;
im = imread('C:/Users/Inaci/Documents/imagens/lena.png');
cont = 256;
for(i=1:size(im,1))
  for(j=1:size(im,2))
    imDegrade(i,j) = im(i,j)-(cont-j);
  end
end
figure(1);
imshow(imDegrade);
imPoste=im;

for(i=1:size(im,1))
  for(j=1:size(im,2))
      if(imPoste(i,j)>=0) && (imPoste(i,j)<=82)
          imPoste(i,j)=0;
     else
        if(imPoste(i,j)>=83)&&(imPoste(i,j)<=164)
          imPoste(i,j)=126;
      else
          imPoste(i,j)=255;
      endif
      endif
    endfor
endfor

figure(2);
imshow(imPoste);
figure(3);
subplot(1,3,1), imshow(im);
subplot(1,3,2), imshow(imDegrade);
subplot(1,3,3), imshow(imPoste);


