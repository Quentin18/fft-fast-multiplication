% Shönhage-Strassen algorithm
function product = ssmult(x, y)
    % Choose the nearest highest power of 2 of the size of numbers
    max_size = max(numel(num2str(x)), numel(num2str(y)));
    k = pow2(ceil(log2(max_size)));
    % Slit numbers into two vectors X and Y
    X = number2vector(x, k);
    Y = number2vector(y, k);
    % Calculate the cyclic convolution
    v = cyclicConvolution(X, Y);
    % Recombinate
    product = zeros(1, 2^k);
    carry = 0;
    for i = 1 : 2^k
        product(i) = mod(v(i) + carry, 10);
        carry = fix((v(i) + carry) / 10);
    end
    product = str2double(sprintf('%d', flip(product)));
end
