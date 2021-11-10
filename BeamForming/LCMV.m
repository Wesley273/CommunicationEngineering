%%
clc; 
close all
clear all; 

N=18;                                     % 用于接收的麦克风的数量
L=500;                                    % 在计算中使用了多少个采样点，暂时定为500个 
thetas=[20];                                % 信号入射角度 
thetai=[-20 30];                          % 干扰入射角度 
n=[0:N-1]';                               % 构造一个一维列矩阵 

vs=exp(-1i*pi*n*sin(thetas/180*pi));       % 信号方向矢量 
vi=exp(-1i*pi*n*sin(thetai/180*pi));       % 干扰方向矢量 
%关于 vs 和 vi 是怎么来的，将在下面介绍。

f=16000;                                  % 信号频率
t=[0:1:L-1]/200;                          % 构造时间变量
SNR=10;                                   % 信噪比 
INR=10;                                   % 干噪比

%构造有用信号 
xs=sqrt(10^(SNR/10))*vs*exp(1i*2*pi*f*t);
%构造干扰信号
xi=sqrt(10^(INR/10)/2)*vi*[randn(length(thetai),L)+1i*randn(length(thetai),L)];
%产生噪声
noise=[randn(N,L)+1i*randn(N,L)]/sqrt(2); 

X=xi+noise;                              % 构造出来的含噪声的接收到的信号
R=X*X'/L;                                % LCMV 方法中的 R 矩阵
W=inv(R)*vs/(vs'*inv(R)*vs);          % 这里直接套用 LCMV 计算公式
theta=90*[-1:0.001:1];                    % 扫描方向范围
A=exp(-1i*pi*n*sin(theta/180*pi));         % 扫描方向矢量 
Y=abs(W'*A);                          % 求不同角度的增益
figure
polarplot(theta*pi/180,20*log10(Y/max(Y)))
rlim([min(20*log10(Y/max(Y))) 0])
title('期望信号来于20°方向')