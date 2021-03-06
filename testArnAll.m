clear all
close all
clc

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
show=1;
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
    for i=N:N
        [date0, cds0]=convertCDSData(data);
        indices = find(date0 > '2021-01-01');
        date0 = date0(1:indices(1));
        cds0 = cds0(1:indices(1));
        
%        date0 = date0(indices(1):end);
%        cds0 = cds0(indices(1):end);

        [date1, S, I, R, D]=convertSIRDData(SIRD);
        [date2, RR, GP, PA, TS, WP, RE]=convertMobilityData(MOBILITY);
%         [datex, cdsx, paramx]=combineData(date0, cds0, date1, [I,R,D]);
        [datex, cdsx, paramx]=combineData2(date0, cds0, date1, [I,R,D], date2, [RR, GP, PA, TS, WP, RE]);
        
        [bx,cdsx_hat,Rx,Rx_Adjust,tValX,pValX,aicX,bicX]=myArn(cdsx,i,1);
        [bxP,cdsxP_hat,RxP,RxP_Adjust,tValP,pValP,aicP,bicP]=myArnParams(cdsx,i,paramx(:,1:3),1);
        [bxE,cdsxE_hat,RxE,RxE_Adjust,tValE,pValE,aicE,bicE]=myArnParams(cdsx,i, paramx,1);

        if save>0 || show>0
            figure;
%             plot(datex, cdsx, '-b' , datex, cdsx_hat, '-r' , datex, cdsxP_hat, '-g', datex, cdsxE_hat, '-k')
%             legend('CDS price',['CDS-ARn   (R^2=',num2str(Rx_Adjust,'%.3f'),')'],['CDS-SIRD (R^2=',num2str(RxP_Adjust,'%.3f'),')'],['CDS-MOBI (R^2=',num2str(RxE_Adjust,'%.3f'),')'])
            
%             plot(datex, cdsx, '-b', datex, cdsxP_hat, '-g', datex, cdsxE_hat, '-k')
%             legend('CDS price',['CDS-Model2 (R^2=',num2str(RxP_Adjust,'%.3f'),')'],['CDS-Model3 (R^2=',num2str(RxE_Adjust,'%.3f'),')'])

             plot(datex, cdsx, '-b' , datex, cdsx_hat, '-g','DatetimeTickFormat','yyyy/MM');
             legend('CDS price',['CDS-Model1 (R^2=',num2str(Rx_Adjust,'%.3f'),')'])

%            plot(datex, cdsx, '-b' , datex, cdsxP_hat, '-g','DatetimeTickFormat','yyyy/MM');
%            legend('CDS price',['CDS-Model2 (R^2=',num2str(RxP_Adjust,'%.3f'),')'])
            
%              plot(datex, cdsx, '-b' , datex, cdsxE_hat, '-g','DatetimeTickFormat','yyyy/MM');
%              legend('CDS price',['CDS-Model3 (R^2=',num2str(RxE_Adjust,'%.3f'),')'])

            if test > 0
                hold on
                bxP_t1=bxP;
                bxP_t1(3) = bxP_t1(3)*(1/test);
                [cdsxP_hat_t1, RxP_t1, RxP_Adjust_t1]=predictCDSLinear(cdsx,i,paramx(:,1:3),bxP_t1,1);
    
                bxP_t2=bxP;
                bxP_t2(4) = bxP_t2(4)*(1/test);
                [cdsxP_hat_t2, RxP_t2, RxP_Adjust_t2]=predictCDSLinear(cdsx,i,paramx(:,1:3),bxP_t2,1);
    
                bxP_t3=bxP;
                bxP_t3(5) = bxP_t3(5)*(1/test);
                [cdsxP_hat_t3, RxP_t3, RxP_Adjust_t3]=predictCDSLinear(cdsx,i,paramx(:,1:3),bxP_t3,1);            
    
                
                plot(datex, cdsxP_hat_t1, '-m', datex, cdsxP_hat_t2, '-c', datex, cdsxP_hat_t3, '-k');
                legend('CDS price',['CDS-Model2 (R^2=',num2str(RxP_Adjust,'%.3f'),')'], ...
                        ['CDS-Model2 i*,',num2str(test)], ...
                        ['CDS-Model2 r*',num2str(test)], ...
                        ['CDS-Model2 d*',num2str(test)] ...
                      )
            else
%                 legend('CDS price',['CDS-Model2 (R^2=',num2str(RxP_Adjust,'%.3f'),')'])
            end
            title([name]);
            hold off
            if save>0
                if test > 0
                    saveas(gca,['./pics/Model2_',name,'_test.png']);
                else
                    saveas(gca,['./pics/Model2_',name,'.png']);
                end
            end
            if show==0
                close
            end
        end


        startX=[];
        for i=1:length(pValX)
            if (pValX(i)<=0.001)
                startX(i,:)='***';
            elseif (pValP(i)<=0.01)
                startX(i,:)='** ';
            elseif (pValP(i)<=0.05)
                startX(i,:)='*  ';
            else
                startX(i,:)='   ';
            end
        end
        if N==1
            fprintf('arn1:%10s, %.2f, aic:%6.2f, bic:%6.2f, %10.2f%s (%8.5f,%6.5f), %10.2f%s (%8.5f,%6.5f)\n', ...
                     name, Rx_Adjust, aicX, bicX, ...
                     bx(1), startX(1,:), tValX(1), pValX(1), ...
                     bx(2), startX(2,:), tValX(2), pValX(2));
        elseif N==2
            fprintf('arn2:%10s, %.2f, aic:%6.2f, bic:%6.2f, %10.2f%s (%8.5f,%6.5f), %10.2f%s (%8.5f,%6.5f), %10.2f%s (%8.5f,%6.5f)\n', ...
                     name, Rx_Adjust, aicX, bicX, ...
                     bx(1), startX(1,:), tValX(1), pValX(1), ...
                     bx(2), startX(2,:), tValX(2), pValX(2), ...
                     bx(3), startX(3,:), tValX(3), pValX(3));
        elseif N==3
            fprintf('arn3:%10s, %.2f, aic:%6.2f, bic:%6.2f, %10.2f%s (%8.5f,%6.5f), %10.2f%s (%8.5f,%6.5f), %10.2f%s (%8.5f,%6.5f), %10.2f%s (%8.5f,%6.5f)\n', ...
                     name, Rx_Adjust, aicX, bicX, ...
                     bx(1), startX(1,:), tValX(1), pValX(1), ...
                     bx(2), startX(2,:), tValX(2), pValX(2), ...
                     bx(3), startX(3,:), tValX(3), pValX(3), ...
                     bx(4), startX(4,:), tValX(4), pValX(4));       
        end


        startP=[];
        for i=1:length(pValP)
            if (pValP(i)<=0.001)
                startP(i,:)='***';
            elseif (pValP(i)<=0.01)
                startP(i,:)='** ';
            elseif (pValP(i)<=0.05)
                startP(i,:)='*  ';
            else
                startP(i,:)='   ';
            end
        end
        fprintf('sird:%10s, %.2f, aic:%6.2f, bic:%6.2f, %10.2f%s (%8.5f,%6.5f), %10.2f%s (%8.5f,%6.5f), %10.2f%s (%8.5f,%6.5f), %10.2f%s (%8.5f,%6.5f), %10.2f%s (%8.5f,%6.5f)\n', ...
                 name, RxP_Adjust, aicP, bicP, ...
                 bxP(1), startP(1,:), tValP(1), pValP(1), ...
                 bxP(2), startP(2,:), tValP(2), pValP(2), ...
                 bxP(3), startP(3,:), tValP(3), pValP(3), ...
                 bxP(4), startP(4,:), tValP(4), pValP(4), ...
                 bxP(5), startP(5,:), tValP(5), pValP(5));

        startE=[];
        for i=1:length(pValE)
            if (pValE(i)<=0.001)
                startE(i,:)='***';
            elseif (pValE(i)<=0.01)
                startE(i,:)='** ';
            elseif (pValE(i)<=0.05)
                startE(i,:)='*  ';
            else
                startE(i,:)='   ';
            end
        end
         fprintf('mobi:%10s, %.2f, aic:%6.2f, bic:%6.2f, %10.2f%s (%8.5f,%6.5f), %10.2f%s (%8.5f,%6.5f), %10.2f%s (%8.5f,%6.5f), %10.2f%s (%8.5f,%6.5f), %10.2f%s (%8.5f,%6.5f), %10.2f%s (%8.5f,%6.5f), %10.2f%s (%8.5f,%6.5f), %10.2f%s (%8.5f,%6.5f), %10.2f%s (%8.5f,%6.5f), %10.2f%s (%8.5f,%6.5f), %10.2f%s (%8.5f,%6.5f)\n', ...
                  name, RxE_Adjust, aicE, bicE, ...
                  bxE(1), startE(1,:), tValE(1), pValE(1), ...
                  bxE(2), startE(2,:), tValE(2), pValE(2), ...
                  bxE(3), startE(3,:), tValE(3), pValE(3), ...
                  bxE(4), startE(4,:), tValE(4), pValE(4), ...
                  bxE(5), startE(5,:), tValE(5), pValE(5), ...
                  bxE(6), startE(6,:), tValE(6), pValE(6), ...
                  bxE(7), startE(7,:), tValE(7), pValE(7), ...
                  bxE(8), startE(8,:), tValE(8), pValE(8), ...
                  bxE(9), startE(9,:), tValE(9), pValE(9), ...
                  bxE(10), startE(10,:), tValE(10), pValE(10), ...
                  bxE(11), startE(11,:), tValE(11), pValE(11));


        
        if i==1
            result.AR1=Rx;
            result.AR1_SIRD=RxP;
            result.AR1_SIRD_MOBILITY=RxE;
        elseif i==2
            result.AR2=Rx;
            result.AR2_SIRD=RxP;
            result.AR2_SIRD_MOBILITY=RxE;
        elseif i==3
            result.AR3=Rx_Adjust;
            result.AR3_SIRD=RxP_Adjust;
            result.AR3_SIRD_MOBILITY=RxE_Adjust;
        elseif i==4
            result.AR4=Rx_Adjust;
            result.AR4_SIRD=RxP_Adjust;
            result.AR4_SIRD_MOBILITY=RxE_Adjust;
        elseif i==5
            result.AR5=Rx_Adjust;
            result.AR5_SIRD=RxP_Adjust;
            result.AR5_SIRD_MOBILITY=RxE_Adjust;
        elseif i==6
            result.AR6=Rx_Adjust;
            result.AR6_SIRD=RxP_Adjust;
            result.AR6_SIRD_MOBILITY=RxE_Adjust;
        elseif i==7
            result.AR7=Rx_Adjust;
            result.AR7_SIRD=RxP_Adjust;
            result.AR7_SIRD_MOBILITY=RxE_Adjust;
        elseif i==8
            result.AR8=Rx_Adjust;
            result.AR8_SIRD=RxP_Adjust;
            result.AR8_SIRD_MOBILITY=RxE_Adjust;
        elseif i==9
            result.AR9=Rx_Adjust;
            result.AR9_SIRD=RxP_Adjust;
            result.AR9_SIRD_MOBILITY=RxE_Adjust;
        end
    end
    if size(testResult)==0
        testResult=[result];
    else
        testResult(k)=result;
    end
end

%% Arn picture
% figure;
% title(['ARn']);
% for i=1:size(testResult,2)
%     xn=[1:9];
%     yn=[testResult(i).AR1,testResult(i).AR2,testResult(i).AR3,testResult(i).AR4,testResult(i).AR5,testResult(i).AR6,testResult(i).AR7,testResult(i).AR8,testResult(i).AR9];
%     plot(xn, yn);
%     hold on
% end
% xlabel('p')
% ylabel('Adjust R^2')
% title('AR(p) Model');
% legend(testResult(1).name,testResult(2).name,testResult(2).name,testResult(2).name,testResult(2).name,testResult(2).name,testResult(2).name,testResult(2).name);


