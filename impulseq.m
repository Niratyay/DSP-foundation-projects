%Function
function [x,n] = impseq(n1,n2,n0)
n=n1:n2;
x = double(n == n0);
end

%Code to call the function
n1 = randi([-15, -5]);
n2 = randi([15, 50]);
n0 = randi([1, 7]);
[x, n] = impseq(n1, n2, n0);

stem(n, x, 'linewidth', 2);
grid
xlabel('n');
ylabel('Amplitude');
title(['Plot of \delta[n - ', num2str(n0),']']);
ylim([-1,2]);
