function [t,x]=mab3am3(f,intervalo,x0,N)

r=3;
h=(intervalo(2)-intervalo(1))/N;
t=intervalo(1):h:intervalo(2); 
x(:,1) = x0(:);
% xi+2 = xi + 2hf(ti+1, xi+1)
% function [t,x]=meuler(f,intervalo,x0,N)
[~, x] = mrk3(f, [t(1), t(r)], x(:, 1), r-1);
x=x.';

for i=1:r
   fi(:,i) = f(t(i), x(:,i));
end

idx = r+1;
for i=1:N+1-r
    
    % Prediccion
    x(:,i+3) = x(:,i+2) + h/12*(23*fi(:, mod(idx+2, r+1)+1)...
    -16*fi(:, mod(idx+1,r+1)+1) + 5*fi(:,mod(idx, r+1) + 1));
    
    % Evaluacion
    fi(:, idx) = f(t(i+3), x(:,i+3));
    
    % Correccion
    x(:,i+3) = x(:,i+2) + h/24*(9*fi(:,idx)+19*fi(:,mod(idx+2,r+1)+1)...
        -5*fi(:, mod(idx+1,r+1)+1)+ fi(:, mod(idx,r+1)+1));
    
    % Evaluacion
    fi(:,idx) = f(t(i+3), x(:,i+3));
    
    % Cambiar el indice
    idx = mod(idx,r+1) + 1;
end
t=t(:);  % Convertimos t en vector columna del tipo (N+1,1)
x=x.';   % Convertimos la matriz x en una del tipo (N+1,n)
    
