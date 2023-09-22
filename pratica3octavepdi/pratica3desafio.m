clear all;
clc;
close all;
pkg load image;
im = imread('C:\Users\Inaci\Documents\imagens\real.png');
num_bits = 8;
imagens_bits = cell(1, num_bits);
for i=1:num_bits
  bit_mask = bitshift(uint8(1),i-1);
  imagem_bit = bitand(im,bit_mask);
  imagens_bits(i)=uint8(imagem_bit*255);
endfor
for i =1:num_bits
  subplot(2,4,i);
  imshow(imagens_bits{i});
  title(['Bit ' num2str(i - 1)]);
  endfor
