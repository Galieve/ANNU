function [t,x]=mab2(f,intervalo,x0,N)

h=(intervalo(2)-intervalo(1))/N;
t=intervalo(1):h:intervalo(2); 
x(:,1) = x0(:);
% xi+2 = xi + 2hf(ti+1, xi+1)
% function [t,x]=meuler(f,intervalo,x0,N)
[~, x] = meuler(f, [t(1), t(2)], x(:, 1), 1);
x=x.';
ev(:, 1) = f(t(1), x(:,1));
for i=1:N-1
    ev(:, 2) = f(t(i+1), x(:, i+1));
    x(:,i+2) = x(:,i+1) + h/2*(3*ev(:, 2)-ev(:, 1));
    ev(:, 1) = ev(:, 2);
end
t=t(:);  % Convertimos t en vector columna del tipo (N+1,1)
x=x.';   % Convertimos la matriz x en una del tipo (N+1,n)
    
