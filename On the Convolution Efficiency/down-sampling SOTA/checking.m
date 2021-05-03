q = PriorityQueue(1);
q.insert([1 2 3 4]);
q.insert([3 4 2 3 5]);
q.insert([5 2 1]);

%disp('first element');
%disp(q.peek());
%disp('contains?');
%disp(q.contains([3 4 2 3 5]));
%disp('size before and after remove');

%disp(q.size());
%q.remove();
%disp(q.size());
%q.remove([5 2 1]);
%q.clear();