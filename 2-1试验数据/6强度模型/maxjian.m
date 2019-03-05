
for theta = 15:15:90
h1=ezplot(strcat('tan(pi/4+y/180*pi)-((cos(y/180*pi)-x*sin(y/180*pi))^2+(cot(',int2str(theta),'/180*pi))^2)/((1-x*x)*sin(y/180*pi)*cos(y/180*pi)+x-2*x*sin(y/180*pi)*sin(y/180*pi))'),[0,1],[0,50])  %最大剪应力
set(h1,'linestyle',':','color','b')
hold on
end