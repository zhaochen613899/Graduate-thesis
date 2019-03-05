h1=ezplot('tan(pi/4+y)-((cos(y)).^2+(cot(x)).^2)/(sin(y)*cos(y))',[0,pi/2])%最大剪应力c=0
set(h1,'linestyle',':','color','b')
hold on
h2=ezplot('tan(pi/4+y)-((cos(y)-sin(y)).^2+(cot(x)).^2)/(1-2*(sin(y)).^2)',[0,pi/2])%最大剪应力c=1
set(h2,'linestyle',':','color','b')
hold on
h3=ezplot('sin(x)*sin(x)*(1+3*cos(y)*cos(y))+3*cos(x)*cos(x)-2*tan(pi/4+y)*sin(x)*sin(x)*sin(y)*cos(y)',[0,pi/2])%von mises c=0
set(h3, 'linestyle','--','color','m')
hold on
h4=ezplot('3+sin(x)*sin(x)-4*sin(x)*sin(x)*sin(y)*cos(y)+tan(pi/4+y)*(2*sin(x)*sin(x)*(sin(y)*sin(y)-cos(y)*cos(y)))',[0,pi/2])%von mises c=1
set(h4, 'linestyle','--','color','m')
plot([0,pi/2],[pi/4,pi/4])
hold on
plot([0,pi/2],[3*pi/8,3*pi/8])