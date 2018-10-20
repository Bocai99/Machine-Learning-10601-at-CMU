function [yHat] = NB_Classify(D, p, XTest)


pyzero=XTest*log(D(1,:)')+(1-XTest)*log(1-D(1,:)')+log(p);

pyone=XTest*log(D(2,:)')+(1-XTest)*log(1-D(2,:)')+log(1-p);

yHat=(sign(pyone-pyzero)+1)/2

%u=log(D(2,:))-log(D(1,:))-log(1-D(2,:))+log(1-D(1,:));
%uzero=logProd(log(1-D(2,:))-log(1-D(1,:)))+log((1-p)/p);
%yHat=(sign(XTest*u'+uzero)+1)/2;

end
