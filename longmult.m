function product = longmult(x, y, b)
% LONGMULT  Long multiplication algorithm
%   p = LONGMULT(x, y, b) returns the product x * y where x and y are
%   two integers in base b.
%
%   p = LONGMULT(x, y) returns the product x * y where x and y are two
%   integers in base 10.

    % Default base: 10
    if nargin == 2
        b = 10;
    end
    str_x = reverse(num2str(x));
    str_y = reverse(num2str(y));
    p = numel(str_x);
    q = numel(str_y);
    product = zeros(1, p + q);
    for y_i = 1:q
        carry = 0;
        for x_i = 1:p
            product(x_i + y_i - 1) = product(x_i + y_i - 1) + carry ...
                + str2double(str_x(x_i)) * str2double(str_y(y_i));
            carry = fix(product(x_i + y_i - 1) / b);
            product(x_i + y_i - 1) = mod(product(x_i + y_i - 1), b);
        end
        product(y_i + p) = carry;
    end
    product = str2double(sprintf('%d', flip(product)));
end
