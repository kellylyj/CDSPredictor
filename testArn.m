clear all
close all
clc

load('CDS.mat');
name='CACOM1J5';
[date0, cds0]=convertCDSData(CBMW1E5_W);
[date1, S, I, R, D]=convertSIRDData(SIRD);
[date2, RR, GP, PA, TS, WP, RE]=convertMobilityData(MOBILITY);
% [datex, cdsx, paramx]=combineData(date0, cds0, date1, [I,R,D]);
[datex, cdsx, paramx]=combineData2(date0, cds0, date1, [I,R,D], date2, [RR, GP, PA, TS, WP, RE]);

n=2;
[bx,cdsx_hat,Rx,Rx_Adjust]=myArn(cdsx,n);
[bxP,cdsxP_hat,RxP,RxP_Adjust]=myArnParams(cdsx,n, paramx(:,1:3));
[bxE,cdsxE_hat,RxE,RxE_Adjust]=myArnParams(cdsx,n, paramx);


diff=cdsx-cdsx_hat;
for i=1:length(cdsx)
   if abs(diff(i)) > 5 
   fprintf('date=%s, cds=%f, hat=%f, diff=%f \n',datex(i), cdsx(i), cdsx_hat(i), diff(i));
   end
end

diffP=cdsx-cdsxP_hat;
for i=1:length(cdsx)
   if abs(diffP(i)) > 5 
   fprintf('date=%s, cds=%f, hatP=%f, diff=%f \n',datex(i), cdsx(i), cdsxP_hat(i), diffP(i));
   end
end

figure;
plot(datex, cdsx, '-b' , datex, cdsx_hat, '-r' , datex, cdsxP_hat, '-g', datex, cdsxE_hat, '-k')
legend('CDS price',['CDS-ARn   (R^2=',num2str(Rx_Adjust,'%.3f'),')'],['CDS-SIRD (R^2=',num2str(RxP_Adjust,'%.3f'),')'],['CDS-MOBI (R^2=',num2str(RxE_Adjust,'%.3f'),')'])
title(name)
saveas(gca,['./pics/',name,'_AR',num2str(n),'.png']);




