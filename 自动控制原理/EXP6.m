%%
%课本4.7
clear
close all
G=tf([1 2],[1 8 34 72 81])
figure
pzmap(G)
figure
rlocus(G)
%%
%PID控制的分析
clear
close all
syms s K1 Kp Kd Ki
Kp=1;
Kd=0.25;
Ki=1.5;
K1=1;
G=(Kp+Kd*s+Ki/s)*(K1/(s*(s+2)));
%G=simplify(G);
%pretty(G)
G=tf([K1*Kd K1*Kp K1*Ki],[1 2 0 0])
rlocus(G)
title('P Root Locus')
%%
%课本4.8
G=zpk([-0.5],[0 0 -2 -5],2)
rlocus(G)