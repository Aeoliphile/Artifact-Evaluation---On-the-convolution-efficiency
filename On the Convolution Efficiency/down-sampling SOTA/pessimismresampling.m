function [X_prim] = pessimismresampling(X,k)
    Q = PriorityQueue(1); % priority queue
    x = 1;
    y = length(X);
    p = -pessimism(X,x,y);
    
    Q.insert([p,x,y]);
    
    while Q.size() < k
        Q_max = Q.remove();
        a = Q_max(2);
        b = Q_max(3);
        m = round(a+(b-a)/2);
        p_a_m = -pessimism(X,a,m);
        p_m_b = -pessimism(X,m,b);
        Q.insert([p_a_m,a,m]);
        Q.insert([p_m_b,m,b]);
    end
    
    upper_bound_indexes = zeros(1,k);
    for i = 1:k
        bound = Q.remove();
        upper_bound_indexes(i) = bound(3);
    end
    sorted_bounds = unique(upper_bound_indexes) ;
    
    X_prim = resample(X,sorted_bounds);
    % C_new = resample(C,Q.upper_bounds)








