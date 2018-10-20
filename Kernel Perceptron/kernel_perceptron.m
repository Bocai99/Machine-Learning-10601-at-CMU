function w = kernel_perceptron(a0, X, Y)
%Kernel perceptron algorithm
%   a0 is the initial count vector (1 * n)
%   X is feature values of training examples (d * n)
%   Y is labels of training examples (1 * n)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Your code goes from here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[d,n] = size(X);
K = polykernel(X,X);
iter = 1;

while (iter<=100)

b = a0;

for i=1:n
pred = kernel_perceptron_pred(a0, Y, K, i);
if Y(1,i) ~= pred
a0(1,i) = a0(1,i) + 1;
end
end
  
if b == a0
break;
end

iter=iter+1;
end


w=a0;
end