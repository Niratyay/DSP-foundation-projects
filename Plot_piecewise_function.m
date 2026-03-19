% Write your code below
% Please note that the range of n is 0:120 and this range should be final and stored in n.
% The final signal should be stored in variable x.
n=0:120;
% we initialize zeros to all the matrices to have the same dimension before adding them.
x1 = zeros(size(n));
x2 = zeros(size(n));
x3 = zeros(size(n));
x4 = zeros(size(n));
x5 = zeros(size(n));

x1(n>=0 & n<=10) = n(n>=0 & n<=10)/5; % x1(condition) = n(condition)/5
% choose only first 11 slots from 121 elements
%choose n with the same dimension of x1 so that those elements of n would
%go to those 11  slots of x1.

x2(n>=11 & n<=24)= (2);

x3(n>=25 & n<=55)= (2 * cos(0.1*pi*n(n>=25 & n<=55))); %here we use * because a scaler is multiplied with a vector

x4(n>=56 & n<=60)= (0);

x5(n>=61 & n<=120)= (25*(exp((-0.05)*n(n>=61 & n<=120))) .* sin(0.1*pi*n(n>=61 & n<=120))); %here .* is used for 
% multiplying vector * vector (element-wise), so they should have same dimension

x=x1+x2+x3+x4+x5;

% For plotting
stem(n, x, 'LineWidth',2);
grid
xlabel('Time Index, n');
ylabel('Amplitude');
title('The plot of the given signal');
ylim([-2.5 2.5]);
