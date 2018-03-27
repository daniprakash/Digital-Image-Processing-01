%Histogram equalisation
clc;
clear all;
close all;

f = imread('C:\Users\JEPRSDD\Desktop\Assignments1\images\lena1.png'); 
%f = rgb2gray(I);  % f - input image
[m n] = size(f);

L = 256;  %No. of levels
hr = zeros(1,L);
r = 0:L-1;

for i = 1:m
    for j = 1:n
          k = f(i,j);
          hr(k+1) = hr(k+1) + 1;  %Histogram of image f ----- incrementing the noof pixels for corresponding pixel values
    end
end

Pf = hr/(m*n);  %Normalised histogram of f

figure(1);
subplot(2,2,1);
imshow(f);
title('Input image');


subplot(2,2,2);
stem(r,Pf);
title('Histogram of f');


temp = 0;
for i = 1:L
  temp = temp + Pf(i);
   s(i) = round(temp*(L-1));  %r -> s %%%% by the formula c(r) * (L-1)
end



for i = 1:m
    for j = 1:n
        k = f(i,j);
        g(i,j) = s(k + 1);     %Creating new image with pixel values as 's'
    end
end
  
h = uint8(g);
subplot(2,2,3);
imshow(h);
title('Output image - Histogram equalised');

hs = zeros(1,L);
for i = 1:m
    for j = 1:n
        k = g(i,j);
        hs(k+1) = hs(k+1) + 1;   %Histogram of image g
    end
end

Pg = hs/(m*n); %Normalised histogram of h

subplot(2,2,4);
stem(r,Pg);                     %Stemming wrt 'r' and not 's' because, r contains each level in [0,L-1]
title('Histogram of h');        %whereas array s contains only a subset of [0,L-1]. Refer eg. in notes to understand



%%%%% chceking whether the inbuilt function is giving the same result


heq = histeq(f);   %In-built function
eff = isequal(heq,g); %Checking whether in-built function and my algo give the same output
%figure(3);  
%imshow(g);      % Get to know why this is not working even though
                %imshow can take array of type double
 