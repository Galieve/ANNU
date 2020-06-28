function [t,x]=mab5(f,intervalo,x0,N)

h=(intervalo(2)-intervalo(1))/N;
t=intervalo(1):h:intervalo(2); 
x(:,1) = x0(:);
% xi+2 = xi + 2hf(ti+1, xi+1)
% function [t,x]=meuler(f,intervalo,x0,N)
[~, x] = mrk4(f, [t(1), t(5)], x(:, 1), 4);
x=x.';
ev(:, 1) = f(t(1), x(:,1));
ev(:, 2) = f(t(2), x(:,2));
ev(:, 3) = f(t(3), x(:, 3));
ev(:, 4) = f(t(4), x(:, 4));
idx = 5;
for i=1:N-4
    ev(:, idx) = f(t(i+4), x(:, i+4));
    x(:,i+5) = x(:,i+4) + h/720*(1901*ev(:, idx)-2774*ev(:, mod(idx+5-2, 5) + 1) +...
        2616*ev(:,mod(idx+5-3, 5) + 1) -1274*ev(:, mod(idx+5-4, 5)+1)...
        +251*ev(:, mod(idx, 5)+1));
    idx = mod(idx,5)+1;
end
t=t(:);  % Convertimos t en vector columna del tipo (N+1,1)
x=x.';   % Convertimos la matriz x en una del tipo (N+1,n)

