function [X_prim]=domainquantisation(X,q)
    
    x_first = X(1,1);
    x_last = X(1,length(X));
    xq_min = floor(x_first/q)*q;
    xq_max = ceil(x_last/q)*q;
    
    X_prim = zeros(2,(xq_max-xq_min)/q);
    sum_prob = 0;
    k = 1;
    q_val = xq_min+q;
    
    for i = 1:length(X)
       if(X(1,i) < q_val)
           sum_prob = sum_prob + X(2,i);
       else
           sum_prob = sum_prob + X(2,i);
           X_prim(1,k) = q_val;
           X_prim(2,k) = sum_prob;
           q_val = q_val + q;
           sum_prob = 0;
           k = k+1;
       end
    end
    
    if xq_max ~= x_last
        X_prim(1,k) = xq_max;
        X_prim(2,k) = sum_prob;
    end
end