# Brillouin.m plots Brillouin function
# figureOpenCircuitCharacteristicSynchronousMachine

Bn=@(J,y) ((2.*J.+1)./J).*coth((2.*J+1)./J.*y)-1./(2.*J).*coth(y./(2.*J));
J=0.5;
y=0:0.01:3;

hold on
grid off
axis off

plot(y,2.1./3.*Bn(J,y),"color","black")

print -demf figureBrillouin.emf
print  figureBrillouin.pdf
