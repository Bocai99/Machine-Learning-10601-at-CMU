
function [pred_state_seqs] = hmm_decode(hmm_params, obs_seqs)
    % Working directly in log domain, as it is more numerically stable.
    log_B = log(hmm_params.B);
    log_A = log(hmm_params.A);
    [n, m] = size(log_A); 

    pred_state_seqs = cell(1, length(obs_seqs));

    for k = 1:length(obs_seqs)
        ob_seq = obs_seqs{k};
        Tk = length(ob_seq);

        pred_st_seq = zeros(1, Tk);

        % Tables for keeping the scores and backpointers.
        scores = zeros(n, Tk);
        back_pts = zeros(n, Tk);

        %% Your code goes here. Maintain the Viterbi table and the 
        % backpointer table. Recover the most probable assignment.
        
        scores(:,1) = (log_B(n+1,1:n))' + log_A(:,ob_seq(1));
        back_pts(:,1) = n+1;
        
        for j = 2:Tk
        for i = 1:n
        X = scores(:,j-1) + log_B(1:n,i) + log_A(i,ob_seq(j));
        Y = scores(:,j-1) + log_B(1:n,i);
        scores(i,j) = max(X);
        [M,back_pts(i,j)] = max(Y);
        end
        end
                     
        [maxscore, pred_st_seq(1,Tk)] = max(scores(:,Tk)+log_B(1:n,n+2));
        for j=1:Tk-1
        pred_st_seq(1,Tk-j) = back_pts(pred_st_seq(1,Tk-j+1),Tk-j+1);
        end
        
        pred_state_seqs{k} = pred_st_seq;
    end
end

