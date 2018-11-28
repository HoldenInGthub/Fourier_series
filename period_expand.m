function [t_y,y,T]=period_expand(t_x,x,k)

T=t_x(length(t_x))-t_x(1);
y=repmat(x,1);
t_y=repmat(t_x,1);
for k=1:1:k
y=[x y x];
t_y=[-k*T+t_x t_y k*T+t_x];
end