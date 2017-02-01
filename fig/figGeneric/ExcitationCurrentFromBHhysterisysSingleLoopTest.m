# Brillouin function
#Excitation Current from BH Brillouin curve
#

clc
clear all
format long

grid off
axis off
hold off

Bn= @(J,x) ((2.*J.+1)./J).*coth((2.*J+1)./J.*x)-1./(2.*J).*coth(x./(2.*J));

J=0.5;
xlmt=2;


risingBn=@(J,x) Bn(J,x)-0.2.*cos(x.*pi./(2.*xlmt)).^2;
fallingBn=@(J,x) Bn(J,x)+0.2.*cos(x.*pi./(2.*xlmt)).^2;

m=-1*xlmt:0.002:xlmt;

kxmax=0.0001;     #locating the peak of fallingBn
for i=m;
if  (fallingBn(J,i)>fallingBn(J,kxmax)) 
kxmax=i;
else
endif;
endfor;

txr= @(J,x)  asin(risingBn(J,x)./risingBn(J,xlmt));
txf=@(J,x)  asin(fallingBn(J,x)./fallingBn(J,kxmax));


hold on
axis on
x=-1*xlmt:0.002:xlmt;

plot(x,risingBn(J,x));
plot(x,fallingBn(J,x));

print -mono ExcitationCurrentSectionBH.pdf
hold off

x=0:0.002:xlmt;
plot(txr(J,x),x,"color","black");

hold on
x=-1*xlmt:0.002:xlmt;
plot(pi-txf(J,x),x,"color","black");

x=-1*xlmt:0.002:0;
plot(2*pi+txr(J,x),x,"color","black");

x=0:0.01:2*pi;
plot (x,2.2.*sin(x));
x=0:0.1:2*pi;
plot (x,0);
print -mono ExcitationCurrentSection.pdf


