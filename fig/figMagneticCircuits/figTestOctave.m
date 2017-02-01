# Brillouin function
#Excitation Current from BH Brillouin curve
#

clc
clear all
format long

grid off
axis off



Bn=@(J,y) ((2.*J.+1)./J).*coth((2.*J+1)./J.*y)-1./(2.*J).*coth(y./(2.*J));

J=0.5;
ylmt=2;
yhys=0.25;

y=0:0.001:ylmt;


ty=asin(Bn(J,y)./Bn(J,ylmt));

#plot(y,Bn(J,y))
hold on

#plots BH loop

yp=(ylmt.+yhys)./ylmt.*y.*sin(y.*3.142./(2.*ylmt))-yhys;
plot(yp,Bn(J,y),-yp,-Bn(J,y)) 

ym=yhys.+(ylmt.-yhys)./ylmt.*y.*sin(y.*3.142./(2.*ylmt));
plot(ym,Bn(J,y),-ym,-Bn(J,y))                                                      #this plots hysterisys loop

hold off

print -demf ExcitationCurrentBHloopOnly.emf 
print -mono ExcitationCurrentBHloopOnly.pdf
myfile=fopen ('myfile.txt','w');
#fprintf(myfile,'%f,%f\n',y,Bn(J,y));
fprintf(myfile,'%5.3f\n',yp,Bn(J,y));
fclose(myfile);




#plots Excitation Current

plot (-ty,-yp,-pi+ty,-ym,ty,ym,pi-ty,yp)                                   #this plots the excitation curve
axis off
grid off

hold off

print -demf ExcitationCurrent.emf
print -mono ExcitationCurrent.pdf
