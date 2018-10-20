function [C, a] = lloyd_iteration(X, C0)
% runs Lloyd's method until convergence
% INPUT:
%   X (num_samples x num_dims): data matrix
%   C0 (num_clusters x num_dims): initialized cluster centers
% OUTPUT:
%   C (num_clusters x num_dims): updated cluster centers
%   a (num_samples x 1): cluster assignment for each sample

 [n,d] = size(X);
 [k,d] = size(C0);
 
 A=zeros(n,500);

 A(:,1) = update_assignments(X, C0, A(:,1));
 C = update_centers(X, C0, A(:,1));
 A(:,2) = update_assignments(X, C0, A(:,1));
 
for t=2:499

 C = update_centers(X, C, A(:,t));
 A(:,t+1) = update_assignments(X, C, A(:,t));
 
 if A(:,t+1) == A(:,t)
 break
 end

end
 
 a=A(:,t+1);
 C = update_centers(X, C, a);
end
