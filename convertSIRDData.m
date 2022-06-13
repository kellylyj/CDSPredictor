function [ date,S, I, R, D ] = convertSIRDData( DATA )
n=size(DATA,1);
S=zeros(n,1);
I=zeros(n,1);
R=zeros(n,1);
D=zeros(n,1);
date=[DATA(1).date;DATA(2).date;];
if date(1)>date(2)
    for k=1:n
      S(k,1)=DATA(n+1-k).S;
      I(k,1)=DATA(n+1-k).I;
      R(k,1)=DATA(n+1-k).R;
      D(k,1)=DATA(n+1-k).D;
%       I(k,1)=DATA(n+1-k).infected;
%       R(k,1)=DATA(n+1-k).recoverd;
%       D(k,1)=DATA(n+1-k).deaths;      
      date(k,1)=DATA(n+1-k).date;
    end
else
%     disp('not convert time')
    for k=1:n
      S(k,1)=DATA(k).S; 
      I(k,1)=DATA(k).I;
      R(k,1)=DATA(k).R;
      D(k,1)=DATA(k).D;
%       I(k,1)=DATA(k).infected;
%       R(k,1)=DATA(k).recoverd;
%       D(k,1)=DATA(k).deaths;
      date(k,1)=DATA(k).date;        
    end    
end

end
