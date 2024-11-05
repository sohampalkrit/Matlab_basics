wo=1;
h=0.001;
To=2*pi/wo
t=0:h:(To-h);
y=(1.*(t>=0 & t<=pi)+(-1).*(t>=pi & t<=2.*pi))
N=length(y);
co=sum(y)/(N-1);
for n= 1:10
    aa(n) =2*sum(y.*cos(n*wo*t))/(N-1) 
    bb(n) = 2*sum(y.*sin(n*wo*t))/(N-1)
end
cn = sqrt(aa.^2+bb.^2); thetan = atan(-bb./aa);
dn=cn/2;
ang_dn=thetan


