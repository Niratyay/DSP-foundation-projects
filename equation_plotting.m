%plot y1[n] = 2x[-n+2] + 3x[n-5] and y2[n]=4x[-n+2] * u[n-5]
%functions:
function [y, n] = shiftseq(x, n, n0)
% x in the input sequence to be shifted. 
% n is the range of x[n]
% n0 is the shift to be given. If n0 is positive it is left shift and if n0 is negative, then the shift is towards right

% Write your expressions for n and y
n = n - n0;
y = x;
end

function [y, nf] = foldseq(x, n)
% x in the input sequence to be folded. 
% n is the range of x[n]
% y is the folded sequence
% nf is the range of n of the folded sequence
% Write the expression for y and nf below:
y = fliplr(x);
nf = -fliplr(n);

end

function [x, n] = stepseq(n1, n2, n0)
% n1 is the lower limit of the range of n over which we are going to plot the step sequence
% n2 is the upper limit of the range of n over which we are going to plot the step sequence
% n0 is the value of n at which you want the step to occur

% Write the expression for n and x below
n=n1:n2; % Range of n from n1 to n2 
x=double(n>=n0); %double is the default data type of matlab. It is converting boolean to a number array like [0 0 1 1] that checks all the number between the range.
end

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
    zb2=min(n2)-min(n1);
else
    zb1=min(n1)-min(n2);
end

% Using an if statement, find the value of za1 and za2 below
if max(n1)>max(n2)
    za2=max(n1)-max(n2);
else
    za1=max(n2)-max(n1);
end


% Now write an expression for the adjusted sequence x1a

x1a = [zeros(1, zb1), x1, zeros(1, za1)];

% Now write an expression for the adjusted sequence x2a

x2a = [zeros(1, zb2), x2, zeros(1, za2)];

end

%CODE:
clear;
close all;
% The range of input and the input
n1 = randi([-15, -5]);
n2 = randi([8, 15]);
n = n1:n2;

x = randi([-5, 5],size(n));

% Write the codes below to get y1[n] and its corresponding range n1. Save the signal values to y1 and the range to variable n1
[x1a_f, n1a_f] = foldseq(x, n);
[x1a_s, n1a_s] = shiftseq(x1a_f, n1a_f, -2); %right shift so n0=-ve
x1a = 2 * x1a_s;

[x1b_f, n1b_f] = shiftseq(x, n, -5);%right shift so n0=-ve
x1b = 3 * x1b_f;

[y1a, y1b, n1] = adjustseq(x1a, n1a_s, x1b, n1b_f);
y1 = y1a + y1b; % 2x[-n+2] + 3x[n-5]


% Write the codes below to get y2[n] and its corresponding range n2. Save the signal values to y2 and the range to variable n2
[x2a_f, n2a_f] = foldseq(x, n);
[x2a_s, n2a_s] = shiftseq(x2a_f, n2a_f, -1); %right shift so n0=-ve
x2a = 4 * x2a_s;

[u, nu] = stepseq(-15, 15, 0); % unit sequence
[x2b_f, n2b_f] = foldseq(u, nu);
[x2b_s, n2b_s] = shiftseq(x2b_f, n2b_f, 3); %left shift so n0=ve
x2b=x2b_s;

[y2a, y2b, n2] = adjustseq(x2a, n2a_s, x2b, n2b_s);
y2 = y2a .* y2b; % 4x[-n+2] * u[n-5]


% example code for explanation
%{
%plot Y1[n] = (3*x[-n+4]) + (2*x[n+1])
[X1A_f, N1A_f] = foldseq(x, n); % X1A_f[N1A_f]= x[-n]
[X1A_s, N1A_s] = shiftseq(X1A_f, N1A_f, -4); % X1A_s[N1A_s]= x[(-n)+4] needs right shift with n0 = -ve (look at shiftseq function)
X1A =3.*X1A_s; % 3*x[-n+4]

[X1B_s, N1B_s] = shiftseq(x, n, -1); % x[n-1] "right shift" -> n0=-ve
X1B = 2 .* X1B_s; % 2*x[n+1]

[Y1A, Y1B, N10] = adjustseq(X1A, N1A_s, X1B, N1B_s); % adjust both the matrices with same dimenstions by padding zeros
Y1 = Y1A + Y1B; % (3*x[-n+4]) + (2*x[n+1])
%}

%% Codes to plot the results

subplot(211)
stem(n, x, 'LineWidth', 2);
grid
xlabel('Time Index, n');
ylabel('x[n]');
title('The Signal x_1[n]');

subplot(212)
stem(n1, y1, 'LineWidth', 2);
grid
xlabel('Time Index, n');
ylabel('y_1[n]');
title('The Signal y_1[n] = 3.x[-n+4] + 2.x[n-1]');

figure
subplot(211)
stem(n, x, 'LineWidth', 2);
grid
xlabel('Time Index, n');
ylabel('x[n]');
title('The Signal x_1[n]');

subplot(212)
stem(n2, y2, 'LineWidth', 2);
grid
xlabel('Time Index, n');
ylabel('y_2[n]');
title('The Signal y_2[n] = 3.x[-n-1].u[-n+2]');