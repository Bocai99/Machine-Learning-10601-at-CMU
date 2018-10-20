function a = update_assignments(X, C, a)
% computes assignments, given data points and cluster centers
% INPUT:
%   X (num_samples x num_dims): data matrix
%   C (num_clusters x num_dims): cluster centers
%   a (num_samples x 1): cluster assignments (1, ..., num_clusters)
%                           for each data point
% OUTPUT:
%   a (num_samples x 1): updated assignments
%
% NOTES:
%   - do not use 'pdist2'---not supported by Autolab

 [n,d] = size(X);
 [k,d] = size(C);
 
 
 for i=1:n
 b = 1;
 
 for j=2:k

 if (X(i,1)-C(j,1))^2 + (X(i,2)-C(j,2))^2 < (X(i,1)-C(b,1))^2 + (X(i,2)-C(b,2))^2
 b = j;
 end 
 
 end
 
 a(i,1) = b;
 end
 

end
