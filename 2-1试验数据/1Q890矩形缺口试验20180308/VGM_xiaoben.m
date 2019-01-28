clc
clear
% load time.txt
%Displacement=load('Displacement_GP-3.txt');
T=load('stresstri.txt'); % Effective or Von Mises Stress
AccuStrain=load('AccuStrain.txt'); % Accumulated Equivalent Plastic Strain, LABEL is EPEQ in abaqus
%T=load('T_GP-3.txt');
[m,n]=size(T);
VGImono=zeros(m,n);% VGI_mono

for i=2:1:m
    dep=AccuStrain(i,1)-AccuStrain(i-1,1);% incremental equivalent plastic strain
    integral=(exp(abs(1.5*T(i-1)))+exp(abs(1.5*T(i))))/2*dep;
    VGImono(i,1)=VGImono(i-1,1)+integral; 
end

VGIcrtical=VGImono(m,1)  % VGI_mono_critical
%plot(time(2:m,1),VGImono(2:m,1)) 
%xlabel 'time(s)';
%ylabel 'VGImono';
