function [ paramsP, cdsP, err, R2, R2_adjust, aic, bic ] = myDescend(sird, index, cds, params, steps, STEP, TIMES)
cdsP=myCDS(sird,index,params);
cdxR=cds(index);
error=cdxR-cdsP;
err=error'*error;
aic=length(cdxR)*log(err/length(cdxR))+2*length(params);
bic=length(cdxR)*log(err/length(cdxR))+log(length(cdxR))*length(params);

paramsP=params;

params_len=length(params);

History=20;
paramPHistory=zeros(History,length(params));
stepsP=steps;

for i=1:TIMES
    lastErr=err;
    for k=1:params_len
        if stepsP(k)>0
            [paramsPP,cdsPP,errPP]=myDescendStepParams(sird,index,cds,paramsP,stepsP,STEP,k);
            if(errPP<err)
               paramsP(k)=paramsPP(k);
               cdsP=cdsPP;
               err=errPP;
               aic=length(cdxR)*log(err/length(cdxR))+2*length(params);
               bic=length(cdxR)*log(err/length(cdxR))+log(length(cdxR))*length(params);
            end
        end    
    end
    if (lastErr-err)<1e-6
       steps_index=find(stepsP>0.001);
       if length(steps_index) == 0
       fprintf('myDescend breakng, time=%d, lastErr=%f, err=%f, aic=%f, bic=%f, ''err'',%f,''beta'',[%.4f,%.4f,%.4f,%.4f],''mu'',[%.4f,%.4f,%.4f,%.4f],''r'',%.3f,''delta'',%.3f,''XT'',%.3f,''T'',%d\n', ...
               i,lastErr,err,aic,bic,err,...
               paramsP(1),paramsP(2),paramsP(3),paramsP(4),paramsP(5),paramsP(6),...
               paramsP(7),paramsP(8),paramsP(9),paramsP(10),paramsP(11),paramsP(12));
           break;
       else
           stepsP(steps_index) = stepsP(steps_index) / 2;
           fprintf('myDescend running, ====half update step beta_step=[%.3f,%.3f,%.3f,%.3f], mu_step=[%.3f,%.3f,%.3f,%.3f], r_step=%.3f, delta_step=%.3f, XT_step=%.3f, T_step=%d\n', ...
                   stepsP(1),stepsP(2),stepsP(3),stepsP(4),stepsP(5),stepsP(6),...
                   stepsP(7),stepsP(8),stepsP(9),stepsP(10),stepsP(11),stepsP(12));
       end
    end
    if (mod(i,30)==1)
       cdsT=myCDS(sird,index,paramsP);
       errorT=cdxR-cdsT;
       errT=errorT'*errorT;
       fprintf('myDescend running, time=%d, lastErr=%f, err=%f, aic=%f, bic=%f, ''err'',%f,''beta'',[%.4f,%.4f,%.4f,%.4f],''mu'',[%.4f,%.4f,%.4f,%.4f],''r'',%.3f,''delta'',%.3f,''XT'',%.3f,''T'',%d\n', ...
               i,lastErr,err,aic,bic,errT,...
               paramsP(1),paramsP(2),paramsP(3),paramsP(4),paramsP(5),paramsP(6),...
               paramsP(7),paramsP(8),paramsP(9),paramsP(10),paramsP(11),paramsP(12));
    end
    paramPHistory(mod(i-1,20)+1,:)=paramsP;
    if(i>=History && mod(i,History)==0)
       avgParamsP=mean(paramPHistory);
       updateStep=0;
       for p=1:8
          if stepsP(p)>0.001 && stepsP(p)<0.1 
              bias=abs(avgParamsP(p)-paramsP(p));
              stepsP_new=0;
              if bias<=stepsP(p)
                  stepsP_new=stepsP(p)/2;
              elseif bias>=stepsP(p)*10
                  stepsP_new=stepsP(p)*2;
              end
              if stepsP_new > 0
                  updateStep=1;
                  stepsP(p)=stepsP_new;
              end
          end
       end
       if updateStep>0
           fprintf('myDescend running, =====update step beta_step=[%.3f,%.3f,%.3f,%.3f], mu_step=[%.3f,%.3f,%.3f,%.3f], r_step=%.3f, delta_step=%.3f, XT_step=%.3f, T_step=%d\n', ...
                   stepsP(1),stepsP(2),stepsP(3),stepsP(4),stepsP(5),stepsP(6),...
                   stepsP(7),stepsP(8),stepsP(9),stepsP(10),stepsP(11),stepsP(12));
       end
    end
end

cdxR_mean=mean(cdxR);
R2=1-((cdxR-cdsP)'*(cdxR-cdsP))./((cdxR-cdxR_mean)'*(cdxR-cdxR_mean));
R2_adjust=1-(1-R2)*(length(cdsP)-1)./(length(cdsP)-length(paramsP)-1);


