function product = karatsuba(x, y, b)
% KARATSUBA  Karatsuba multiplication algorithm
%   p = KARATSUBA(x, y, b) returns the product x * y where x and y are two
%   integers in base b.
%
%   p = KARATSUBA(x, y) returns the product x * y where x and y are two
%   integers in base 10.

    % Default base: 10
    if nargin == 2
        b = 10;
    end
    % If x < b or y < b : general multiplication
    if (x < b || y < b)
        product = x * y;
    % Karatsuba algo
    else
       % Calculate the split size k of the numbers
       max_size = max(numel(int2str(x)), numel(int2str(y)));
       k = pow2(ceil(log2(max_size / 2)));
       % Split x and y about the middle
       x1 = floor(x / (b^k));
       x0 = mod(x, b^k);
       y1 = floor(y / (b^k));
       y0 = mod(y, b^k);
       % 3 calls multiplications to numbers approximately half the size
       z2 = karatsuba(x1, y1, b);
       z1 = karatsuba(x1 + x0, y1 + y0, b);
       z0 = karatsuba(x0, y0, b);
       % Result
       product = z2*b^(2*k) + (z1 - z2 - z0)*b^k + z0;
    end
end