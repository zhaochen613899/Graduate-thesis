clc
clear
syms c a k;
A = xlsread('ER120-RN.xlsx','matlab-vgm');
[m,n]=size(A);
syms e1 e2 e3 
% sampleNum=623; % 数据取样数

for q=2:1:4
    VGImono=0;
    p=4*q-3;
    AccuStrain = A(:,p);
    dataSize=size(AccuStrain);
    dataRows=0;
    realSamples=0;
	for i=1:1:dataSize(1)
        if isnan(AccuStrain(i))
            break;
        end
        dataRows=i;
    end
%     interval=round(dataRows/sampleNum);
%     AccuStrain = AccuStrain(1:1:end,1);
    for i=1:1:dataSize(1)   
        if isnan(AccuStrain(i))
            break;
        end
        realSamples=i;
    end
	T = A(:,p+1);
%     T = T(1:1:end,1);
	Lode = A(:,p+2);
%     Lode = Lode(1:1:end,1);

	for i=2:1:realSamples
        dep=AccuStrain(i)-AccuStrain(i-1);% incremental equivalent plastic strain
        integral=(exp(a*T(i-1)+k*Lode(i-1))+exp(a*T(i)+k*Lode(i)))/2*dep*c;
        VGImono=VGImono+integral; 
	end
	if q==2
        e1=VGImono-1
	elseif q==3
        e2=VGImono-1
	elseif q==4
        e3=VGImono-1
	end
end

[c,a,k]=solve([e1;e2;e3],'c','a','k');
c
a
k
