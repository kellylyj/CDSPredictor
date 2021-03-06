clear all
close all
clc

load('CDS.mat');

weeklyData=[
struct('name','CACOM1J5','data',CACOM1J5_W,'err',718.396733,'beta',[0.1627,-0.4126,-3.4000,192.9550],'mu',[-0.0360,0.0250,-0.1590,0.5541],'r',0.083,'delta',0.235,'XT',-0.135,'T',52);
struct('name','CBCI1E5','data',CBCI1E5_W,'err',13668.063938,'beta',[0.2050,-3.3780,-7.7230,419.5026],'mu',[-8.4221,2.8316,0.7120,-0.0000],'r',0.030,'delta',0.507,'XT',-0.143,'T',52);
struct('name','CBMW1E5','data',CBMW1E5_W,'err',5548.037476,'beta',[0.1900,-2.6995,-8.2030,448.2796],'mu',[-0.0785,0.0554,-1.7449,2.0836],'r',0.035,'delta',0.684,'XT',-0.174,'T',52);
struct('name','CBNP1E5','data',CBNP1E5_W,'err',1285.215465,'beta',[0.1700,-0.7360,-4.7700,248.8980],'mu',[-2.9010,0.9565,0.1870,0.0020],'r',0.113,'delta',0.552,'XT',-0.165,'T',52);
struct('name','CBSH1E5','data',CBSH1E5_W,'err',2018.741306,'beta',[0.1750,0.0560,-3.3780,168.1690],'mu',[-0.0450,0.0200,-0.1050,1.2400],'r',0.125,'delta',0.420,'XT',-0.159,'T',52);
struct('name','CCITO1J5','data',CCITO1J5_W,'err',5811.475140,'beta',[0.1550,-2.7115,0.5850,2.0704],'mu',[0.5933,0.1044,-0.8740,-0.0481],'r',-0.013,'delta',0.743,'XT',0.441,'T',52);
struct('name','CCJAP1J5','data',CCJAP1J5_W,'err',82.423695,'beta',[0.1450,-1.5730,-0.8250,57.4240],'mu',[-0.0490,0.0060,0.1800,-0.0815],'r',0.030,'delta',0.211,'XT',0.000,'T',52);
struct('name','CCNON1J5','data',CCNON1J5_W,'err',129.492351,'beta',[0.1450,-2.0500,-1.2590,85.7569],'mu',[-0.0400,0.0020,0.1650,-0.0800],'r',0.030,'delta',0.330,'XT',0.000,'T',52);
struct('name','CCONT1E5','data',CCONT1E5_W,'err',7517.623261,'beta',[0.2190,0.0530,-3.0810,150.8424],'mu',[-0.6170,0.1570,0.1930,-0.0080],'r',0.149,'delta',0.119,'XT',-0.226,'T',52);
struct('name','CEDF1E5','data',CEDF1E5_W,'err',2144.697875,'beta',[0.1750,-4.2320,-1.5920,126.1483],'mu',[-0.0200,0.0025,0.0900,0.6440],'r',0.030,'delta',0.403,'XT',0.000,'T',52);
struct('name','CFTEL1E5','data',CFTEL1E5_W,'err',857.771042,'beta',[0.1550,-0.4380,-2.2050,142.8434],'mu',[-0.0400,0.0085,0.0550,0.7970],'r',0.092,'delta',-0.184,'XT',-0.083,'T',52);
struct('name','CHEI1E5','data',CHEI1E5_W,'err',9258.554371,'beta',[0.2050,-0.4000,-3.9050,201.9790],'mu',[-0.3805,0.1317,0.2330,1.7050],'r',0.128,'delta',0.216,'XT',-0.197,'T',52);
struct('name','CJFE1J5','data',CJFE1J5_W,'err',4728.420556,'beta',[0.1930,0.0910,-2.4300,126.3740],'mu',[-0.6085,0.1728,0.0700,-0.0260],'r',0.117,'delta',-0.972,'XT',-0.202,'T',52);
struct('name','CJPM1U5','data',CJPM1U5_W,'err',8645.327601,'beta',[0.1840,-0.0810,-2.6060,130.4080],'mu',[-3.0470,0.9955,0.1847,-0.0090],'r',0.148,'delta',0.234,'XT',-0.166,'T',52);
struct('name','CJTOB1J5','data',CJTOB1J5_W,'err',336.963180,'beta',[0.1490,-0.5050,-3.9370,215.4286],'mu',[0.1244,-0.1610,0.3090,-0.0800],'r',0.084,'delta',0.480,'XT',-0.158,'T',52);
struct('name','CKNEL1J5','data',CKNEL1J5_W,'err',62.181048,'beta',[0.1520,-1.7350,-1.3240,87.3458],'mu',[-0.0840,0.0380,0.1100,0.2020],'r',0.030,'delta',0.400,'XT',0.004,'T',52);
struct('name','CKOM1J5','data',CKOM1J5_W,'err',639.749276,'beta',[0.1530,-0.2440,-4.0520,224.7400],'mu',[-6.1040,1.7010,0.2020,-0.0030],'r',0.068,'delta',-0.259,'XT',-0.163,'T',52);
struct('name','CLUFT1E5','data',CLUFT1E5_W,'err',166087.129785,'beta',[0.2460,-3.4790,-1.1070,109.4510],'mu',[-0.0700,0.0040,0.1660,0.3760],'r',0.030,'delta',0.381,'XT',-0.003,'T',52);
struct('name','CMAR1J5','data',CMAR1J5_W, 'err',16479.437021,'beta',[0.1740,-4.1680,-1.0630,81.0824],'mu',[-0.1440,0.0010,0.1440,-0.0070],'r',0.030,'delta',0.369,'XT',0.109,'T',52);
struct('name','CMSL1J5','data',CMSL1J5_W,'err',23039.521806,'beta',[0.2640,0.0700,-3.4160,174.4240],'mu',[0.0250,-0.1890,0.4120,-0.0840],'r',0.048,'delta',0.117,'XT',-0.271,'T',52);
struct('name','CMTRO1E5','data',CMTRO1E5_W,'err',21834.523988,'beta',[0.2260,-4.3600,-8.2160,455.7920],'mu',[-14.5940,4.6290,2.7300,0.0000],'r',0.030,'delta',0.440,'XT',-0.205,'T',52);
struct('name','CNEC1J5','data',CNEC1J5_W,'err',695.117833,'beta',[0.1910,-0.2380,-3.8850,211.6470],'mu',[-0.1240,-0.0020,0.2070,0.1620],'r',0.052,'delta',0.482,'XT',-0.193,'T',52);
struct('name','CNIPY1J5','data',CNIPY1J5_W,'err',13627.469971,'beta',[0.2200,0.0770,-3.2080,163.2390],'mu',[-3.5500,1.0750,0.1390,0.0770],'r',0.064,'delta',-2.996,'XT',-0.243,'T',52);
struct('name','CRWE1E5','data',CRWE1E5_W,'err',558.498847,'beta',[0.1490,-1.9640,-3.6720,209.5030],'mu',[-2.2340,0.6350,-0.0000,-0.7980],'r',0.050,'delta',0.353,'XT',-0.018,'T',52);
struct('name','CSIEM1E5','data',CSIEM1E5_W,'err',561.342712,'beta',[0.1460,-0.8350,-3.9880,227.9820],'mu',[-3.2800,0.8690,0.0910,0.0010],'r',0.060,'delta',-0.568,'XT',-0.157,'T',52);
struct('name','CSNE1J5','data',CSNE1J5_W,'err',700.941590,'beta',[0.1810,-0.2910,-4.8650,257.0210],'mu',[-10.8230,3.1890,0.3040,0.0000],'r',0.042,'delta',-0.176,'XT',-0.205,'T',52);
struct('name','CSOF1J5','data',CSOF1J5_W,'err',35410.260700,'beta',[0.2550,-0.0810,-4.1470,226.2370],'mu',[-13.8440,4.6720,0.0800,-0.0040],'r',0.038,'delta',-1.707,'XT',-0.261,'T',52);
struct('name','CSUMI1J5','data',CSUMI1J5_W,'err',5491.223060,'beta',[0.1560,-5.1100,-0.7040,80.4880],'mu',[-0.0700,0.0020,0.0700,0.0110],'r',0.030,'delta',0.258,'XT',0.064,'T',52);
struct('name','CT370372','data',CT370372_W,'err',2501.767354,'beta',[0.1680,-0.6840,-1.9250,68.6420],'mu',[-0.0440,0.0000,0.1240,0.3560],'r',0.078,'delta',0.312,'XT',0.135,'T',52);
struct('name','CTELP1J5','data',CTELP1J5_W,'err',429.157540,'beta',[0.1780,-0.4710,-1.9780,129.6760],'mu',[-0.0600,-0.0020,0.2120,0.4440],'r',0.052,'delta',0.162,'XT',-0.094,'T',52);
struct('name','CTHYS1E5','data',CTHYS1E5_W,'err',234401.226600,'beta',[0.2670,0.9110,-3.7680,186.3830],'mu',[-8.8420,3.2740,0.1740,-0.1470],'r',0.095,'delta',-0.218,'XT',-0.249,'T',52);
struct('name','CVW1E5','data',CVW1E5_W,'err',11092.668051,'beta',[0.2100,-0.3750,-4.1150,209.8370],'mu',[-1.9570,0.5730,0.4220,0.0000],'r',0.130,'delta',0.238,'XT',-0.216,'T',52);
struct('name','CYAMA1J5','data',CYAMA1J5_W,'err',925.361221,'beta',[0.1700,-2.4630,-1.7290,113.3100],'mu',[-0.0820,0.0200,0.1170,-0.0640],'r',0.030,'delta',0.427,'XT',0.004,'T',52); 
];

weeklyDataEsitmate=[
%struct('name','CACOM1J5','data',CACOM1J5_W,'err',8828.062161,'beta',[0.1447,-0.0296,-3.2480,191.9050],'mu',[-0.0340,0.0250,-0.1750,0.5711],'r',0.048,'delta',0.156,'XT',-0.092,'T',52);
% % % % % % struct('name','CBCI1E5','data',CBCI1E5_W,'err',22072.702181,'beta',[0.2050,-4.6650,-2.0350,139.8000],'mu',[0.0100,0.1206,0.3950,0.5200],'r',0.030,'delta',0.400,'XT',0.000,'T',52);
% % % % % % struct('name','CBMW1E5','data',CBMW1E5_W,'err',12118.670778,'beta',[0.1900,-6.4475,-2.0750,167.3000],'mu',[0.0075,0.1444,0.1081,0.2206],'r',0.030,'delta',0.400,'XT',0.000,'T',52);
% struct('name','CBNP1E5','data',CBNP1E5_W, 'err',3459.590409,'beta',[0.1700,-3.3100,-2.5380,153.5800],'mu',[-1.2090,0.9565,0.1950,0.0020],'r',0.030,'delta',0.400,'XT',0.000,'T',52);
% % % % % % struct('name','CBSH1E5','data',CBSH1E5_W,'err',4796.757441,'beta',[0.1750,-3.2950,-1.8050,121.1000],'mu',[-0.0450,0.0200,0.1800,0.6500],'r',0.030,'delta',0.400,'XT',0.000,'T',52);
% % % % % % struct('name','CCITO1J5','data',CCITO1J5_W,'err',7129.494485,'beta',[0.1550,-4.8825,-0.3800,61.4000],'mu',[0.7188,0.1044,-0.8450,-0.0481],'r',0.030,'delta',0.400,'XT',0.000,'T',52);
% struct('name','CCJAP1J5','data',CCJAP1J5_W,'err',92.006913,'beta',[0.1450,-1.8130,-0.7910,58.7400],'mu',[-0.0450,0.0060,0.2020,0.6545],'r',0.030,'delta',0.213,'XT',0.000,'T',52);
%struct('name','CCJAP1J5','data',CCJAP1J5_W,'err',276.129837,'beta',[0.1480,0.3200,-0.3750,12.1860],'mu',[-0.1710,0.0050,0.1580,-0.0805],'r',0.030,'delta',-0.225,'XT',0.013,'T',52);
%struct('name','CCNON1J5','data',CCNON1J5_W,'err',139.905979,'beta',[0.1450,-2.2340,-1.2440,86.9250],'mu',[-0.0400,0.0060,0.1820,0.6650],'r',0.030,'delta',0.331,'XT',0.000,'T',52);
% % % % % % struct('name','CCONT1E5','data',CCONT1E5_W,'err',44897.306106,'beta',[0.2050,-4.6350,-1.8100,128.3000],'mu',[0.0900,0.1500,0.2000,-0.0450],'r',0.030,'delta',0.400,'XT',0.000,'T',52);
%struct('name','CEDF1E5','data',CEDF1E5_W,'err',2145.287255,'beta',[0.1750,-4.2190,-1.5900,125.8270],'mu',[-0.0200,0.0025,0.0900,0.6440],'r',0.030,'delta',0.402,'XT',0.000,'T',52);
%struct('name','CFTEL1E5','data',CFTEL1E5_W,'err',857.771043,'beta',[0.1550,-0.4380,-2.2050,142.8440],'mu',[-0.0400,0.0085,0.0550,0.7970],'r',0.092,'delta',-0.184,'XT',-0.083,'T',52);
% % % % % % struct('name','CHEI1E5','data',CHEI1E5_W,'err',24812.725326,'beta',[0.2050,-5.0100,-1.5650,126.5000],'mu',[0.1675,0.1237,0.0700,0.1950],'r',0.030,'delta',0.400,'XT',0.000,'T',52);
% % % % % % struct('name','CJFE1J5','data',CJFE1J5_W,'err',19323.613041,'beta',[0.1800,-4.6250,-1.4350,118.6000],'mu',[0.1225,0.1288,0.0700,-0.0000],'r',0.030,'delta',0.400,'XT',0.000,'T',52);
% % % % % % struct('name','CJPM1U5','data',CJPM1U5_W,'err',14054.799909,'beta',[0.1800,-2.9300,-1.9550,118.7000],'mu',[-0.1950,0.9625,0.1837,-0.0000],'r',0.030,'delta',0.400,'XT',0.000,'T',52);
%struct('name','CJTOB1J5','data',CJTOB1J5_W,'err',338.639299,'beta',[0.1490,-0.4910,-3.9320,215.2180],'mu',[0.1250,-0.1610,0.3090,-0.0800],'r',0.084,'delta',0.478,'XT',-0.158,'T',52);
%struct('name','CKNEL1J5','data',CKNEL1J5_W,'err',65.091600,'beta',[0.1520,-1.7690,-1.3240,87.8470],'mu',[-0.0840,0.0380,0.1100,-0.0660],'r',0.030,'delta',0.400,'XT',0.004,'T',52);
%struct('name','CKOM1J5','data',CKOM1J5_W,'err',639.749276,'beta',[0.1530,-0.2440,-4.0520,224.7400],'mu',[-6.1040,1.7010,0.2020,-0.0030],'r',0.068,'delta',-0.259,'XT',-0.163,'T',52);
% % % % % % struct('name','CLUFT1E5','data',CLUFT1E5_W,'err',167838.884712,'beta',[0.2460,-3.6100,-1.2420,117.9000],'mu',[-0.0700,0.0040,0.1660,0.3760],'r',0.030,'delta',0.426,'XT',-0.003,'T',52);
% % % % % % struct('name','CMAR1J5','data',CMAR1J5_W,'err',16540.106568,'beta',[0.1740,-4.4460,-1.2780,96.3800],'mu',[-0.1440,0.0010,0.1440,-0.0070],'r',0.030,'delta',0.370,'XT',0.088,'T',52);
% % % % % % struct('name','CMSL1J5','data',CMSL1J5_W,'err',23376.346348,'beta',[0.2640,0.0120,-3.4920,181.1700],'mu',[0.0250,-0.1890,0.4120,-0.0840],'r',0.048,'delta',0.186,'XT',-0.270,'T',52);
% % % % % % struct('name','CMTRO1E5','data',CMTRO1E5_W,'err',56052.739609,'beta',[0.2260,-6.0520,-2.1900,166.9000],'mu',[0.1740,0.1130,1.3820,-0.0560],'r',0.030,'delta',0.500,'XT',-0.050,'T',52);
%struct('name','CNEC1J5','data',CNEC1J5_W,'err',695.117833,'beta',[0.1910,-0.2380,-3.8850,211.6470],'mu',[-0.1240,-0.0020,0.2070,0.1620],'r',0.052,'delta',0.482,'XT',-0.193,'T',52);
% % % % % % struct('name','CNIPY1J5','data',CNIPY1J5_W,'err',14489.269361,'beta',[0.2200,0.0240,-4.1190,213.1700],'mu',[-3.5540,1.0750,0.1670,-0.0640],'r',0.064,'delta',-1.154,'XT',-0.242,'T',52);
%struct('name','CRWE1E5','data',CRWE1E5_W,'err',558.498847,'beta',[0.1490,-1.9640,-3.6720,209.5030],'mu',[-2.2340,0.6350,-0.0000,-0.7980],'r',0.050,'delta',0.353,'XT',-0.018,'T',52);
%struct('name','CSIEM1E5','data',CSIEM1E5_W,'err',561.342712,'beta',[0.1460,-0.8350,-3.9880,227.9820],'mu',[-3.2800,0.8690,0.0910,0.0010],'r',0.060,'delta',-0.568,'XT',-0.157,'T',52);
%struct('name','CSNE1J5','data',CSNE1J5_W,'err',700.941590,'beta',[0.1810,-0.2910,-4.8650,257.0210],'mu',[-10.8230,3.1890,0.3040,0.0000],'r',0.042,'delta',-0.176,'XT',-0.205,'T',52);
% % % % % % struct('name','CSOF1J5','data',CSOF1J5_W,'err',35416.523096,'beta',[0.2550,-0.0860,-4.1430,226.2400],'mu',[-13.8440,4.6720,0.0800,0.0050],'r',0.038,'delta',-1.706,'XT',-0.261,'T',52);
% % % % % % struct('name','CSUMI1J5','data',CSUMI1J5_W,'err',5517.559322,'beta',[0.1560,-5.5320,-1.0300,102.9600],'mu',[-0.0700,0.0020,0.0700,0.0110],'r',0.030,'delta',0.326,'XT',0.061,'T',52);
%struct('name','CT370372','data',CT370372_W,'err',2501.767354,'beta',[0.1680,-0.6840,-1.9250,68.6420],'mu',[-0.0440,0.0000,0.1240,0.3560],'r',0.078,'delta',0.312,'XT',0.135,'T',52);
%struct('name','CTELP1J5','data',CTELP1J5_W,'err',4745.526814,'beta',[0.1600,-0.1110,-2.1460,121.0360],'mu',[-0.0600,-0.0020,0.2120,0.4510],'r',0.056,'delta',-0.018,'XT',-0.094,'T',52);
% % % % % struct('name','CTHYS1E5','data',CTHYS1E5_W,'err',431179.574247,'beta',[0.2560,-2.0040,-2.0980,124.1300],'mu',[-1.1360,3.8600,0.1720,-0.0000],'r',0.030,'delta',0.432,'XT',-0.005,'T',52);
% % % % % struct('name','CVW1E5','data',CVW1E5_W,'err',37189.447210,'beta',[0.2100,-4.6560,-1.8400,134.1000],'mu',[-0.0320,0.1160,0.2650,-0.0580],'r',0.030,'delta',0.398,'XT',-0.001,'T',52);
%struct('name','CYAMA1J5','data',CYAMA1J5_W,'err',925.361221,'beta',[0.1700,-2.4630,-1.7290,113.3100],'mu',[-0.0820,0.0200,0.1170,-0.0640],'r',0.030,'delta',0.427,'XT',0.004,'T',52);   
];

estimate=0;

if estimate > 0
    testData=weeklyDataEsitmate;
else
    testData=weeklyData;
end

show=1;
save=1;
test=0;
if save>0
    mkdir pics
end


TIMES=300000;
% TIMES=3;
t=1;
T=52;
delta=0.4;
r=0.03;
beta=[0.190,-6.200,-1.310,127.300];
mu=[0.250,0.120,0.190,0.520];
steps=[0.001,0.001,0.001,0.001, 0.001,0.001,0.001,0.001, 0.001, 0.001, 0.001, 0];
STEP=[20,100,100,50,           20,50,50,50,             10, 20, 20, 50];
% steps=[0.008,0.008,0.008,0.064, 0.008,0.008,0.008,0.008, 0.008, 0.008, 0.008, 0];
% STEP=[1000,1000,1000,10000,           10000,1000,1000,1000,             1000, 1000, 1000, 1000];
XT=0;

testResult=[];
for k=1:size(testData,1)
    name=testData(k).name;
    data=testData(k).data;
    result=struct('name',name);
    fprintf('testResult k=%d, name=%s, start\n',k,name);
    [date0, cds0]=convertCDSData(data);
    [date1, S, I, R, D]=convertSIRDData(SIRD);
    [date2, RR, GP, PA, TS, WP, RE]=convertMobilityData(MOBILITY);

    if estimate > 0
        [date0, cds0]=estimateCDS(date0, cds0, T);
        [date1, S, I, R, D]=estimateIRD(date1, S, I, R, D, T*7+7);
    end

    [datex, cdsx, paramx]=combineData(date0, cds0, date1, [I,R,D]);
%   [datex, cdsx, paramx]=combineData2(date0, cds0, date1, [I,R,D], date2, [RR, GP, PA, TS, WP, RE]);

        
    sird=[ones(size(paramx,1),1), paramx];
    tEnd=length(datex)-T-1;

    index=1:1:tEnd;
    if isfield(testData(k),'beta')
        params=[testData(k).beta,testData(k).mu,testData(k).r,testData(k).delta,testData(k).XT,testData(k).T];
    else
        params=[beta,mu,r,delta,XT,T];
    end
    [paramsP,cdsP,errP, cdsP_R2, cdsP_Adjust, aic, bic]=myDescend(sird,index,cdsx,params,steps,STEP,TIMES);
    dateR=datex(index);
    cdsR=cdsx(index);
    fprintf('testResult k=%d, name=%s, finish!!!\n',k,name);
    if save>0 || show>0
        figure;
        plot(dateR, cdsR, '-b' , dateR, cdsP, '-r','DatetimeTickFormat','yyyy/MM')
        if test > 0
            hold on
            paramsP_t1=paramsP;
            paramsP_t1(2) = paramsP_t1(2)*(test);
            cdsP_t1=myCDS(sird,index,paramsP_t1);
    
            paramsP_t2=paramsP;
            paramsP_t2(3) = paramsP_t2(3)*(test);
            cdsP_t2=myCDS(sird,index,paramsP_t2);

            paramsP_t3=paramsP;
            paramsP_t3(4) = paramsP_t3(4)*(test);
            cdsP_t3=myCDS(sird,index,paramsP_t3);            

            plot(dateR, cdsP_t1, '-m', dateR, cdsP_t2, '-c', dateR, cdsP_t3, '-k');
            legend('CDS price',['CDS-predict (R^2=',num2str(cdsP_R2,'%.3f'),')'],...
                    ['CDS-Predict i*','1.05'], ...
                    ['CDS-Predict r*','1.05'], ...
                    ['CDS-Predict d*','1.05'] ...
                   );
            hold off
        else
            legend('CDS price',['CDS-predict (R^2=',num2str(cdsP_R2,'%.3f'),')']);
        end
        title([name]);
        if save>0
            if test > 0
                saveas(gca,['./pics/Predict_',name,'_test.png']);
            else
                saveas(gca,['./pics/Predict_',name,'.png']);
            end
        end
        if show==0
            close
        end
    end
    result.R2=cdsP_R2;
    result.R2_A=cdsP_Adjust;
       
    if size(testResult)==0
        testResult=[result];
    else
        testResult(k)=result;
    end
end






