function [ paramsP, cdsP, err ] = myDescendStepParams( sird, index, cds, params, steps, STEP, k)
cdsR=cds(index);

paramsP=params;
cdsP=myCDS(sird,index,params);
error=cdsR-cdsP;
err=error'*error;

if steps(k)>0
    paramsk_start=params(k)-steps(k)*STEP(k);
    paramsk_finish=params(k)+steps(k)*STEP(k);
    paramsPP=params;
    for paramk=paramsk_start:steps(k):paramsk_finish
        paramsPP(k)=paramk;
        cdsPP=myCDS(sird,index,paramsPP);
        errorPP=cdsR-cdsPP;
        errPP=errorPP'*errorPP;

        if(errPP<err)
           paramsP=paramsPP;
           cdsP=cdsPP;
           err=errPP;
        end
   end    
end
    
end