% Predict the labels for a test set using logistic regression

function [yHat,numErrors] = LR_PredictLabels(XTest,yTest,wHat)

    % Input:
    % XTrain (m, p): Contains one test instance per row
    % yTrain (m, 1): Contains the true class labels for each test instance
    % wHat (p+1,1): Contains the regression parameters
    % Output:
    % yHat (m, 1): Contains the predicted class labels for each test instance
    % numErrors (1,1): Contains the number of misclassified examples

  % Your code here

  [n,m] = size(XTest);
   
    X = [ones(n,1),XTest];
  
    py = 1./(1 + exp(-X*wHat));

    yHat=(sign(py-0.5)+1)/2;
    
    A=yHat-yTest;
    m=find(A~=0);
    [x,y]=size(m);
    numErrors=x;
  
end
