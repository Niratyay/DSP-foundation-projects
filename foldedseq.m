function [y, nf] = foldseq(x, n)
% x in the input sequence to be folded. 
% n is the range of x[n]
% y is the folded sequence
% nf is the range of n of the folded sequence
% Write the expression for y and nf below:
y = fliplr(x);
nf = -fliplr(n);

end

n1 = randi([-10, -5]);
n2 = randi([7, 15]);
n = n1:n2;

x = randi([-5, 5],size(n));

[y, ny] = foldseq(x, n);

figure(1)
stem(n, x, 'linewidth', 2);
grid
xlabel('n');
ylabel('Amplitude');
title('Input Signal, x[n]');

figure(2)
stem(ny, y, 'linewidth', 2);
grid
xlabel('n');
ylabel('Amplitude');
title('Folded Signal, y[n] = x[-n]');