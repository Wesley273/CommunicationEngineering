%8阵元均匀线阵方向图，来波方向为0度
clc;
clear;
close all;
N=8;                %阵元数目
distance = 0.5;     %阵元间距
d=0:distance:(N-1)*distance;
theta=[-90:0.01:90];
DOA=[20];                               %各个来波方向，单位为度
w=exp(1i*2*pi*d'.*sin(DOA*pi/180));     %阵元权重因子
w=sum(w,2);                             %各来波求和
A=exp(1i*2*pi*d'.*sin(theta*pi/180));   %遍历每个角度求空间谱
y=w'*A;                                 %注意这里是共轭转
figure
polarplot(theta*pi/180,abs(y)/max(abs(y)))
title('8阵元均匀线阵方向图 θ=20°,50°')