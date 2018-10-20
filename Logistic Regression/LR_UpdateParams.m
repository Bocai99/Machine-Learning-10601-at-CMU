% Calculate the new value of wHat using the gradient 
% ascent update rule

function wHat = LR_UpdateParams(wHat,grad,eta)

    % Input:
    % wHat (p+1,1): Contains the regression parameters
    % grad (p+1, 1): Contains the gradients
    % eta (1,1): Scalar containing the learning rate
    % Output:
    % wHat (p+1,1): Contains the updated regression parameters

    % Your code here
    
    wHat = wHat + eta*grad;

end
