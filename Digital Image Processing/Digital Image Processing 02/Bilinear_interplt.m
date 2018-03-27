% Bilinear interpolation
clc;
clear all;
close all;
f1 = imread('C:\Users\JEPRSDD\Desktop\Assignments1\images\lena-256x256.jpg');
f = imresize(f1,0.5);
[m n ] = size(f);
ratio = input('Enter the interpolation factor: ');
a = ratio(1);
b = ratio(2);
for i = 1:a*m
    for j = 1:b*n
        p = (i-1)/a;
        q = (j-1)/b;
        if ((isint(p) == 1) && (isint(q)==1))
            g((i-1) + 1,(j-1) + 1) = f(p+1,q+1);
        elseif ((q+1 >= n) && ((p+1)<=m))
            temp1 = floor(p);
            temp2 = ceil(p);
            if (q+1)==n
                g(i,j) = 0.5*(f(temp1 +1,n) + f(temp2 +1,n));
            else
                g(i,j) = 0.25*(f(temp1 +1,n) + f(temp2 +1,n));
            end
        elseif ((p+1 >= m) && ((q+1)<=n))
            temp1 = floor(q);
            temp2 = ceil(q);
            if (p+1)==m
                g(i,j) = 0.5*(f(m,temp1 +1) + f(m,temp2 +1));   
            else
                g(i,j) = 0.25*(f(m,temp1 +1) + f(m,temp2 +1));
            end
        elseif ((p+1 > m) && ((q+1) > n))
            g(i,j) =  0.25*f(m,n);
        else
            x1 = floor(p); y1 = floor(q);
            x2 = floor(p); y2 = floor(q) + 1;
            x3 = floor(p) + 1; y3 = floor(q);
            x4 = floor(p) + 1; y4 = floor(q) + 1;
           
            A1 = abs((x1-p)*(y1-q));
            A2 = abs((x2-p)*(y2-q));
            A3 = abs((x3-p)*(y3-q));
            A4 = abs((x4-p)*(y4-q));
            
            %word = [num2str(i) num2str(j)];
           % disp(word);
            g(i,j) = A4*f(x1+1,y1+1) + A3*f(x2+1,y2+1) + A2*f(x3+1,y3+1) + A1*f(x4+1,y4+1);
        end
    end
end

imshow(f);
figure();
imshow(g);

