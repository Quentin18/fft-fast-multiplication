% Measurement of function execution time for multiplication algorithms

nmin = 0;
nmax = 10^7;
step = 10^4;
time_longmult = zeros();
time_ssmult = zeros();
index = 1;
for n = nmin:step:nmax
    val = [n n];
    tic;
    longmult(val(1), val(2), 10);
    time_longmult(index) = toc;
    tic;
    ssmult(val(1), val(2));
    time_ssmult(index) = toc;
    index = index + 1;
end

n_vect = nmin:step:nmax;
plot(n_vect, time_longmult, n_vect, time_ssmult);
legend("Long multiplication", "Shönhage-Strassen algorithm");
title("Comparison of time execution of multiplication algorithms");
xlabel("Factor");
ylabel("Time (in seconds)");
