function [ datex, cdsx, paramsx ] = combineData( date0, cds, date1, params1 )
datex=[date0(1)];
cdsx=[cds(1)];
paramsx=params1(1,:);
k=1;
n=size(date1,1);
for i = 1 : n
    date=date1(i);
    indices0 = find(date0==date);
    if size(indices0,1)==1
       cdsx(k,:)=cds(indices0);
       datex(k,:)=date;
       paramsx(k,:)=params1(i,:);
       k=k+1;
    end
end

end

