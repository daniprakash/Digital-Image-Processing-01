clc;
clear all;
close all;

Img1 = imread('C:\Users\JEPRSDD\Desktop\Assignments1\images\lena1.png'); 
Img1 = rgb2gray(Img1);
[m n] = size(Img1);

figure(1);
imshow(Img1);
title('512 x 512 image');



for i = 1:2:m
    for j = 1:2:n
        p = ceil((i+1)/2);
        q = ceil((j+1)/2);
        Img2(p,q) = Img1(i,j);
    end
end
figure(2);
imshow(Img2);
title('Sampling factor = 2');

for i = 1:4:m
    for j = 1:4:n
        p = ceil((i+3)/4);
        q = ceil((j+3)/4);
        I3(p,q) = Img1(i,j);
    end
end


figure(3);
imshow(I3);
title('Sampling factor = 4');



for i = 1:8:m
    for j = 1:8:n
       p = ceil((i+7)/8);
       q = ceil((j+7)/8);
       I4(p,q) = Img1(i,j);
    end
end

figure(4);
imshow(I4);
title('Sampling factor = 8');

for i = 1:16:m
    for j = 1:16:n
       p = ceil((i+15)/16);
       q = ceil((j+15)/16);
       I5(p,q) = Img1(i,j);
    end
end

figure(5);
imshow(I5);
title('Sampling factor = 16');


for i = 1:32:m
    for j = 1:32:n
       p = ceil((i+31)/32);
       q = ceil((j+31)/32);
       I6(p,q) = Img1(i,j);    
    end
end

figure(6);
imshow(I6);
title('Sampling factor = 32');

for i = 1:64:m
    for j = 1:64:n
       p = ceil((i+63)/64);
       q = ceil((j+63)/64);
       I7(p,q) = Img1(i,j);    
    end
end
figure(7);
imshow(I7);
title('Sampling factor = 64');
