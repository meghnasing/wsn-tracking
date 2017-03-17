clear all     % to clear all variables
clc           % clear command screen
close all     % close all window
A=200*200;    %M2    Area of overall network
D=60;         %bottle neck zone radius
B=pi*(D)^2;   % Area of bottleneck jone
N=1000;       % No. of nodes
n=2;          % path loss exponent

%losses
alpha11=0.937e-6;
alpha12=0.787e-6;
alpha2=0.0172e-6;
alpha1=0.33e-6;
es=1e-9;
Esleep=30e-6;
Eb=25e3;       % battery energy w
m=[1:2:9];     % No. of path
dm=2;          % optimal hop length

H=960;         % No. of bits to be transmitted
p=[0.01:0.01:0.1];     % duty cycle
rs=H/((A-B)*N/A);
for j=1:5
for i=1:length(p)    
Qx(i) = p(i)* alpha1*(n/(n-1))*rs*(D*(A-B)*((m(j)+1)/2)+((2/3)*pi*(D)^3))+B*dm*(p(i)*rs*(es-alpha12)+(1-p(i))*Esleep);
t(i)=(dm*B*Eb)/Qx(i)
end
if j==1
plot(p,t,'k--o');
end

if j==2
plot(p,t,'k--*');
end

if j==3
plot(p,t,'k--+');
end

if j==4
plot(p,t,'k--<');
end

if j==5
plot(p,t,'k-->');
end

hold on
end
xlabel('Duty Cycle (p)');
ylabel('Lifetime (in sec)');
title('Lifetime for of Gas & Oil WSN')
legend('m=1','m=3','m=5','m=7','m=9');
