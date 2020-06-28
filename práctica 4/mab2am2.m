function [t,x]=mab2am2(f,intervalo,x0,N)

r=2;
h=(intervalo(2)-intervalo(1))/N;
t=intervalo(1):h:intervalo(2); 
x(:,1) = x0(:);
% xi+2 = xi + 2hf(ti+1, xi+1)
% function [t,x]=meuler(f,intervalo,x0,N)
[~, x] = meulermej(f, [t(1), t(r)], x(:, 1), r-1);
x=x.';

for i=1:r
   fi(:,i) = f(t(i), x(:,i));
end

idx = r+1;
for i=1:N+1-r
    
    % Prediccion
    x(:,i+2) = x(:,i+1) + h/2*(3*fi(:, mod(idx+r-1, r+1)+1)-fi(:, mod(idx,r+1)+1));
    
    % Evaluacion
    fi(:, idx) = f(t(i+2), x(:,i+2));
    
    % Correccion
    x(:,i+2) = x(:,i+1) + h/12*(5*fi(:,idx)+8*fi(:,mod(idx+3-2,3)+1)...
        -fi(:, mod(idx,3)+1));
    
    % Evaluacion
    fi(:,idx) = f(t(i+2), x(:,i+2));
    
    % Cambiar el indice
    idx = mod(idx,r+1) + 1;
end
t=t(:);  % Convertimos t en vector columna del tipo (N+1,1)
x=x.';   % Convertimos la matriz x en una del tipo (N+1,n)
    
