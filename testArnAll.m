clear all
close all
clc

load('CDS.mat');

weeklyData=[
% struct('name','CACOM1J5','data',CACOM1J5_W);
% struct('name','CBCI1E5','data',CBCI1E5_W);
% struct('name','CBMW1E5','data',CBMW1E5_W);
% struct('name','CBNP1E5','data',CBNP1E5_W);
% struct('name','CBSH1E5','data',CBSH1E5_W);
% struct('name','CCITO1J5','data',CCITO1J5_W);
% struct('name','CCJAP1J5','data',CCJAP1J5_W);
% struct('name','CCNON1J5','data',CCNON1J5_W);
% struct('name','CCONT1E5','data',CCONT1E5_W);
% struct('name','CEDF1E5','data',CEDF1E5_W);
% struct('name','CFTEL1E5','data',CFTEL1E5_W);
% struct('name','CHEI1E5','data',CHEI1E5_W);
% struct('name','CJFE1J5','data',CJFE1J5_W);
% struct('name','CJPM1U5','data',CJPM1U5_W);
% struct('name','CJTOB1J5','data',CJTOB1J5_W);
% struct('name','CKNEL1J5','data',CKNEL1J5_W);
% struct('name','CKOM1J5','data',CKOM1J5_W);
% struct('name','CLUFT1E5','data',CLUFT1E5_W);
% struct('name','CMAR1J5','data',CMAR1J5_W);
% struct('name','CMSL1J5','data',CMSL1J5_W);
% struct('name','CMTRO1E5','data',CMTRO1E5_W);
% struct('name','CNEC1J5','data',CNEC1J5_W);
% struct('name','CNIPY1J5','data',CNIPY1J5_W);
% struct('name','CRWE1E5','data',CRWE1E5_W);
% struct('name','CSIEM1E5','data',CSIEM1E5_W);
% struct('name','CSNE1J5','data',CSNE1J5_W);
% struct('name','CSOF1J5','data',CSOF1J5_W);
% struct('name','CSUMI1J5','data',CSUMI1J5_W);
% struct('name','CT370372','data',CT370372_W);
% struct('name','CTELP1J5','data',CTELP1J5_W);
% struct('name','CTHYS1E5','data',CTHYS1E5_W);
% struct('name','CVW1E5','data',CVW1E5_W);
struct('name','CYAMA1J5','data',CYAMA1J5_W);   
];
N=1;
testData=weeklyData;
show=1;
save=1;
if save>0
    mkdir pics
end

testResult=[];
for k=1:size(testData,1)
    name=testData(k).name;
    data=testData(k).data;
    result=struct('name',name);
    for i=1:N
        [date0, cds0]=convertCDSData(data);
        [date1, S, I, R, D]=convertSIRDData(SIRD);
        [date2, RR, GP, PA, TS, WP, RE]=convertMobilityData(MOBILITY);
%         [datex, cdsx, paramx]=combineData(date0, cds0, date1, [I,R,D]);
        [datex, cdsx, paramx]=combineData2(date0, cds0, date1, [I,R,D], date2, [RR, GP, PA, TS, WP, RE]);
        
        [bx,cdsx_hat,Rx,Rx_Adjust]=myArn(cdsx,i,1);
        [bxP,cdsxP_hat,RxP,RxP_Adjust]=myArnParams(cdsx,i,paramx(:,1:3),1);
        [bxE,cdsxE_hat,RxE,RxE_Adjust]=myArnParams(cdsx,i, paramx,1);

        if save>0 || show>0
            figure;
%             plot(datex, cdsx, '-b' , datex, cdsx_hat, '-r' , datex, cdsxP_hat, '-g', datex, cdsxE_hat, '-k')
%             legend('CDS price',['CDS-ARn   (R^2=',num2str(Rx_Adjust,'%.3f'),')'],['CDS-SIRD (R^2=',num2str(RxP_Adjust,'%.3f'),')'],['CDS-MOBI (R^2=',num2str(RxE_Adjust,'%.3f'),')'])
            plot(datex, cdsx, '-b' , datex, cdsxP_hat, '-g','DatetimeTickFormat','yyyy/MM');
            hold on
            legend('CDS price',['CDS-Model2 (R^2=',num2str(RxP_Adjust,'%.3f'),')'])
            title([name]);
            if save>0
                saveas(gca,['./pics/Model2_',name,'.png']);
            end
            if show==0
                close
            end
        end
        fprintf('%10s, %.2f, %.2f, %.2f, %.2f, %.2f, %.2f\n', name, RxP_Adjust, bxP(1), bxP(2), bxP(3), bxP(4), bxP(5));


        
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


