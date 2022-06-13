function [ date, cds ] = convertCDSData( CDS_DATA )
n=size(CDS_DATA,1);
cds=zeros(n,1);
date=[CDS_DATA(1).date;CDS_DATA(2).date;];
if date(1)>date(2)
    for i=1:n
      cds(i,1)=CDS_DATA(n+1-i).CDS; 
      date(i,1)=CDS_DATA(n+1-i).date;
    end
else
%     disp('not convert time')
    for i=1:n
      cds(i,1)=CDS_DATA(i).CDS; 
      date(i,1)=CDS_DATA(i).date;
    end    
end

end

