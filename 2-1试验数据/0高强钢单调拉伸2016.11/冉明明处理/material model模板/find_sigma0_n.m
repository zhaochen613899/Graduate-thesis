
clc;
clear all;
%输入母材强化段的真实应力-塑性应变值，通过cftool工具拟合得到sigma0和m;
%input data
data=xlsread('input_base_er120.xlsx');
stress_24_1=data(:,2);
strain_24_1=data(:,1);
plot(strain_24_1,stress_24_1,'o');
hold on

% stress_24_1=xlsread('input_base.xlsx',1,'C2:C300');
% strain_24_1=xlsread('input_base.xlsx',1,'B2:B300');
[xData, yData] = prepareCurveData( strain_24_1, stress_24_1 );
% Set up fittype and options.
ft = fittype( 'power1' );
opts = fitoptions( ft );
opts.Display = 'Off';
opts.Lower = [-Inf 0.090];
opts.StartPoint = [1000 0.09];
opts.Upper = [Inf 0.0906];
% Fit model to data.
% [fitresult_24_1, gof] = fit( xData, yData, ft, opts )
fitresult_24_1 = fit( xData, yData, ft, opts )
plot(fitresult_24_1,strain_24_1,stress_24_1)
title 'Fitted curve'
%write to excel

%xlswrite('output_sigma_n.xlsx',[fitresult_24_1],1,'A2');



% stress_24_2=xlsread('input_base.xlsx',1,'F2:F300');
% strain_24_2=xlsread('input_base.xlsx',1,'E2:E300');
% stress_24_3=xlsread('input_base.xlsx',1,'I2:I300');
% strain_24_3=xlsread('input_base.xlsx',1,'H2:H300');
% stress_27_1=xlsread('input_base.xlsx',1,'L2:L300');
% strain_27_1=xlsread('input_base.xlsx',1,'K2:K300');
% stress_27_2=xlsread('input_base.xlsx',1,'O2:O300');
% strain_27_2=xlsread('input_base.xlsx',1,'N2:N300');
% stress_27_3=xlsread('input_base.xlsx',1,'R2:R300');
% strain_27_3=xlsread('input_base.xlsx',1,'Q2:Q300');
% stress_70_1=xlsread('input_base.xlsx',1,'U2:U300');
% strain_70_1=xlsread('input_base.xlsx',1,'T2:T300');
% stress_70_2=xlsread('input_base.xlsx',1,'X2:X300');
% strain_70_2=xlsread('input_base.xlsx',1,'W2:W300');
% stress_70_3=xlsread('input_base.xlsx',1,'AA2:AA300');
% strain_70_3=xlsread('input_base.xlsx',1,'Z2:Z300');
% stress_110_1=xlsread('input_base.xlsx',1,'AD2:AD300');
% strain_110_1=xlsread('input_base.xlsx',1,'AC2:AC300');
% stress_110_2=xlsread('input_base.xlsx',1,'AG2:AG300');
% strain_110_2=xlsread('input_base.xlsx',1,'AF2:AF300');
% stress_110_3=xlsread('input_base.xlsx',1,'AJ2:AJ300');
% strain_110_3=xlsread('input_base.xlsx',1,'AI2:AI300');
% 
% stress_50_1=xlsread('input_weld.xlsx',1,'C2:C300');
% strain_50_1=xlsread('input_weld.xlsx',1,'B2:B300');
% stress_50_2=xlsread('input_weld.xlsx',1,'F2:F300');
% strain_50_2=xlsread('input_weld.xlsx',1,'E2:E300');
% stress_59_1=xlsread('input_weld.xlsx',1,'I2:I300');
% strain_59_1=xlsread('input_weld.xlsx',1,'H2:H300');
% stress_59_2=xlsread('input_weld.xlsx',1,'L2:L300');
% strain_59_2=xlsread('input_weld.xlsx',1,'K2:K300');
% stress_96_1=xlsread('input_weld.xlsx',1,'O2:O300');
% strain_96_1=xlsread('input_weld.xlsx',1,'N2:N300');
% stress_96_2=xlsread('input_weld.xlsx',1,'R2:R300');
% strain_96_2=xlsread('input_weld.xlsx',1,'Q2:Q300');
% stress_1_1=xlsread('input_weld.xlsx',1,'U2:U13894');
% strain_1_1=xlsread('input_weld.xlsx',1,'T2:T13894');
% stress_2_2=xlsread('input_weld.xlsx',1,'X2:X13894');
% strain_2_2=xlsread('input_weld.xlsx',1,'W2:W13894');