function [date_e, cds_e] = estimateCDS(date, cds, t)
% only fill with zeros
dDate=diff(date);
aDate=round(mean(dDate));
date_e=date;
cds_e=cds;
len=length(date);
for k=1:t
    date_e(len+k)=date_e(len+k-1)+7;
    cds_e(len+k)=0;
end

end