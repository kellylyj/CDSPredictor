function [t_hat, R2, R2_adjust] = predictCDSLinear(t,n,params,b,predict)
tn = t(n+1:end);
len = size(tn,1);
T = ones(len,n+1);
for i = 1 : n
    T(:,i+1) = t(n+1-i:len+n-i);
end
M=T;
for i = 1 : n
    M=[M,params(i:i+len-1,:)];   
end

t_hat=t;
if predict > 0
    for i=n+1:length(t_hat)
        t_his = [1;t_hat(i-n:i-1);M(i-n,n+2:end)']';
        t_hat(i)=t_his*b;
    end
    tn_hat=t_hat(n+1:end);
else
    tn_hat=M*b; 
    t_hat(n+1:end)=tn_hat;
end
tn_mean=mean(tn);
% tn_hat-tn
abs(tn_hat-tn);
% sum(abs(tn_hat-tn))
% (tn_hat-tn_mean)'*(tn_hat-tn_mean)
% ((tn-tn_mean)'*(tn-tn_mean))
% R2=((tn_hat-tn_mean)'*(tn_hat-tn_mean))./((tn-tn_mean)'*(tn-tn_mean));
R2=1-((tn-tn_hat)'*(tn-tn_hat))./((tn-tn_mean)'*(tn-tn_mean));
R2_adjust=1-(1-R2)*(length(tn_hat)-1)./(length(tn_hat)-length(b)-1);

end