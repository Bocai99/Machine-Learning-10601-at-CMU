% Calculate the stochastic gradient of the logistic regression
% objective function with respect to each parameter

function sg = LR_CalcSG(x,y,wHat)

    % Input:
    % x (1, p): Contains one training instance per row
    % y (1, 1): Contains the class labels for each training instance
    % wHat (p+1,1): Contains the regression parameters
    % Output:
    % sg (p+1,1): Contains the gradients

    % Your code here

    a = 1./(1+exp(-[1,x]*wHat));
    sg = (y-a)*[1,x]';

    
end
