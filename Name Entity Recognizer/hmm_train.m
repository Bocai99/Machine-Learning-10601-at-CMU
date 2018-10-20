
function [hmm_params] = hmm_train(state_seqs, obs_seqs, n, m, alpha_obs, alpha_trans)

    assert (length(state_seqs) == length(obs_seqs));

    % Initialization of the tables for the counts.
    c_B = zeros(n+2, n+2);
    c_A = zeros(n, m);

    %% Your code goes here. Collect the statistics from the data.
    
    
    
    for k = 1:length(obs_seqs)
        obs_seq = obs_seqs{k};
        state_seq = state_seqs{k};
        Tk = length(obs_seq);
    
    c_A(state_seq(1),obs_seq(1)) = c_A(state_seq(1),obs_seq(1))+1;
    c_B(n+1,state_seq(1)) = c_B(n+1,state_seq(1)) +1;
    for l=2:Tk
    c_A(state_seq(l),obs_seq(l)) = c_A(state_seq(l),obs_seq(l))+1;
    c_B(state_seq(l-1),state_seq(l)) = c_B(state_seq(l-1),state_seq(l))+1;
    end
    c_B(state_seq(Tk),n+2) = c_B(state_seq(Tk),n+2) +1;
    c_B(n+2,n+2) = c_B(n+2,n+2) + 1;

    
    end
    
    
    % Adding smoothing.
    c_B(1:n+1, 1:n) = c_B(1:n+1, 1:n) + alpha_trans;
    c_B(1:n, n+2) = c_B(1:n, n+2) + alpha_trans;
    c_A = c_A + alpha_obs;

    % The sum of the transitions out of each of the states.
    c_trans = sum(c_B, 2);

    hmm_params.B = c_B ./ repmat(c_trans, 1, n + 2);
    hmm_params.A = c_A ./ repmat(sum(c_A, 2), 1, m);
end

