function [ cdsP ] = myCDS(sird,index,params)
beta=params(1:4);
mu=params(5:8);
r=params(9);
delta=params(10);
XT=params(11);
T=params(12);

cdsP=zeros(length(index),1);
for t=index
    cdsP(t)=FuncCDS(t,T,sird,r,delta,beta,mu,XT);
end
end

