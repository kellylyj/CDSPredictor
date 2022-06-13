function [tf] = filter_v(t,interval,method)
len=length(t);
tf=zeros(size(t));
left=floor(interval/2);
right=interval-1-left;
for i=1:len
    start=max(i-left,1);
    finish=min(i+right,len);
    if method>0
        tf(i)=median(t(start:finish));
    else
        tf(i)=mean(t(start:finish));
    end
end
end