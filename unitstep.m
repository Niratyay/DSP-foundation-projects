%Function
function [x, n] = stepseq(n1, n2, n0)
% n1 is the lower limit of the range of n over which we are going to plot the step sequence
% n2 is the upper limit of the range of n over which we are going to plot the step sequence
% n0 is the value of n at which you want the step to occur

% Write the expression for n and x below
n=n1:n2; % Range of n from n1 to n2 
x=double(n>=n0); %double is the default data type of matlab. It is converting boolean to a number array like [0 0 1 1] that checks all the number between the range.
end

%CODE TO CALL THE FUNCTION:
n1 = randi([-15, -5]); % n1 = compiler selects any random number between this range
n2 = randi([15, 50]);
n0 = randi([1, 7]);
[x, n] = stepseq(n1, n2, n0);

stem(n, x, 'linewidth', 2);
grid
xlabel('n');
ylabel('Amplitude');
title(['Plot of u[n - ', num2str(n0),']']);
ylim([-1,2]);
