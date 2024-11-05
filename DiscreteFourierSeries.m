No=32;
n=0:No-1;
Xn=[ones(1,5) zeros(1,23) ones(1,4)];
for r=0:31,
    dr(r+1) = sum(Xn.*exp(-j*r*2*(pi/No)*n))/No;
end
r=n

