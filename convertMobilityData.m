function [ date, RR, GP, PA, TS, WP, RE ] = convertMobilityData( DATA )
n=size(DATA,1);
RR=zeros(n,1);
GP=zeros(n,1);
PA=zeros(n,1);
TS=zeros(n,1);
WP=zeros(n,1);
RE=zeros(n,1);
date=[DATA(1).date;DATA(2).date;];
if date(1)>date(2)
    for k=1:n
      RR(k,1)=DATA(n+1-k).RR;
      GP(k,1)=DATA(n+1-k).GP;
      PA(k,1)=DATA(n+1-k).PA;
      TS(k,1)=DATA(n+1-k).TS;
      WP(k,1)=DATA(n+1-k).WP;
      RE(k,1)=DATA(n+1-k).RE;    
      date(k,1)=DATA(n+1-k).date;
    end
else
    for k=1:n
      RR(k,1)=DATA(k).RR; 
      GP(k,1)=DATA(k).GP;
      PA(k,1)=DATA(k).PA;
      TS(k,1)=DATA(k).TS;
      WP(k,1)=DATA(k).WP;
      RE(k,1)=DATA(k).RE; 
      date(k,1)=DATA(k).date;        
    end    
end

end

