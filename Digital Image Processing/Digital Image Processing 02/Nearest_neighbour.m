%Nearest neighbour interpolation
clc;
clear all;
close all;
f1 = imread('C:\Users\Pranav\Desktop\lena_256.tif');
f = imresize(f1,0.5);
[m n ] = size(f);
ratio = input('Enter the interpolation factor: ');
a = ratio(1);
b = ratio(2);

for i =1:a*m
    for j = 1:b*n
        p = (i-1)/a;
        q = (j-1)/b;
        if (isint(p) == 1) && (isint(q)==1)
            g(i,j) = f(p+1,q+1);
       
        elseif ((q+1 >= n) && ((p+1)<=m))
            temp1 = floor(p);
            g(i,j) = f(temp1 +1,n);
        elseif ((p+1 >= m) && ((q+1)<=n))
            temp1 = floor(q);
            g(i,j) = f(m,temp1 +1);
        elseif ((p+1 > m) && ((q+1) > n))
            g(i,j) = f(m,n);
        else
            temp1 = floor(p);
            temp2 = floor(q);
            g(i,j) = f(temp1 +1,temp2 +1);
        end
    end
end

imshow(f);
title('Original image');
figure();
imshow(g);
title('Output image');
