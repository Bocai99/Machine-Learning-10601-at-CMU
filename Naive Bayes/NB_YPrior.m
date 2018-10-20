function [p] = NB_YPrior(yTrain)

[m,n]=size(yTrain);
p=1-(sum(yTrain)/m);

end
