
function [baseline_params] = baseline_train(state_seqs, obs_seqs, n, m)
    assert (length(state_seqs) == length(obs_seqs));

    c_A = zeros(n, m);

    %% Your code goes here. Collecting the co-occurrence statistics.
    
    for k = 1:length(obs_seqs)
        obs_seq = obs_seqs{k};
        state_seq = state_seqs{k};
        Tk = length(obs_seq);
    for l=1:Tk
    c_A(state_seq(l),obs_seq(l)) = c_A(state_seq(l),obs_seq(l))+1;
    end

    end

    baseline_params.A = c_A ./ repmat(sum(c_A, 2), 1, m);
end
