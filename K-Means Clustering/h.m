obj_random = zeros (1000,1);

for i=1:1000
[best_C, best_a, best_obj] = kmeans_cluster(X, 9, 'random', 1);
obj_random(i,1) = best_obj;
end

mean_obj_random = mean(obj_random)
std_obj_random = std(obj_random)

obj_kmeans = zeros (1000,1);

for i=1:1000
[best_C, best_a, best_obj] = kmeans_cluster(X, 9, 'kmeans++', 1);
obj_kmeans(i,1) = best_obj;
end

mean_obj_kmeans = mean(obj_kmeans)
std_obj_kmeans = std(obj_kmeans)