h1=ezplot('tan(pi/4+y/180*pi)-((cos(y/180*pi)).^2+(cot(x/180*pi)).^2)/(sin(y/180*pi)*cos(y/180*pi))',[0,90])%最大剪应力c=0
set(h1,'linestyle',':','color','b')
hold on
h2=ezplot('tan(pi/4+y/180*pi)-((cos(y/180*pi)-sin(y/180*pi)).^2+(cot(x/180*pi)).^2)/(1-2*(sin(y/180*pi)).^2)',[0,90],[0,45])%最大剪应力c=1
set(h2,'linestyle',':','color','b')
hold on
h3=ezplot('sin(x/180*pi)*sin(x/180*pi)*(1+3*cos(y/180*pi)*cos(y/180*pi))+3*cos(x/180*pi)*cos(x/180*pi)-2*tan(pi/4+y/180*pi)*sin(x/180*pi)*sin(x/180*pi)*sin(y/180*pi)*cos(y/180*pi)',[0,90])%von mises c=0
set(h3, 'linestyle','--','color','m')
hold on
h4=ezplot('3+sin(x/180*pi)*sin(x/180*pi)-4*sin(x/180*pi)*sin(x/180*pi)*sin(y/180*pi)*cos(y/180*pi)+tan(pi/4+y/180*pi)*(2*sin(x/180*pi)*sin(x/180*pi)*(sin(y/180*pi)*sin(y/180*pi)-cos(y/180*pi)*cos(y/180*pi)))',[0,90],[0,45])%von mises c=1
set(h4, 'linestyle','--','color','m')
hold on
% x1=0:1:90
% y1=45/180*pi
% % y2=67.5
plot([0,90],[45,45],'k')
hold on
plot([0,90],[67.5,67.5],'k')