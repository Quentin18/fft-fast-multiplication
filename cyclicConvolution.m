% Returns the cyclic convolution of two vectors
function v = cyclicConvolution(X, Y)
    v = ifft(fft(X) .* fft(Y));
end
