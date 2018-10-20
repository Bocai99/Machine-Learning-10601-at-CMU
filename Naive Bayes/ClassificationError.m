function [classification_error] = ClassificationError(yHat, yTruth)

A=yHat-yTruth;
m=find(A~=0);
[x,y]=size(m);
[a,b]=size(yHat);
classification_error=y/b;

end
