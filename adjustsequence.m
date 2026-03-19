function [x1a, x2a, nx] = adjustseq(x1, n1, x2, n2)
% x1 in the first input sequence defined in the range given by n1. 
% x2 in the second input sequence defined in the range given by n2.
% Now we will have to define a common range for both the sequences. 

% Write below an expression for the lowest value of the n of the range of the adjsuted sequences. Store it in nx1
nx1 = min(min(n1), min(n2));

% Write below an expression for the largest range of the n of the range of the adjsuted sequences. Store it in nx2
nx2 = max(max(n1), max(n2));

% Write an expression for the range of the adjusted sequence and store it in nx

nx = nx1:nx2;

% Initialize the number of zeros to be appended before x1 as 0
zb1 = 0;
% Initialize the number of zeros to be appended after x1 as 0
za1 = 0;
% Initialize the number of zeros to be appended before x2 as 0
zb2 = 0;
% Initialize the number of zeros to be appended after x2 as 0
za2 = 0;

% Using an if statement, find the value of zb1 and zb2 below
if min(n1)<min(n2)
    zb1 = min(n2) - min(n1);
else
    zb2 = min(n1) - min(n2);
end

% Using an if statement, find the value of za1 and za2 below
if max(n1) > max(n2)
    za1 = max(n21) - max(n2);
else
    za2 = max(n2) - max(n1);
end

%expression for the adjusted sequence x1a and x2a
x1a = [zeros(1, zb1), x1, zeros(1, za1)];
x2a = [zeros(1, zb2), x2, zeros(1, za2)];

end


% The range of the first sequence
n1 = -2:1;

% The first sequence
x1 = [1, 2, -1, 3];

% The range of the second sequence
n2 = 0:3;

% The second sequence
x2 = [3, -2, 1, 2];

[xa1, xa2, nx] = adjustseq(x1, n1, x2, n2);

% The sum of the sequences
y = xa1 + xa2;


% The difference
z = xa2 - xa1;


% The product
w = xa1.*xa2;


figure(1)
subplot(311)
stem(nx, xa1, 'linewidth', 2);
grid
xlabel('n');
ylabel('Amplitude');
title('The signal, x_1[n]');

subplot(312)
stem(nx, xa2, 'linewidth', 2);
grid
xlabel('n');
ylabel('Amplitude');
title('The signal, x_2[n]');

subplot(313)
stem(nx, y, 'linewidth', 2);
grid
xlabel('n');
ylabel('Amplitude');
title('The output signal, y[n] = x_1[n]+x_2[n]');


figure(2)
subplot(311)
stem(nx, xa1, 'linewidth', 2);
grid
xlabel('n');
ylabel('Amplitude');
title('The signal, x_1[n]');

subplot(312)
stem(nx, xa2, 'linewidth', 2);
grid
xlabel('n');
ylabel('Amplitude');
title('The signal, x_2[n]');

subplot(313)
stem(nx, z, 'linewidth', 2);
grid
xlabel('n');
ylabel('Amplitude');
title('The output signal, y[n] = x_2[n]-x_1[n]');



figure(3)
subplot(311)
stem(nx, xa1, 'linewidth', 2);
grid
xlabel('n');
ylabel('Amplitude');
title('The signal, x_1[n]');

subplot(312)
stem(nx, xa2, 'linewidth', 2);
grid
xlabel('n');
ylabel('Amplitude');
title('The signal, x_2[n]');

subplot(313)
stem(nx, w, 'linewidth', 2);
grid
xlabel('n');
ylabel('Amplitude');
title('The output signal, y[n] = x_1[n]*x_2[n]');