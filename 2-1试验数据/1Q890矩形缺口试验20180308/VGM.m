clc
clear
A = xlsread('Q890矩形缺口试验汇总','sheet1');
[m,n]=size(A);
VGImono=zeros(m,n);% VGI_mono
maxVGI = zeros(1,4);
maxM = zeros(1,4);
for q=1:1:4
   p=4*q-3;
   AccuStrain = A(:,p);
   T = A(:,p+1);
 for i=2:1:m
    dep=AccuStrain(i,1)-AccuStrain(i-1,1);% incremental equivalent plastic strain
    integral=(exp(abs(1.5*T(i-1)))+exp(abs(1.5*T(i))))/2*dep;
    VGImono(i,1)=VGImono(i-1,1)+integral; 
 end

 for i=1:1:m
    maxVGI(q) = VGImono(i);
    maxM(q) = i;
    if(isnan(VGImono(i+1)))
        break
    end
 end
end
 maxVGI
 maxM