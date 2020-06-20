function [t,x]=mrk3(f,intervalo,x0,N)

% La funci?n meuler resuelve un problema de valor inicial de la forma
%  x'=f(t,x) en [t0,T]
%  x(t0)=x0,
% con x0 en R^n, mediante el m?todo de Euler (expl?cito).
%
% ENTRADA:
%  f: nombre de la funci?n (definida en formato an?nimo o como fichero de tipo funci?n
%     de Matlab) del problema que se quiere resolver, con dos argumentos de entrada:
%     el primero es un  n?mero real y el segundo es un vector columna de tipo (n,1)
%  intervalo: [t0,T], donde est? planteado el sistema de ecuaciones diferenciales
%  x0: vector inicial de tipo (1,n)
%  N: n?mero de subintervalos
%
% SALIDA:
%  t: vector columna de abscisas donde se va a aproximar la soluci?n de tipo (N+1,1)
%  x: matriz de ordenadas de la soluci?n aproximada de tipo (N+1,n)

h=(intervalo(2)-intervalo(1))/N;
t=intervalo(1):h:intervalo(2); 
x(:,1)=x0(:);
for i=1:N
    f_1 = f(t(i), x(:, i));
    f_2 = f(t(i) + h/2, x(:, i) + h/2 * f_1);
    f_3 = f(t(i) + h/2, x(:, i) + h/2 * f_2);
    f_4 = f(t(i) + h, x(:, i) + h * f_3);
    x(:,i+1)=x(:,i)+h/6 * (f_1 + 2*f_2 + 2*f_3 + f_4);  % x(:,i+1)=x(:,i)+h*feval(f,t(i),x(:,i));
end
t=t(:);  % Convertimos t en vector columna del tipo (N+1,1)
x=x.';   % Convertimos la matriz x en una del tipo (N+1,n)