function [p]=pessimism(X,x,y)
    
    shifted = 0;
    for i = x:y
        shifted = shifted + X(2,i);
    end
    shifted = shifted * X(1,y);
    
    original = 0;
    for i = x:y
        original = original + X(1,i)*X(2,i);
    end
    p = shifted - original;
end