clc
clear
A = xlsread('Q890矩形缺口试验汇总','sheet2');
[m,n]=size(A);
Tave=zeros(m,n);% VGI_mono
Lodeave=zeros(m,n);
maxTave = zeros(1,4);
maxLodeave = zeros(1,4);
maxM = zeros(1,4);
for q=1:1:4
   p=4*q-3;
   AccuStrain = A(:,p);
   T = A(:,p+1);
   Lode = A(:,p+2);
 for i=2:1:m
    dep=AccuStrain(i,1)-AccuStrain(i-1,1);% incremental equivalent plastic strain
    integral1=(exp(abs(T(i-1)))+exp(abs(T(i))))/2*dep;
    integral2=(exp(abs(Lode(i-1)))+exp(abs(Lode(i))))/2*dep;
    Tave(i,1)=Tave(i-1,1)+integral1;
    Lodeave(i,1)=Lodeave(i-1,1)+integral2;
 end

 for i=1:1:m
    maxTave(q) = Tave(i);
    maxLodeave(q) = Lodeave(i);
    maxM(q) = i;
    if(isnan(Tave(i+1)))
        break
    end
 end
end
 maxTave
 maxLodeave
 maxM