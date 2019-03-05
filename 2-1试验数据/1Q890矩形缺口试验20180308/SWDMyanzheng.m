clc
clear
A = xlsread('SWDM—È÷§','sheet1');
[m,n]=size(A);
VGImono=zeros(m,n);% VGI_mono
AccuStrain = A(:,1);
 T = A(:,2);
 Lode = A(:,3);
	for i=2:1:m
        dep=AccuStrain(i)-AccuStrain(i-1);% incremental equivalent plastic strain
        integral=(exp(0.383*T(i-1)+0.191*Lode(i-1))+exp(0.383*T(i)+0.191*Lode(i)))/2*dep*2.24;
        VGImono=VGImono+integral; 
    end
VGImono    