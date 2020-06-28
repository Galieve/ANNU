function [t,x]=mab4am4(f,intervalo,x0,N)

r=4;
h=(intervalo(2)-intervalo(1))/N;
t=intervalo(1):h:intervalo(2); 
x(:,1) = x0(:);
% xi+2 = xi + 2hf(ti+1, xi+1)
% function [t,x]=meuler(f,intervalo,x0,N)
[~, x] = mrk4(f, [t(1), t(r)], x(:, 1), r-1);
x=x.';

for i=1:r
   fi(:,i) = f(t(i), x(:,i));
end

idx = r+1;
for i=1:N+1-r
    
    % Prediccion
    x(:,i+4) = x(:,i+3) + h/24*(55*fi(:, mod(idx+3, r+1)+1)...
    -59*fi(:, mod(idx+2,r+1)+1) + 37*fi(:,mod(idx+1, r+1) + 1)...
    -9*fi(:,mod(idx, r+1) + 1));
    
    % Evaluacion
    fi(:, idx) = f(t(i+4), x(:,i+4));
    
    % Correccion
    x(:,i+4) = x(:,i+3) + h/720*(251*fi(:,idx)+646*fi(:,mod(idx+3,r+1)+1)...
        -264*fi(:, mod(idx+2,r+1)+1)+106*fi(:, mod(idx+1,r+1)+1)...
        -19*fi(:, mod(idx,r+1)+1));
    
    % Evaluacion
    fi(:,idx) = f(t(i+4), x(:,i+4));
    
    % Cambiar el indice
    idx = mod(idx,r+1) + 1;
end
t=t(:);  % Convertimos t en vector columna del tipo (N+1,1)
x=x.';   % Convertimos la matriz x en una del tipo (N+1,n)
    
