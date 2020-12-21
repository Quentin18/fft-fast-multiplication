% Returns the convolution of two vectors
function v = fastConvolution(X, Y)
    v = round(ifft(fft(X) .* fft(Y)));
end
