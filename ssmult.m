% Shönhage-Strassen algorithm
% TODO to optimize & works only for small integers for the moment
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
    product = 0;
    for i = 1 : 2^k
       product = product + round(v(i) * 10^(i - 1));
    end
end
