function [t,x]=mmilne4bdf5(f,intervalo,x0,N)

r=5;
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
    x(:,i+5) = x(:,i+1) + 4*h/3*(2*fi(:, mod(idx+4, r+1)+1)...
    -fi(:, mod(idx+3,r+1)+1) + 2*fi(:,mod(idx+2, r+1) + 1));
    
    % Evaluacion
    fi(:, idx) = f(t(i+5), x(:,i+5));
    
    % Correccion
    x(:,i+5) = 1/137*(300*x(:,i+4) + -300*x(:,i+3) +200 * x(:,i+2)...
        -75*x(:,i+1) + 12*x(:,i) +60*h*fi(:,idx));
    
    % Evaluacion
    fi(:,idx) = f(t(i+5), x(:,i+5));
    
    % Cambiar el indice
    idx = mod(idx,r+1) + 1;
end
t=t(:);  % Convertimos t en vector columna del tipo (N+1,1)
x=x.';   % Convertimos la matriz x en una del tipo (N+1,n)
    

