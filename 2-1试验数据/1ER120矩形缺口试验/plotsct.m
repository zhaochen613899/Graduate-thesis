clc
clear
A = xlsread('ER120-RN','画散点图练习');
x=A(:,1);
y=A(:,2);
z=A(:,3);
%确定网格坐标（x和y方向的步长均取0.1）
[X,Y]=meshgrid(min(x):0.005:max(x),min(y):0.1:max(y)); 
%在网格点位置插值求Z，注意：不同的插值方法得到的曲线光滑度不同
Z=griddata(x,y,z,X,Y,'v4');
%绘制曲面
figure(1)
surf(X,Y,Z);
shading interp;
colormap(jet);
% view(0, 90);
colorbar;
print(gcf, '-djpeg', 'xyz.jpg'); % save picture
hold on
u=A(:,9);
u=u(~isnan(u));
v=A(:,10);
v=v(~isnan(v));
w=A(:,11);
w=w(~isnan(w));
[U,V]=meshgrid(min(u):0.005:max(u),min(v):0.1:max(v)); 
W=griddata(u,v,w,U,V,'v4');
figure(1)
surf(U,V,W);
shading interp;
colormap(jet);
colorbar;
print(gcf, '-djpeg', 'uvw.jpg');


% scatter3(PEEQ1,T1,LODE1,'k');
% % hold on
% PEEQ2=A(:,5);
% T2=A(:,6);
% LODE2=A(:,7);
% scatter3(PEEQ2,T2,LODE2,'k');
% hold on
% PEEQ3=A(:,9);
% T3=A(:,10);
% LODE3=A(:,11);
% scatter3(PEEQ3,T3,LODE3,'k');
