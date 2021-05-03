function E_X = expectationofrandomvariable(X)
%expectationofrandomvariable is a function that computes the expected value
%of the provided random variable X.

E_X = 0;

for i = 1:length(X)
    E_X = E_X + X(1,i)*X(2,i);
end

end

