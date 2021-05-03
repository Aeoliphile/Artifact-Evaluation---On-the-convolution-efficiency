function E_k_l = additionalexpectation(k,l,X)
%ADDITIONALEXPECTATION is a function that computes the additional
%expectation between two values (k and l) of random variable X, 
%according to Equation 3 from our paper.

E_k_l = 0;

for i = (k+1):l
    E_k_l = E_k_l + (l - i) * X(2,i);
end

