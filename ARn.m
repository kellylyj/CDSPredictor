clc
clear all
close all
yn = sin([1:300]') + 0.5*randn(300,1);
y = iddata(yn);
mb = ar(y,4,'ls');
mfb = ar(y,4);
%bode(mb,mfb)

t=zeros(300,1);
t(1)= 5;
t(2) =3;
for i = 3 : size(t,1)
  %t(i) = 5+t(i-1)-0.8*t(i-2)+0.05*randn(1,1);  
  t(i) = 5+t(i-1)-0.8*t(i-2)+0.005*randn(1,1); 
end

[b,t_hat,R2]=myArn(t,2)

t2 = zeros(size(t));
for i = 1 : size(t,1)
   t2(i)=t(size(t,1)+1-i); 
end

%tic;[a1,~] = AR(sin(0:pi/100:pi)',5);toc
[a2,~] = aryule(t2,2)
mb = ar(t2,2,'ls')
% tn-T*a2'

