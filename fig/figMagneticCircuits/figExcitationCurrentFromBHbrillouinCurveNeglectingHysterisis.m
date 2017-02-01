# Brillouin function
#Excitation Current from BH Brillouin curve
#
clc
clear all
format long


grid off
axis off

Bn=@(J,x) ((2.*J.+1)./J).*coth((2.*J+1)./J.*x)-1./(2.*J).*coth(x./(2.*J));

J=0.5;
xlmt=2;
xhys=0.6;

x=0:0.001:xlmt;

tx=asin(Bn(J,x)./Bn(J,xlmt));

#plot(x,Bn(J,x),"color","black")
hold on

#plots Excitation Current

plot (tx,0.25*x,"color","black","linewidth",1)   #excitation current
plot(pi-tx,0.25*x,"color","black","linewidth",1); 

#axis
plot ([0,0+0.6+pi],[0,0]);            
plot ([0,0],[0.27*xlmt+0.1,0]);
plot ([0,-0.04],[0.25*xlmt,0.25*xlmt]);

%axis ("equal");
%axis off
grid off


print -mono figExcitationCurrentFromBHbrillouinCurveNeglectingHysterisis.pdf
