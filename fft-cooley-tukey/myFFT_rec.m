% Quentin Deschamps, 2020
% Cooley-Tukey algorithm
function Y = myFFT_rec(X)
    Y = zeros();
    N = length(X);
    if N == 1
       Y = X;
    else
        X_evens = myFFT_rec(X(1:2:N));
        X_odds = myFFT_rec(X(2:2:N));
        for k = 1:N/2
            t = X_evens(k);
            e = exp(-2 * 1i * pi * (k - 1) / N) * X_odds(k);
            Y(k) = t + e;
            Y(k + N / 2) = t - e;
        end
    end
end
