
function [pred_state_seqs] = baseline_decode(baseline_params, obs_seqs)
    A = baseline_params.A;
    pred_state_seqs = cell(1, length(obs_seqs));

    %% Remove from here
    for k = 1:length(obs_seqs)
        ob_seq = obs_seqs{k};
        Tk = length(ob_seq);

        % Independent prediction for each symbol.
        pred_st_seq = zeros(1, Tk);

        %% Your code goes here. Independent prediction of each label.
        for l=1:Tk
        [a,n] = max(A(:,ob_seq(l)));
        pred_st_seq(1,l) = n;
        end

        pred_state_seqs{k} = pred_st_seq;
    end
end

