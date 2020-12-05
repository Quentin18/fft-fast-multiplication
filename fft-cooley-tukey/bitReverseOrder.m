% Quentin Deschamps, 2020
% Bit-reverse-order procedure
% https://fr.mathworks.com/help/signal/ref/bitrevorder.html

function A = bitReverseOrder(a)
    n = length(a); % must be an integer power of 2
    A = zeros(1, n);
    minDigits = log2(n);
    k = 0:(n - 1);
    A(bin2dec(fliplr(dec2bin(k, minDigits))) + 1) = a(k + 1);
end
