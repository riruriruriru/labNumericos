function relError = errorRelativo(A,B)
relError = max(abs(A(:)-B(:)) ./ abs(A(:)));
end