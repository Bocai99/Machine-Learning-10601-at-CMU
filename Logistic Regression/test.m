
[n,m]=size(XTrain);

TestError=zeros(1,50);
TrainError=zeros(1,50);

k = 10;

for k=10:10:500

x=k/10;

subsetInds = randperm(n,k);
XTrainSubset = XTrain(subsetInds,:);
yTrainSubset = yTrain(subsetInds);


%[wHat,objVals] = LR_SGA(XTrainSubset,yTrainSubset);
tol=0.0001;
    wHat=zeros(11,1);
    objVals = LR_CalcObj(XTrainSubset,yTrainSubset,wHat);
    num_iter = 1;
    
    for num_iter = 1:k
    
    oldObj = LR_CalcObj(XTrainSubset,yTrainSubset,wHat);
    
    sg = LR_CalcSG(XTrainSubset(num_iter,:),yTrainSubset(num_iter),wHat);
    eta=0.5/sqrt(num_iter);
    
    wHat = LR_UpdateParams(wHat,sg,eta);
    
    newObj = LR_CalcObj(XTrainSubset,yTrainSubset,wHat);
    objVals = [objVals,newObj];
    
    hasConverged = LR_CheckConvg(oldObj,newObj,tol);
    
    if hasConverged == logical(1)
    break
    end
    
    end

[yHat,numErrors] = LR_PredictLabels(XTest,yTest,wHat);
TestError(1,x) = numErrors; 

[yHat,numErrors] = LR_PredictLabels(XTrainSubset,yTrainSubset,wHat);
TrainError(1,x) = numErrors;

end

z=linspace(10,500,50);
plot(z,TrainError,'b');
hold on;
plot(z,TestError,'r');
xlabel('k');
ylabel('Error');
legend('TrainError','TestError');