function eyeDiagram(T,y,tau)
% ------------------------------------
% 眼图绘制子程序
% T为观察时间，为抽样周期的整数倍
% y为需绘制成眼图的序列
% tau为系统的总延时
% ------------------------------------
figure
n=0:1:T-1;
for i=1+tau:T:length(y)-2*T+1
    plot(n,y(i:(i+T-1)),'Color',[0.9 0.55 0.4])
    hold on;
end
title('眼图')
xlabel('n')
ylabel('信号幅度')
end