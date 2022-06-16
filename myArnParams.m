function [ b, t_hat, R2, R2_adjust, tval, pval, aic, bic ] = myArnParams( t,n,params,predict)
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

S=pinv(M'*M);
b=S*(M'*tn);

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
R2_adjust=1-(1-R2)*(length(tn_hat)-1)./(length(tn_hat)-length(b));

tval=zeros(size(b));
pval=zeros(size(b));
err=(tn-tn_hat)'*(tn-tn_hat);
for i=1:length(b)
    tval(i)=b(i)/sqrt(err/(length(tn_hat)-length(b))*S(i,i));
    pval(i)=(1-tcdf(abs(tval(i)),length(tn_hat)-length(b)))*2;
end

aic=length(tn)*log(err/length(tn))+2*length(b);
bic=length(tn)*log(err/length(tn))+log(length(tn))*length(b);


end

