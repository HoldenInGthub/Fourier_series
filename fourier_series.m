%fourier_series
%calculate the Fourier series representation of the given function
%Syntax
%[output_t,output_x,Matrix_k,Fourier_series_coefficient_Matrix]=fourier_series(input_t,input_x,expand_parameter,accuracy_parameter)
%
%Description
%This function has four input parameters and four output parameters.
%You just need to give one period representation of the specific funcion.
%This function will help you to expand the given signal to periodic
%signal,then find the Fourier series representasion.
%
%input parameter:
%input_t, the coordinates of the input
%input_x, the value of the input
%expand_parameter, this parameter determine the number of the expandsion.
%For example, if expand_parameter=1,then the given funcion will be expanded
%once along the direction of both +(x-axis) and -(x-axis).
%accuracy_parameter, 100 is good both for accuracy and speed. 1000 will be
%slow for some situation.
%
%output parameter
%output_t and output_x is for time domain
%Matrix_k and Fourier_series_coefficient_Matrix is for frequency domain

function [output_t,output_x,Matrix_k,Fourier_series_coefficient_Matrix]=fourier_series(input_t,input_x,expand_parameter,accuracy_parameter)

[expanded_t,expanded_x,T_after_expanding]=period_expand...
    (input_t,input_x,expand_parameter);

t_interval=input_t(2)-input_t(1);
output_t=expanded_t;

Matrix_index=2*accuracy_parameter+1;
Matrix_k=-accuracy_parameter:1:accuracy_parameter;
Fourier_series_coefficient_Matrix=zeros(1,Matrix_index);
Matrix_loop_i=1;

output_x=0;
for k=-accuracy_parameter:1:accuracy_parameter
    
    [~,integrated_x]=integration_withcoordinates...
        (expanded_t,expanded_x.*exp(-1i*k*2*pi/T_after_expanding.*expanded_t));
   
    ak=(integrated_x(round(T_after_expanding/t_interval))-integrated_x(1))...
        /T_after_expanding;
    
    Fourier_series_coefficient_Matrix(1,Matrix_loop_i)=ak;
    Matrix_loop_i=Matrix_loop_i+1;
    
    output_x=output_x+ak*exp(1i*k*2*pi/T_after_expanding.*expanded_t);

end