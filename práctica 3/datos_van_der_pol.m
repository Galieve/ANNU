alpha = 1; beta = 1; T = 10; f = @(t, x) [x(2); -alpha*(x(1)*x(1)- beta)*x(2) - x(1)]; intervalo = [0, T]; x0 = [0.1, 0.2]; N = 10000;
