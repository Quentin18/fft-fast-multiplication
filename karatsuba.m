function result=karatsuba(x, y, b)
   % Karatsuba multiplication algorithm
   
%   p = karatsuba(x, y, b) returns the product x * y where x and y are two
%   integers in base b.
 
%   p = karatsuba(x, y) returns the product x * y where x and y are two
%   integers in base 10.

    % Default base: 10
    if nargin == 2
        b = 10;
    end
    
    % If x or y < 10 : general multiplication
    if (x < 10 || y < 10)
        result=x*y;
        
    % Karatsuba algo
    else
       % Calculate the split size m of the numbers
       max_size = max(numel(int2str(x)), numel(int2str(y)));
       m = max_size/2;
       
       % Split x and y about the middle
       x1 = fix(x/(b^m));
       x0 = mod(x, b^m);
       y1 = fix(y/(b^m));
       y0 = mod(y, b^m);
       
       % 3 calls multiplications to numbers approximately half the size
       z2 = karatsuba(x1, y1, b);
       z1 = karatsuba(x1+x0, y1+y0, b);
       z0 = karatsuba(x0, y0, b);
       
       % Result
       result = z2*b^(2*m) + (z1-z2-z0)*b^m + z0;
    end
end