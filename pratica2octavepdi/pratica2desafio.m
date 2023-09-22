pkg load image;
im = imread('C:\Users\Inaci\Documents\imagens\lena.png');
N = input("Digite quantos niveis de posterizaçao voce quer:  ");
P = round(255/(N-1));
impost = round((im/P))*P;
figure(1);
imshow(impost);
