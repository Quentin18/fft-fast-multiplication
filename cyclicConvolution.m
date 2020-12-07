% Returns the cyclic convolution of two vectors
function v = cyclicConvolution(X, Y)
    v = round(ifft(fft(X) .* fft(Y)));
end
