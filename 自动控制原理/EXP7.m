%%
%根轨迹校正
clear;
close all;
G=zpk([-0.15],[0 -2 -0.14],1)
%rltool(G)
rlocus(G)
%%
%根轨迹校正结果绘制
G=tf([17.012 17.012*10.1],[1 2 0]);
%figure
%rlocus(G)
sys=G/(1+G);
figure
step(sys)
%K=rlocfind(G)