% f = @(t,x) [x(2);-9*x(1)+8*sin(t)];
% [t,x] = ode45(f,[0,2*pi],[0,4]);
% [t,x] = ode45(f,[0:0.01:2*pi],[0,4]);
% figure(1)
% subplot(2,1,1)
% plot(t, x(:, 1))
% subplot(2,1,2)
% plot(t, x(:, 2));
% figure(2)
% plot(x(:,1), x(:, 2))
% comet(x(:, 1), x(:, 2))

% oscilador arbonico:
m = 1;
k = 1;
T = 10;
x0 = 1;
v0 = 1;
f = @(t, x) [x(2); -k/m*x(1)];
[t, x] = ode45(f, [0, T], [x0, v0]);

figure(1)
subplot(2,1,1)
plot(t, x(:, 1))
subplot(2,1,2)
plot(t, x(:, 2));

figure(2)
plot(x(:,1), x(:, 2))
comet(x(:, 1), x(:, 2))


% ecuacion de van der pol:
alpha = 1;
beta = 1;
T = 10;
x0 = 0.1;
v0 = 0.2;
f = @(t, x) [x(2); -alpha*(x(1)*x(1)- beta)*x(2) - x(1)];
[t, x] = ode45(f, [0, T], [x0, v0]);

figure(1)
subplot(2,1,1)
plot(t, x(:, 1))
subplot(2,1,2)
plot(t, x(:, 2));

figure(2)
plot(x(:,1), x(:, 2))
comet(x(:, 1), x(:, 2))

% ecuacion de size=3
f = @(t, x) [x(3), x(2) + 1, 2*x(1)]
[t, x] = ode45(f, [0, 1], [0, 1, 2]);
%function plot(f):
    