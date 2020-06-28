function [t,x]=mmilne(f,intervalo,x0,N)

h=(intervalo(2)-intervalo(1))/N;
t=intervalo(1):h:intervalo(2); 
x(:,1) = x0(:);
% xi+2 = xi + 2hf(ti+1, xi+1)
% function [t,x]=meuler(f,intervalo,x0,N)
[~, x] = mrk3(f, [t(1), t(4)], x(:, 1), 3);
x=x.';
ev(:, 1) = f(t(2), x(:,2));
ev(:, 2) = f(t(3), x(:,3));
idx = 3;
for i=1:N-3
    ev(:, idx) = f(t(i+3), x(:, i+3));
    x(:,i+4) = x(:,i) + 4*h/3*(2*ev(:, idx)-ev(:, mod(idx+3-2,3) + 1) +...
        +2*ev(:,mod(idx, 3) + 1));
    idx = mod(idx,3)+1;
end
t=t(:);  % Convertimos t en vector columna del tipo (N+1,1)
x=x.';   % Convertimos la matriz x en una del tipo (N+1,n)

