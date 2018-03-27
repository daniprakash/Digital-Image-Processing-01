%Quantisation
clc;
clear all;
close all;

f = imread('C:\Users\JEPRSDD\Desktop\Assignments1\images\lena-256x256.jpg'); 
[m n] = size(f);

Imax = 255;
Imin = 0;
L = 2;  %Vary the no.of levels from 2 to 128
del = (Imax - Imin)/(L-1); 
ss = del/2;

for i = 1:L
    Q(i) = del*(i-1);
end

for i = 1:L-1
    T(i) = (ss) + del*(i-1);
end

for k = 1:L-2
    for i = 1:m
        for j = 1:n

            if f(i,j) < T(1)
             g(i,j) = Q(1);
        
            elseif (f(i,j) > T(k))  && (f(i,j) < T(k+1))
             g(i,j) = Q(k+1);
             
            end
        end
    end
end


for i = 1:m
    for j = 1:n
        if f(i,j) > T(L-1)
            g(i,j) = Q(L);
        end
    end
end

g = uint8(g);

figure(1);
imshow(f);
title('Original image - 256 x 256');
figure(2);
imshow(g);
title(['Quantised image ',num2str(L),' levels']);


