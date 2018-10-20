function obj = kmeans_obj(X, C, a)
% computes the k-means objective function
% INPUT:
%   X (num_samples x num_dims): data matrix
%   C (num_clusters x num_dims): cluster centers
%   a (num_samples x 1): cluster assignments (1, ..., num_clusters)
%                           for each data point
% OUTPUT:
%   obj (1 x 1): k-means objective function
%
% NOTES:
%   - do not use 'pdist2'---not supported by Autolab

obj = 0;

 [n,d] = size(X);
 [k,d] = size(C);

for i=1:n
obj = obj + (X(i,1)-C(a(i,1),1))^2 + (X(i,2)-C(a(i,1),2))^2;
end
 
end
