% Script that plots kmean obj vs. number of clusters, k
%
% Finish the script where indicated
%
% HW5, 1.f

load kmeans_data
    % returns X (N x 2): data matrix for N samples

    objs = zeros(20,1);
     % store obj values for each k

%%%%%% COMPLETE CODE HERE %%%%%%%%
% Use kmeans_cluster.m to obtain 
%   the objective function valuesfor k=1,...,20
% Save objective function values in the variable 'objs'

    for k=1:20
    %C0 = ones(k,2);
    %[C, a] = lloyd_iteration(X, C0);
    [best_C, best_a, best_obj] = kmeans_cluster(X, k, 'random', 10);
    %objs(k,1) = kmeans_obj(X, C, a);
    objs(k,1) = best_obj;
    end
    
    
%%%%%% DO NOT CHANGE FOLLOWING CODE %%%%%%%%
f = figure;
plot(objs, 'x-');
ylabel('kmeans obj value');
xlabel('number of clusters, k');


