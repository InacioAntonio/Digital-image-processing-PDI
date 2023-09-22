pkg load image
im = imread('C:/Users/Inaci/Documents/imagens/lena.png');
tic();
for(i=1:size(im,1))
  for(j=1:size(im,2))
imclara(i,j)=(im(i,j)*0.8)+im(i,j);
  end
end
tempo_decorridofor1 = toc();
figure(1)
imshow(imclara);
tic();
for(i=1:size(im,1))
  for(j=1:size(im,2))
imescura(i,j)=im(i,j)-(im(i,j)*0.8);
  end
end
tempo_decorridofor2 =toc();
figure(2)
imshow(imescura);
tic();
imclara2 = im+(im*0.8);
tempo_decorridosemfor1 =toc();
figure(3);
imshow(imclara2);
tic();
imescura2 = im-(im*0.8);
tempo_decorridosemfor2 = toc();
figure(4);
imshow(imescura2);
figure(5)
subplot(1,3,1), imshow(imclara);
subplot(1,3,2),imshow(imescura);
subplot(1,3,3),imshow(imescura2);
