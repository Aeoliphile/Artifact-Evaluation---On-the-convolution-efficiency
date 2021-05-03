function [X_prim]=resample(X,indexes)
   sum_prob = 0;
   k = 1;
   X_prim = zeros(2,length(indexes));
   for i = 1:length(X)
       
       if i == indexes(k)
           sum_prob = sum_prob + X(2,i);
           X_prim(1,k) = X(1,i);
           X_prim(2,k) = sum_prob;
           
           sum_prob = 0;
           k = k+1;
       else
           sum_prob = sum_prob + X(2,i);
       end
   end
end