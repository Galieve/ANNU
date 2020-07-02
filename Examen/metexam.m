function [t,x] = metexam(f,intervalo,x0,N)
%METEXAM Summary of this function goes here
%   Detailed explanation goes here

h = (intervalo(2) - intervalo(1)) / N;
t = intervalo(1):h:intervalo(2);
x(:,1) = x0(:);

for i=1:N
   x(:,i+1) = x(:,i) + h/4*(f(t(i),x(:,i)) ...
       +3*f(t(i) + 2*h/3, x(:,i) + 2*h/3 ...
       *f(t(i), x(:,i))));
end
t=t(:);
x = x.';