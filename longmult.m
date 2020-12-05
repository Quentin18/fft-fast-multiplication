% Long multiplication
function product = longmult(a, b, base)
    str_a = reverse(num2str(a));
    str_b = reverse(num2str(b));
    p = numel(str_a);
    q = numel(str_b);
    product = zeros(1, p + q);
    for b_i = 1:q
        carry = 0;
        for a_i = 1:p
            product(a_i + b_i - 1) = product(a_i + b_i - 1) + carry ...
                + str2double(str_a(a_i)) * str2double(str_b(b_i));
            carry = fix(product(a_i + b_i - 1) / base);
            product(a_i + b_i - 1) = mod(product(a_i + b_i - 1), base);
        end
        product(b_i + p) = carry;
    end
    product = str2double(sprintf('%d', flip(product)));
end
