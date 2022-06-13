% clc
% clear all
% close all

load('CDS.mat');
name='CBMW1E5_W';
[date0, cds0]=convertCDSData(CBMW1E5_W);
[date1, S, I, R, D]=convertSIRDData(SIRD);
[date2, RR, GP, PA, TS, WP, RE]=convertMobilityData(MOBILITY);
[datex, cdsx, paramx]=combineData(date0, cds0, date1, [I,R,D]);
% [datex, cdsx, paramx]=combineData2(date0, cds0, date1, [I,R,D], date2, [RR, GP, PA, TS, WP, RE]);
sird=[ones(size(paramx,1),1), paramx];



t=1;
T=52;
tEnd=length(datex)-T-1;
delta=0.4;
r=0.03;
beta=[0.190,-6.200,-1.310,127.300];
mu=[0.250,0.120,0.190,0.520];
XT=0;

index=1:1:tEnd;
params=[beta,mu,r,delta,XT,T];
steps=[0.01,0.01,0.01,0.01, 0.01,0.01,0.01,0.01, 0, 0, 0, 0];
[paramsP,cdsP,errP, cdsP_R2, cdsP_Adjust]=myDescend(sird,index,cdsx,params,steps,STEP,TIMES);

betaP=paramsP(1:4);
muP=paramsP(5:8);
r=paramsP(9);
delta=paramsP(10);
XT=paramsP(11);
T=paramsP(12);

dateR=datex(index);
cdsR=cdsx(index);

figure;
plot(dateR, cdsR, '-b' , dateR, cdsP, '-r')
legend('CDS price',['CDS-SIRD (R^2=',num2str(cdsP_Adjust,'%.3f'),')'])
title(name)
% saveas(gca,['./pics/',name,'_AR',num2str(n),'.png']);
