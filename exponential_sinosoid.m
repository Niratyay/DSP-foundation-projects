A = 10; % Amplitude of the sinewave
w = 0.25*pi; % Angular frequency in rad/sample
theta = 0; % The phase
alpha1 = 0.9; % The exponential decaying constant
alpha2 = 1.1; % The exponential growing constant

% Write the expression for the fundamental period of the sinusoid. Store it in variable N
[N,k] = rat((2*pi)/w); %rat function calculates and give fraction value that is stored separately in N and k as Numerator and Denominator respectively

% Write the range of n such that 5 cycles of the sinusoid will be plotted. Store it in variable n
n = 0:(5*N);

% Write the equation for the sinusoid. Store it in variable x
x = A*sin(w*n + theta);

stem(n, x, 'linewidth', 2);
grid
xlabel('n');
ylabel('Amplitude');
title('The plot of x[n] = 10sin(0.25\pi n)');


% Write the equation for the exponentially decaying sinusoid. Store it in variable y
y = (alpha1.^n) .* (x) ;

figure(2);
stem(n, y, 'linewidth', 2);
grid
xlabel('n');
ylabel('Amplitude');
title('The plot of y[n] = 10*0.9^nsin(0.25\pi n)');

% Write the equation for the exponentially growing sinusoid. Store it in variable z
z = (alpha2.^n) .* (x) ;

figure(3);
stem(n, z, 'linewidth', 2);
grid
xlabel('n');
ylabel('Amplitude');
title('The plot of z[n] = 10*1.1^nsin(0.25\pi n)');

t=linspace(-10,10,20);
h = 4*sinc(100*t);
figure(4);
stem(t, h, 'linewidth', 2);
grid
xlabel('t');
ylabel('Amplitude');
title('The plot of h(t)');

