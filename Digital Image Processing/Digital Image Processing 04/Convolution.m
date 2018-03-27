
clc;
clear all;
close all;

f = imread('C:\Users\JEPRSDD\Desktop\Assignments1\images\lena1.png'); 
[M,N] = size(f);
a = input('Enter the dimension of window(odd integer): ');
sd  = input('Enter the standard deviation: ');
%a = 3;
%sd = 1;
var = sd*sd;

x = -(a-1)/2:1:(a-1)/2 ;
y = -(a-1)/2:1:(a-1)/2 ;
f1 = imnoise(f,'salt & pepper',0.05);%what is 0.05 
sum1 = 0;

%%by the formula 
for i = 1:a
    for j = 1:a
        temp = (x(i)^2 + y(j)^2)/(2*var) ;    % Sampling the gaussian function at integer points
        h1(i,j) = exp(-temp);                  %Filter definition
    end
end

h = h1/sum(sum(h1)); %sum(h1) gives sum of its rows. sum(sum(h1)) gives the sum of all matrix elements

%%why do we want this 


temp = rot90(h);
w = rot90(temp);  %Rotating by 180' for performing correlation



for i = 1:M 
    for j = 1:N
        sum1 = 0;
        for t = 1:a
            for s = 1:a
                if ((i+s)> M) || ((j+t)> N)
                    sum1 = sum1 + 0;
                else
                  sum1 = sum1 + f1(i+s-1,j+t-1)*w(s,t);
                end
            end
        end
        g(i,j) = sum1;
     end
     
end

figure();
imshow(g);            