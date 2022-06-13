function [ value ] = FuncM( t, T, sird, beta, mu)

sird_data=sird(t+1:t+T,:);
lamb=sird_data*beta';
lamb_all=sum(lamb);
val=exp(-lamb_all);

%EQ
EQ=1;
len=length(mu);
if len >= 4
    EQ=mu(1)+mu(2)*T+mu(3)*exp(-mu(4)*T); 
elseif len >= 2
    EQ=mu(1)+mu(2)*T;    
elseif len >= 1
    EQ=mu(1);
else
    disp('mu length invalid');
end
value=val*EQ;

end

