function [date_e, s_e, i_e, r_e, d_e] = estimateIRD(date, s, i, r, d, t)
len=length(date);
it=300;
rt=100;
dt=100;

ii=filter_v(i,it,0);
rr=filter_v(r,rt,0);
dd=filter_v(d,dt,0);
dI=diff(ii);
dR=diff(rr);
dD=diff(dd);
aI=mean(dI(it/2:end-it/2));
aD=mean(dD(dt/2:end-dt/2));
aR=mean(dR(rt/2:end-rt/2));

date_e=date;
s_e=s;
i_e=i;
r_e=r;
d_e=d;

for k=1:t
    date_e(len+k)=date_e(len+k-1)+1;
    i_e(len+k)=i_e(len+k-1)+aI;
    r_e(len+k)=r_e(len+k-1)+aR;
    d_e(len+k)=d_e(len+k-1)+aD;
    s_e(len+k)=1-i_e(len+k-1)-r_e(len+k-1)-d_e(len+k-1);
end

end