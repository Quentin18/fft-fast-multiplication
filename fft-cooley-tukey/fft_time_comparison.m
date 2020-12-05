% Quentin Deschamps, 2020
% Measurement of function execution time for fft

lmax = 10;

fft_rec = zeros();
fft_ite = zeros();
fft_mat = zeros();

for l = 1:lmax
    X = rand(1, 2.^l);
    f = @() myFFT_rec(X);
    g = @() myFFT_ite(X);
    h = @() fft(X);
    fft_rec(l) = timeit(f);
    fft_ite(l) = timeit(g);
    fft_mat(l) = timeit(h);
end

l = 1:lmax;
plot(l, fft_rec, l, fft_ite, l, fft_mat);
legend("Récursif", "Itératif", "Intégré à Matlab");
title("Temps d'exécution de la fonction fft");
xlabel("l");
ylabel("Temps (en secondes)");
