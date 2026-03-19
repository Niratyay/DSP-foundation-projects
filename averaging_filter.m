n=0:50;
x = sin(0.2*pi*n) + 0.5*sin(0.8*pi*n);
y = [0, 0];

for i=3:length(n)-2
    y(i) = (1/5) * (x(i-2) + x(i-1) + x(i) + x(i+1) + x(i+2));
end
y = [y, 0, 0];

nh = -5:5;
h = [ 0,  0,  0, 1/5, 1/5, 1/5, 1/5, 1/5, 0,  0,  0];
n = 0:50;

subplot(211);
stem(n, x, 'linewidth', 2);
grid;
ylabel('x[n]');
title('The given signal, x[n]');
ylim([-2, 2])

subplot(212);
stem(n, y, 'linewidth', 2);
grid;
ylabel('y[n]');
title('The filtered signal, y[n]');
ylim([-2, 2])
fontname("Times New Roman");
fontsize(12, "points");



% To plot the impulse response
figure
stem(nh, h, 'linewidth', 2);
grid;
ylabel('h[n]');
title('The Impulse Response, h[n]');
ylim([-0.5, 0.5])
fontname("Times New Roman");
fontsize(12, "points");
