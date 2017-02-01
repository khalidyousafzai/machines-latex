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

Bnk=@(J,x) Bn(J,x)+(Bn(J,xlmt)-Bn(J,x))./(Bn(J,xlmt)).*xhys;
Bnp=@(J,x) Bn(J,x)-(Bn(J,xlmt)-Bn(J,x))./(Bn(J,xlmt)).*xhys;
x=0:0.001:xlmt;

tx=asin(Bn(J,x)./Bn(J,xlmt));
txk=asin(Bnk(J,x)./Bn(J,xlmt));
txp=asin(Bnp(J,x)./Bn(J,xlmt));

#plot(x,Bn(J,x),"color","black")
hold on

#plots BH loop

plot(x,Bnk(J,x),"color","black","linewidth",1,-x,-Bnk(J,x),"color","black","linewidth",1) 
plot(x,Bnp(J,x),"color","black","linewidth",1,-x,-Bnp(J,x),"color","black","linewidth",1)                                                      #this plots hysterisys loop

plot ([-2,2],[0,0]);                                                             #axis
plot ([0,0],[1.1*Bn(J,xlmt)+0.4,-1.1*Bn(J,xlmt)]);

#hold off

#print -demf ExcitationCurrentBHloopOnly.emf 
#print -mono ExcitationCurrentBHloopOnly.pdf

#plots Excitation Current

plot (xshift-txk,-x,"color","black","linewidth",1,xshift-pi+txp,-x,"color","black","linewidth",1,xshift+txp,x,"color","black","linewidth",1,xshift+pi-txk,x,"color","black","linewidth",1)    #excitation current

#axis
plot ([xshift-0.4-pi,xshift+0.6+pi],[0,0]);            
plot ([xshift,xshift],[1.1*Bn(J,xlmt)+0.4,-1.1*Bn(J,xlmt)]);

t=-pi:0.001:pi;                                      #sine wave flux and axis
plot (xshift+t,Bn(J,xlmt)*sin(t),"linewidth",1);


#showing the point along the RISING FLUX
x=1;
tx=asin(Bnp(J,x)./Bn(J,xlmt));

plot ([x,x],[0,Bnp(J,x)]);
plot([x,xshift+tx],[Bnp(J,x),Bnp(J,x)]);
plot([xshift+tx,xshift+tx],[Bnp(J,x),0]);
plot([xshift,xshift+tx,],[x,x]);

#showing the point along the FALLING FLUX
x=0.5;
tx=asin(Bnk(J,x)./Bn(J,xlmt));

plot ([x,x],[0,Bnk(J,x)]);
plot([x,pi+xshift-tx],[Bnk(J,x),Bnk(J,x)]);
plot([pi+xshift-tx,pi+xshift-tx],[Bnk(J,x),0]);
plot([xshift,xshift+pi-tx,],[x,x]);

axis ("equal");
%axis off
grid off


print -mono figExcitationCurrentFromBHbrillouinCurve.pdf
