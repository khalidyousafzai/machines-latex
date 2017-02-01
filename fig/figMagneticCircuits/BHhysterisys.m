# Brillouin function

Bn=@(J,y) ((2.*J.+1)./J).*coth((2.*J+1)./J.*y)-1./(2.*J).*coth(y./(2.*J));

J=0.5;
ylmt=.75;
yhys=0.25;

y=0:0.001:ylmt;

plot(y,Bn(J,y))
hold on

yp=(ylmt.+yhys)./ylmt.*y.*sin(y.*3.142./(2.*ylmt))-yhys;

plot(yp,Bn(J,y),-yp,-Bn(J,y))

ym=yhys.+(ylmt.-yhys)./ylmt.*y.*sin(y.*3.142./(2.*ylmt));
plot(ym,Bn(J,y),-ym,-Bn(J,y))
#------------------------
ylmt=2;
yhys=0.5;

y=0:0.001:ylmt;

plot(y,Bn(J,y))
hold on

yp=(ylmt.+yhys)./ylmt.*y.*sin(y.*3.142./(2.*ylmt))-yhys;

plot(yp,Bn(J,y),-yp,-Bn(J,y))

ym=yhys.+(ylmt.-yhys)./ylmt.*y.*sin(y.*3.142./(2.*ylmt));
plot(ym,Bn(J,y),-ym,-Bn(J,y))


hold off
axis off
grid on
print -demf BHhysterisys.emf
print -mono BHhysterisys.pdf
