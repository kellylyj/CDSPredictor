function [ b, t_hat, R2, R2_adjust, tval, pval, aic, bic  ] = myArn(t,n,predict)
tn = t(n+1:end);
len = size(tn,1);
T = ones(len,n+1);
for i = 1 : n
    T(:,i+1) = t(n+1-i:len+n-i);
end
S=pinv(T'*T);
b=S*(T'*tn);

t_hat=t;

if predict > 0
    t_hat_best = t_hat;
    err_best=realmax;
    kk=linspace(min(t_hat),max(t_hat),100);
    tt=zeros(length(kk)^n, n);
    for k=1:n
        num=length(kk)^(n-k);
        times=size(tt,1)/num;
        for p=1:times
            tt((p-1)*num+1:p*num,k)=kk(mod(p-1,length(kk))+1);
        end
    end
    for ti=1:length(tt)
        t_hat(1:n)=tt(ti);
        for i=n+1:length(t_hat)
            t_his = [1;t_hat(i-n:i-1)]';
            t_hat(i)=t_his*b;
        end
        err=(t_hat(n+1:end)-tn)'*(t_hat(n+1:end)-tn);
        if(err<err_best)
            err=err_best;
            t_hat_best=t_hat;
        end
    end
    tn_hat=t_hat_best(n+1:end);
else
    tn_hat=T*b;  
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

