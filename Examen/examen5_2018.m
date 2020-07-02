intervalo = [0 , pi];
f = @(t,x) (x(1) + cos(t));
x0 = 1;
N = 100;
h = (intervalo(2) - intervalo(1)) / N;
t = intervalo(1):h:intervalo(2);
x = zeros(1, N+1);
x(1) = x0;
for i=1:N
   x(i+1) = (x(i)*(1+h/3) + h/3*(cos(t(i)) + 2*cos(t(i+1)))) / (1 - 2*h/3); 
end
x = x.';
plot(t,x,'r');
