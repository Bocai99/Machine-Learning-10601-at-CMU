% Calculate the logistic regression objective value

function obj = LR_CalcObj(XTrain,yTrain,wHat)

    % Input:
    % XTrain (n, p): Contains one training instance per row
    % yTrain (n, 1): Contains the class labels for each training instance
    % wHat (p+1,1): Contains the regression parameters
    % Output:
    % obj (1, 1): Contains the objective value

    % Your code here
    
    [n,m] = size(yTrain);
    
    X = [ones(n,1),XTrain];
    
    a = 1./(1 + exp(-X*wHat));
    
    obj = yTrain'*log(a) + (1-yTrain')*log(1-a);

  
end
