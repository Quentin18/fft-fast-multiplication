% Measurement of function execution time for multiplication algorithms
nmin = 10;
nmax = 10^6;
step = 10^3;
time_longmult = zeros();
time_ssmult = zeros();
time_karatsuba = zeros();
index = 1;
for n = nmin:step:nmax
    val = [n n];
    tic;
    longmult(val(1), val(2));
    time_longmult(index) = toc;
    tic;
    ssmult(val(1), val(2));
    time_ssmult(index) = toc;
    tic;
    karatsuba(val(1), val(2));
    time_karatsuba(index) = toc;
    index = index + 1;
end

n_vect = nmin:step:nmax;
plot(n_vect, time_longmult, '-.', n_vect, time_ssmult, '-.', n_vect, time_karatsuba, '-.');
legend("Long multiplication", "Shönhage-Strassen algorithm", "Karatsuba algorithm");
title("Comparison of time execution of multiplication algorithms");
xlabel("Factor");
ylabel("Time (in seconds)");
