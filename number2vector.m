% Split a number into a vector of size 2^k
% Example: number2vector(12, 2) -> [2 1 0 0]
function v = number2vector(x, k)
    v = zeros(1, 2^k);
    str_x = int2str(x);
    size_x = numel(str_x);
    for i = 1 : size_x
        v(i) = str2double(str_x(size_x - i + 1));
    end    
end
