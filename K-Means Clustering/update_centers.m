function C = update_centers(X, C, a)
% updates cluster centers, given data points and assignments
% INPUT:
%   X (num_samples x num_dims): data matrix
%   C (num_clusters x num_dims): cluster centers
%   a (num_samples x 1): cluster assignments (1, ..., num_clusters)
%                           for each data point
% OUTPUT:
%   C (num_clusters x num_dims): updated cluster centers

 [n,d] = size(X);
 [k,d] = size(C);

 c = zeros(k,d);
 m = zeros(k,1);
 
for i=1:n
 c(a(i,1),:) = c(a(i,1),:) + X(i,:);
 m(a(i,1),1) = m(a(i,1),1) + 1; 
end

for j=1:k
if m(j,1) ==0
C(j,:)=c(j,:);
else
C(j,:)=c(j,:)/m(j,1); 
end
 
end
