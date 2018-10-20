% Run the gradient ascent algorithm for logistic regression

function [wHat,objVals] = LR_SGA(XTrain,yTrain)

    % Input:
    % XTrain (n, p): Contains one training instance per row
    % yTrain (n, 1): Contains the class labels for each training instance
    % Output:
    % wHat (p+1,1): Contains the regression parameters
    % objVals (num_iter+1, 1): Contains the objective value at each step of the iteration

    % Your code here

    
    tol=0.0001;
    wHat=zeros(11,1);
    
    objVals = LR_CalcObj(XTrain,yTrain,wHat);
    
    num_iter = 1;
    
    for num_iter = 1:500
    
    oldObj = LR_CalcObj(XTrain,yTrain,wHat);
    
    sg = LR_CalcSG(XTrain(num_iter,:),yTrain(num_iter),wHat);
    eta=0.5/sqrt(num_iter);
    
    wHat = LR_UpdateParams(wHat,sg,eta);
    
    newObj = LR_CalcObj(XTrain,yTrain,wHat);
    objVals = [objVals,newObj];
    
    hasConverged = LR_CheckConvg(oldObj,newObj,tol);
    
    if hasConverged == logical(1)
    break
    end
    
    end
    
    

end
