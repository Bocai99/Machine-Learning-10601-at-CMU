function [D] = NB_XGivenY(XTrain, yTrain, alpha, beta)

[W,V]=size(XTrain);
theta=zeros(2,V);

[m,n]=size(yTrain);

theta(2,:)=((alpha-1)+yTrain'*XTrain)/((alpha-1)+(beta-1)+sum(yTrain));
theta(1,:)=((alpha-1)+(1-yTrain')*XTrain)/((alpha-1)+(beta-1)+m-sum(yTrain));

D = theta;

end
