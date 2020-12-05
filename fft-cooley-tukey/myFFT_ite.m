% Quentin Deschamps, 2020
% Cooley-Tukey algorithm

% This is the in-place implementation, to avoid the memory footprint used
% by recursion.
function A = myFFT_ite(a)
    n = length(a);
    A = bitReverseOrder(a);
    for s = 1:log2(n)
        m = 2^s;
        wm = exp(-2 * pi * 1i / m);
        for k = 0:m:(n - 1)
            w = 1;
            for j = 1:m / 2
                t = w * A(k + j + m / 2);
                u = A(k + j);
                A(k + j) = u + t;
                A(k + j + m / 2) = u - t;
                w = w * wm;
            end
        end
    end
end
