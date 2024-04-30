clc;
clear all;
close all;
xn=input("Enter a Sequence");
subplot(2,2,1)
stem(abs(xn));
xlabel('n')
ylabel('x(n)')
title('Input sequence')