clc
clear all
close all

load('CDS.mat');

weeklyData=[
struct('name','CACOM1J5','data',CACOM1J5_W);
struct('name','CBCI1E5','data',CBCI1E5_W);
struct('name','CBMW1E5','data',CBMW1E5_W);
struct('name','CBNP1E5','data',CBNP1E5_W);
struct('name','CBSH1E5','data',CBSH1E5_W);
struct('name','CCITO1J5','data',CCITO1J5_W);
struct('name','CCJAP1J5','data',CCJAP1J5_W);
struct('name','CCNON1J5','data',CCNON1J5_W);
struct('name','CCONT1E5','data',CCONT1E5_W);
struct('name','CEDF1E5','data',CEDF1E5_W);
struct('name','CFTEL1E5','data',CFTEL1E5_W);
struct('name','CHEI1E5','data',CHEI1E5_W);
struct('name','CJFE1J5','data',CJFE1J5_W);
struct('name','CJPM1U5','data',CJPM1U5_W);
struct('name','CJTOB1J5','data',CJTOB1J5_W);
struct('name','CKNEL1J5','data',CKNEL1J5_W);
struct('name','CKOM1J5','data',CKOM1J5_W);
struct('name','CLUFT1E5','data',CLUFT1E5_W);
struct('name','CMAR1J5','data',CMAR1J5_W);
struct('name','CMSL1J5','data',CMSL1J5_W);
struct('name','CMTRO1E5','data',CMTRO1E5_W);
struct('name','CNEC1J5','data',CNEC1J5_W);
struct('name','CNIPY1J5','data',CNIPY1J5_W);
struct('name','CRWE1E5','data',CRWE1E5_W);
struct('name','CSIEM1E5','data',CSIEM1E5_W);
struct('name','CSNE1J5','data',CSNE1J5_W);
struct('name','CSOF1J5','data',CSOF1J5_W);
struct('name','CSUMI1J5','data',CSUMI1J5_W);
struct('name','CT370372','data',CT370372_W);
struct('name','CTELP1J5','data',CTELP1J5_W);
struct('name','CTHYS1E5','data',CTHYS1E5_W);
struct('name','CVW1E5','data',CVW1E5_W);
struct('name','CYAMA1J5','data',CYAMA1J5_W);   
];

N=1;
testData=weeklyData;
show=0;
save=0;
test=0;
if save>0
    mkdir pics
end


testResult=[];
for k=1:size(testData,1)
    name=testData(k).name;
    data=testData(k).data;
    result=struct('name',name);
    val_bestR2=realmin();
    val_bestBIC=realmax();
    val_bestDateR2=datetime('2020-10-04');
    val_bestDateBIC=datetime('2020-10-04');
    for datePeriod=datetime('2020-10-04'):7:datetime('2021-04-01')
        val_R2=0;
        val_BIC=0;
        for last=0:1
            [date0, cds0]=convertCDSData(data);
            indices = find(date0 > datePeriod);
            if last==0
                date0 = date0(1:indices(1));
                cds0 = cds0(1:indices(1));
            else
                date0 = date0(indices(1):end);
                cds0 = cds0(indices(1):end);
            end
        
            [date1, S, I, R, D]=convertSIRDData(SIRD);
            [date2, RR, GP, PA, TS, WP, RE]=convertMobilityData(MOBILITY);
     %      [datex, cdsx, paramx]=combineData(date0, cds0, date1, [I,R,D]);
            [datex, cdsx, paramx]=combineData2(date0, cds0, date1, [I,R,D], date2, [RR, GP, PA, TS, WP, RE]);
                
            [bx,cdsx_hat,Rx,Rx_Adjust,tValX,pValX,aicX,bicX]=myArn(cdsx,N,1);
            [bxP,cdsxP_hat,RxP,RxP_Adjust,tValP,pValP,aicP,bicP]=myArnParams(cdsx,N,paramx(:,1:3),1);
            [bxE,cdsxE_hat,RxE,RxE_Adjust,tValE,pValE,aicE,bicE]=myArnParams(cdsx,N, paramx,1);

            if show>0
                figure;
                plot(datex, cdsx, '-b' , datex, cdsxP_hat, '-g','DatetimeTickFormat','yyyy/MM');
                legend('CDS price',['CDS-Model2 (R^2=',num2str(RxP_Adjust,'%.3f'),')']);
            end
        
%             startX=[];
%             for i=1:length(pValX)
%                 if (pValX(i)<=0.001)
%                     startX(i,:)='***';
%                 elseif (pValP(i)<=0.01)
%                     startX(i,:)='** ';
%                 elseif (pValP(i)<=0.05)
%                     startX(i,:)='*  ';
%                 else
%                     startX(i,:)='   ';
%                 end
%             end
%             fprintf('arn1:%10s, %s, %d, %.2f, aic:%6.2f, bic:%6.2f, %10.2f%s (%8.5f,%6.5f), %10.2f%s (%8.5f,%6.5f)\n', ...
%                      name, datePeriod, last, Rx_Adjust, aicX, bicX, ...
%                      bx(1), startX(1,:), tValX(1), pValX(1), ...
%                      bx(2), startX(2,:), tValX(2), pValX(2));     
%         
%         
%             startP=[];
%             for i=1:length(pValP)
%                 if (pValP(i)<=0.001)
%                     startP(i,:)='***';
%                 elseif (pValP(i)<=0.01)
%                     startP(i,:)='** ';
%                 elseif (pValP(i)<=0.05)
%                     startP(i,:)='*  ';
%                 else
%                     startP(i,:)='   ';
%                 end
%             end
%             fprintf('sird:%10s, %s, %d, %.2f, aic:%6.2f, bic:%6.2f, %10.2f%s (%8.5f,%6.5f), %10.2f%s (%8.5f,%6.5f), %10.2f%s (%8.5f,%6.5f), %10.2f%s (%8.5f,%6.5f), %10.2f%s (%8.5f,%6.5f)\n', ...
%                      name, datePeriod, last, RxP_Adjust, aicP, bicP, ...
%                      bxP(1), startP(1,:), tValP(1), pValP(1), ...
%                      bxP(2), startP(2,:), tValP(2), pValP(2), ...
%                      bxP(3), startP(3,:), tValP(3), pValP(3), ...
%                      bxP(4), startP(4,:), tValP(4), pValP(4), ...
%                      bxP(5), startP(5,:), tValP(5), pValP(5));
%         
%             startE=[];
%             for i=1:length(pValE)
%                 if (pValE(i)<=0.001)
%                     startE(i,:)='***';
%                 elseif (pValE(i)<=0.01)
%                     startE(i,:)='** ';
%                 elseif (pValE(i)<=0.05)
%                     startE(i,:)='*  ';
%                 else
%                     startE(i,:)='   ';
%                 end
%             end
%             fprintf('mobi:%10s, %s, %d, %.2f, aic:%6.2f, bic:%6.2f, %10.2f%s (%8.5f,%6.5f), %10.2f%s (%8.5f,%6.5f), %10.2f%s (%8.5f,%6.5f), %10.2f%s (%8.5f,%6.5f), %10.2f%s (%8.5f,%6.5f), %10.2f%s (%8.5f,%6.5f), %10.2f%s (%8.5f,%6.5f), %10.2f%s (%8.5f,%6.5f), %10.2f%s (%8.5f,%6.5f), %10.2f%s (%8.5f,%6.5f), %10.2f%s (%8.5f,%6.5f)\n', ...
%                      name, datePeriod, last, RxE_Adjust, aicE, bicE, ...
%                      bxE(1), startE(1,:), tValE(1), pValE(1), ...
%                      bxE(2), startE(2,:), tValE(2), pValE(2), ...
%                      bxE(3), startE(3,:), tValE(3), pValE(3), ...
%                      bxE(4), startE(4,:), tValE(4), pValE(4), ...
%                      bxE(5), startE(5,:), tValE(5), pValE(5), ...
%                      bxE(6), startE(6,:), tValE(6), pValE(6), ...
%                      bxE(7), startE(7,:), tValE(7), pValE(7), ...
%                      bxE(8), startE(8,:), tValE(8), pValE(8), ...
%                      bxE(9), startE(9,:), tValE(9), pValE(9), ...
%                      bxE(10), startE(10,:), tValE(10), pValE(10), ...
%                      bxE(11), startE(11,:), tValE(11), pValE(11));

            val_R2=val_R2+RxP_Adjust;
            val_BIC=val_BIC+bicP;   
        end
        if val_R2>val_bestR2
            val_bestR2=val_R2;
            val_bestDateR2=datePeriod;
        end
        if val_BIC<val_bestBIC
            val_bestBIC=val_BIC;
            val_bestDateBIC=datePeriod;
        end
    end
    fprintf('best:%10s, %s, %f, %s, %f\n', ...
             name, val_bestDateR2, val_bestR2, val_bestDateBIC, val_bestBIC);
end









