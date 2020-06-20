function [t,x]=mab3(f,intervalo,x0,N)

h=(intervalo(2)-intervalo(1))/N;
t=intervalo(1):h:intervalo(2); 
x(:,1) = x0(:);
% xi+2 = xi + 2hf(ti+1, xi+1)
% function [t,x]=meuler(f,intervalo,x0,N)
[~, x] = meulermod(f, [t(1), t(3)], x(:, 1), 2);
x=x.';
ev(:, 1) = f(t(1), x(:,1));
ev(:, 2) = f(t(2), x(:,2));
idx = 3;
for i=1:N-2
    ev(:, idx) = f(t(i+2), x(:, i+2));
    x(:,i+3) = x(:,i+2) + h/12*(23*ev(:, idx)-16*ev(:, mod(idx+1, 3) + 1) + 5*ev(:,mod(idx, 3) + 1));
    idx = mod(idx,3)+1;
end
t=t(:);  % Convertimos t en vector columna del tipo (N+1,1)
x=x.';   % Convertimos la matriz x en una del tipo (N+1,n)
    
