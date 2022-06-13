function [ paramsP, cdsP, err ] = myDescendStep( sird, index, cds, params, steps, STEP )
params_len = length(params);

params_best=params;
err_best=1e30;
cds_best=zeros(cds(index));

for k=1:params_len
    if steps(k)> 0
        params_start=params(k)-steps(k)*STEP;
        params_finish=params(k)+steps(k)*STEP;
        for paramk=params_start:stepsk:params_end
            params_best(k)=paramk;
            
        end

        
    end
end

cdsP=myCDS(sird,index,params);
cdsR=cds(index);
error=cdsR-cdsP;
err=error'*error;
paramsP=params;

end

