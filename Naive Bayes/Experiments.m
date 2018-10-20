load("HW2Data.mat")

D = NB_XGivenY(XTrainSmall,yTrainSmall,2,5);
p = NB_YPrior(yTrainSmall);

yHatTrain = NB_Classify(D,p,XTrainSmall);
yHatTest = NB_Classify(D,p,XTest);
trainError = ClassificationError(yHatTrain,yTrainSmall);
testError = ClassificationError(yHatTest,yTest);