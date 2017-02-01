% numerical BH data for steel in SI units

B=[0 0.061 0.089 .132 .194 .284 .416 .603 .857 1.177 1.520 1.800 1.952 1.999 2.009 2.014 2.020];
H=[0 48 71 105 155 228 336 494 729 1074 1582 2331 3436 5063 7460 10994 16201];

% plot (H,B)

semilogx(H,B)

%xlabel("H (A.t/m)")
%ylabel("B (T)")


grid on
axis off

print -demf numericalBHdata.emf
print -deps numericalBHdata.eps
print -mono numericalBHdata.pdf

