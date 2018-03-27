%Histogram matching transform
clc;
clear all;
close all;
eqctr = 0;

f = imread('C:\Users\JEPRSDD\Desktop\Assignments1\images\lena-256x256.jpg'); %Input image to transform
[m1,n1] = size(f);
g = imread('C:\Users\JEPRSDD\Desktop\Assignments1\images\pollen.tif'); %Reference image to whose histogram is to be matched
[m2,n2] = size(g);

L = 256;  %No. of levels
hr = zeros(1,L);
r = 0:L-1;

for i = 1:m1
    for j = 1:n1
          k = f(i,j);
          hr(k+1) = hr(k+1) + 1;  %Histogram of image f
    end
end

Pf = hr/(m1*n1);  %Normalised histogram of f

temp = 0;
for i = 1:L
    temp = temp + Pf(i);
    u(i) = round(temp*(L-1));  %r1 -> u
end

hg = zeros(1,L);



for i = 1:m2
    for j = 1:n2
          k = g(i,j);
          hg(k+1) = hg(k+1) + 1;  %Histogram of image g
    end
end

Pg = hg/(m2*n2);  %Normalised histogram of g

temp=0;
for i = 1:L
    temp = temp + Pg(i);
    v(i) = round(temp*(L-1));  %r2 -> v
end


for i = 1:m1
     for j = 1:n1
       k = f(i,j); 
       f1(i,j) = u(k+1);         %Creating new image with pixel values as 'u'
     end
 end

 for i = 1:m2
     for j = 1:n2
       k = g(i,j); 
       g1(i,j) = v(k+1);         %Creating new image with pixel values as 'v'
     end
 end

hr1 = zeros(1,L);
for i = 1:m1
    for j = 1:n1
        k = f1(i,j);
        hr1(k+1) = hr1(k+1) + 1;   %Histogram of image f1
    end
end
Pf1 = hr1/(m1*n1);

hs1 = zeros(1,L);
for i = 1:m2
    for j = 1:n2
        k = g1(i,j);
        hs1(k+1) = hs1(k+1) + 1;   %Histogram of image g1
    end
end

Pg1 = hs1/(m2*n2);


f1 = uint8(f1);       %This step is very crucial before displaying the image
g1 = uint8(g1);

subplot(2,2,1);
imshow(f);
title('Input image-f');
subplot(2,2,2);
stem(r,Pf);
title('Normalised histogram of f');
subplot(2,2,3);
imshow(g);
title('Reference image-g');
subplot(2,2,4);
stem(r,Pg);
title('Normalised histogram of g');


figure();
subplot(2,2,1);
imshow(f1);
title('f - Histogram equalisation');
subplot(2,2,2);
stem(r,Pf1);
title('Normalised histogram');
subplot(2,2,3);
imshow(g1);
title('g - Histogram equalisation');
subplot(2,2,4);
stem(r,Pg1);
title('Normalised histogram');

% The main step in Histogram matching transform

for i = 1:L
    dist = 255;
    pos1 = zeros(1,L); %Keeping this stmt outside the loop enhances the quality of the image for some reason
    % Loop for finding "min dist" in v w.r.t u(i)
    for j = 1:L                    
        k = abs(u(i) - v(j));  
        if k==0
            dist = k;
            pos = j;
            eqctr = eqctr +1; %Counter to know no. of pts such that u = v, i.e., min dist = 0;
            break;
        elseif k <dist
            dist = k;
            pos = j;
        end
    end
     
    s(i) = r(pos);
 
        
end

for i = 1:m1
     for j = 1:n1
            k = f(i,j);
            h(i,j) = s(k+1);     %Creating new image with pixel values as 's'
     end
end


hh = zeros(1,L);
for i = 1:m1
    for j = 1:n1
        k = round(h(i,j));
        hh(k+1) = hh(k+1) + 1;   %Histogram of image g1
    end
end

Ph = hh/(m1*n1);
h = uint8(h);    %This step is very crucial before displaying the image

figure();
subplot(1,2,1);
imshow(h);
title('Histogram matched image of f w.r.t g');
subplot(1,2,2);
stem(r,Ph);
title('Normalised histogram');

figure();
y1 = histeq(f,hg);
imshow(y1);
title('In built function output');