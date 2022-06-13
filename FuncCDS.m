function [ value ] = FuncCDS( t, T, sird, r, delta, beta, mu, XT )
d1=0;d2=0;
for i=1:T
    val=FuncD(t,t+i,r)*FuncDiffM(t,i,sird,beta,mu,XT); 
    d1=d1+val;  
end

%half year 26 month
T2=26;
for i=T2:T2:T
    val=FuncD(t,t+i,r)*FuncM(t,i,sird, beta, mu);
    d2=d2+val;
end
if abs(d2)>1e-6
    value=2*(1-delta)*d1/d2;    
else
    value=0;
end
end

