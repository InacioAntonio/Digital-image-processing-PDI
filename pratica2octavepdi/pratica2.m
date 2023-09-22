pkg load image

img2 = zeros(200,200,"uint8");
cont = 0;
figure(2)
imshow(img2)
for(i=1:size(img2,1))
  for(j=1:size(img2,2))
    img2(i,j)=255;
  endfor
endfor
figure(3)
imshow(img2);
cont=255;
for(i=1:size(img2,1))
    for(j=1:size(img2,2))
      img2(i,j)=img2(i,j)-(cont-i);
    endfor
endfor
figure(4)
imshow(img2);
img3=img2;
for(i=1:size(img3,1))
    for(j=1:size(img3,2))
        if(i<10)||(j<10)||(i>185)||(j>185)
            img3(i,j)=126;
          endif
     endfor
endfor
figure(6);
imshow(img3);
figure(7);
subplot(1,2,1), imshow(img2);
subplot(1,2,2), imshow(img3);

