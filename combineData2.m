function [ datex, cdsx, paramsx ] = combineData2( date0, cds, date1, params1, date2, params2 )
datex=[date0(1)];
cdsx=[cds(1)];
paramsx=[params1(1,:),params2(1,:)];
k=1;
n=size(date1,1);
for i = 1 : n
    date=date1(i);
    indices0 = find(date0==date);
    indices2 = find(date2==date);
    if size(indices0,1)==1 && size(indices2,1)==1
       cdsx(k,:)=cds(indices0);
       datex(k,:)=date;
       paramsx(k,:)=[params1(i,:),params2(indices2,:)];
       k=k+1;
    end
end

end