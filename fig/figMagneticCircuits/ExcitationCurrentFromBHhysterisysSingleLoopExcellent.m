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
xshift=-8;

x=0:0.001:xlmt;

tx=asin(Bn(J,x)./Bn(J,xlmt));

#plot(x,Bn(J,x),"color","black")
hold on

#plots BH loop

xp=(xlmt.+xhys)./xlmt.*x.*sin(x.*3.142./(2.*xlmt))-xhys;
plot(xp,Bn(J,x),"color","black","linewidth",1,-xp,-Bn(J,x),"color","black","linewidth",1) 

xm=(xlmt.-xhys)./xlmt.*x.*sin(x.*3.142./(2.*xlmt))+xhys;
plot(xm,Bn(J,x),"color","black","linewidth",1,-xm,-Bn(J,x),"color","black","linewidth",1)                                                      #this plots hysterisys loop

plot ([-2,2],[0,0]);                                                             #axis
plot ([0,0],[1.1*Bn(J,xlmt),-1.1*Bn(J,xlmt)]);

#hold off

#print -demf ExcitationCurrentBHloopOnly.emf 
#print -mono ExcitationCurrentBHloopOnly.pdf





#plots Excitation Current

plot (xshift-tx,-xp,"color","black","linewidth",1,xshift-pi+tx,-xm,"color","black","linewidth",1,xshift+tx,xm,"color","black","linewidth",1,xshift+pi-tx,xp,"color","black","linewidth",1)    #excitation current

plot ([xshift-0.2-pi,xshift+0.2+pi],[0,0]);            #x-axis only

t=-pi:0.001:pi;                                      #sine wave flux
plot (xshift+t,Bn(J,xlmt)*sin(t),"linewidth",1);

#showing the point along the RISING FLUX
x=1;
tx=asin(Bn(J,x)./Bn(J,xlmt));
xp=(xlmt.+xhys)./xlmt.*x.*sin(x.*3.142./(2.*xlmt))-xhys;
xm=(xlmt.-xhys)./xlmt.*x.*sin(x.*3.142./(2.*xlmt))+xhys;

plot ([xm,xm],[0,Bn(J,x)]);
plot([xm,xshift+tx],[Bn(J,x),Bn(J,x)]);
plot([xshift+tx,xshift+tx],[Bn(J,x),0]);

#showing the point along the FALLING FLUX
x=0.5;
tx=asin(Bn(J,x)./Bn(J,xlmt));
xp=(xlmt.+xhys)./xlmt.*x.*sin(x.*3.142./(2.*xlmt))-xhys;
xm=(xlmt.-xhys)./xlmt.*x.*sin(x.*3.142./(2.*xlmt))+xhys;

plot ([xp,xp],[0,Bn(J,x)]);
plot([xp,pi+xshift-tx],[Bn(J,x),Bn(J,x)]);
plot([pi+xshift-tx,pi+xshift-tx],[Bn(J,x),xp]);


axis off
grid off


print -demf ExcitationCurrent.emf
print -mono ExcitationCurrent.pdf
