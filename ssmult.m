function product = ssmult(x, y, b)
% SSMULT  Shönhage-Strassen multiplication algorithm
%   p = SSMULT(x, y, b) returns the product x * y where x and y are two
%   integers in base b.
%
%   p = SSMULT(x, y) returns the product x * y where x and y are two
%   integers in base 10.

    % Default base: 10
    if nargin == 2
        b = 10;
    end
    % Choose the nearest highest power of 2 of the size of numbers
    max_size = max(numel(int2str(x)), numel(int2str(y)));
    k = pow2(ceil(log2(max_size)));
    % Slit numbers into two vectors X and Y
    X = number2vector(x, k);
    Y = number2vector(y, k);
    % Calculate the convolution
    v = fastConvolution(X, Y);
    % Recombinate
    product = zeros(1, 2^k);
    carry = 0;
    for i = 1 : 2^k
        product(i) = mod(v(i) + carry, b);
        carry = fix((v(i) + carry) / b);
    end
    product = str2double(sprintf('%d', flip(product)));
end
