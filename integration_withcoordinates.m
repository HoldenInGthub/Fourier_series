function [n_y,y]=integration_withcoordinates(n_x,x)    
time_interval=n_x(2)-n_x(1);
n_y=n_x;
len_z=length(n_x);
y=zeros(1,len_z);
for i=1:1:len_z

    for j=1:1:i
    
        y(i)=y(i)+x(j)*time_interval;
    
    end
    
end