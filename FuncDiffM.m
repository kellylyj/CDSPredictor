function [ value ] = FuncDiffM(t, T, sird, beta, mu, XT)
val=FuncM(t, T, sird, beta, mu);
sird_T=[sird(t+T,:)];
lamb=sird_T*beta';
lamb_all=sum(lamb);
lambda=lamb_all+XT;
value=val*lambda;
end

