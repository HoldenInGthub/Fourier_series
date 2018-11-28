clc
clear all
close all

%% initial condition
%This is the funcion that I want to produce
% Just represent one period of the function
input_t=-1:0.01:3;
input_x=(2.*input_t+2).*(input_t<0)+2.*(input_t>=0&input_t<=1)+(3-input_t).*(input_t>1&input_t<3);

figure(1);
subplot(311);
plot(input_t,input_x);
title("one period of input function");
grid on;

%%
[t,y,k,h]=fourier_series(input_t,input_x,1,100);
subplot(312);
plot(t,y);
title("Fourier series representation");
grid on;

subplot(313);
stem(k,h);
title("Fourier series coefficient");
grid on;
