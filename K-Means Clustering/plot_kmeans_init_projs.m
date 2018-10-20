%  Script that returns two plots:
%    - 2-d projection with random initialization
%    - 2-d projection with kmeans++ initialization
%
%  HW5, 1.h

load kmeans_data

n = size(X,1);
k = 9;

init_types = {'random', 'kmeans++'};

colors = [228,26,28; ...
            55,126,184; ...
            77,175,74; ...
            152,78,163; ...
            255,127,0; ...
            255,255,51; ...
            166,86,40; ...
            247,129,191; ...
            153,153,153];
colors = colors / 256;


for itype = 1:length(init_types)
    f = figure;

    rng(10601);
    
    [centers, labels, obj] = kmeans_cluster(X, k, init_types{itype}, 1);
    

    for isample = 1:length(labels)

        plot(X(isample, 1), X(isample, 2), '.', 'Color', colors(labels(isample),:), 'MarkerSize', 10);
        hold on;
    end
    xlim([0 4]);
    ylim([0 4]);

    for icluster = 1:k
        plot(centers(icluster,1), centers(icluster,2), '+', 'Color', colors(icluster,:), 'MarkerSize', 15);
    end
    
    xlabel('x_1');
    ylabel('x_2');
    title(sprintf('%s initialization', init_types{itype}));
    
end