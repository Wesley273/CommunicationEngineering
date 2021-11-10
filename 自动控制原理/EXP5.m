%%
clear
%-----------------------
syms s Kt Td
Kt=0;
Td=0.2;
G1=10/(s*(0.625*s+1));
G2=Kt*s;
G3=1+Td*s;
sys1=G1/(1+G1*G2);
sys=sys1*G3/(1+sys1*G3);
sys=simplify(sys);
pretty(sys)
%%
%-----------------------
Kt=0;
Td=0;
G1=tf([10],[0.625 1 0]);
G2=tf([Kt 0],[1]);
G3=tf([Td 1],[1]);
sys1=feedback(G1,G2);
sys2=series(sys1,G3);
sys=feedback(sys2,1);
step(sys),grid on ,hold on;
%-----------------------
Kt=0.2;
Td=0;
G1=tf([10],[0.625 1 0]);
G2=tf([Kt 0],[1]);
G3=tf([Td 1],[1]);
sys1=feedback(G1,G2);
sys2=series(sys1,G3);
sys=feedback(sys2,1);
step(sys),grid on ,hold on;
%-----------------------
Kt=0;
Td=0.2;
G1=tf([10],[0.625 1 0]);
G2=tf([Kt 0],[1]);
G3=tf([Td 1],[1]);
sys1=feedback(G1,G2);
sys2=series(sys1,G3);
sys=feedback(sys2,1);
step(sys),grid on ,hold on;
%-----------------------
Kt=0.127;
Td=0.127;
G1=tf([10],[0.625 1 0]);
G2=tf([Kt 0],[1]);
G3=tf([Td 1],[1]);
sys1=feedback(G1,G2);
sys2=series(sys1,G3);
sys=feedback(sys2,1);
step(sys),grid on ,hold on;
%-----------------------
Kt=0.2;
Td=0.2;
G1=tf([10],[0.625 1 0]);
G2=tf([Kt 0],[1]);
G3=tf([Td 1],[1]);
sys1=feedback(G1,G2);
sys2=series(sys1,G3);
sys=feedback(sys2,1);
step(sys),grid on ,hold on;
%-----------------------
title('Step Response')
legend('Kt=Td=0','Kt=0.2 Td=0','Kt=0 Td=0.2','Kt=0.127 Td=0.127','Kt=Td=0.2','Location','Southeast')
%%
Kt=0;
Td=0.2;
s1=(-(80*Kt+80*Td+8)+sqrt((80*Kt+80*Td+8)^2-4*5*80))/10
s2=(-(80*Kt+80*Td+8)-sqrt((80*Kt+80*Td+8)^2-4*5*80))/10