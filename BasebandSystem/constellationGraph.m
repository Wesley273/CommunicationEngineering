function constellationGraph(al,sample)
% ------------------------------------
% 星座图绘制
% al为发送比特序列
% sample为抽样结果
% ------------------------------------
figure
n=0;
for i=1:1:length(al)
    if al(i)==1
        scatter(sample(i),n,'r','.')
    else
        scatter(sample(i),n,'b','.')
    end
    hold on;
end
title('星座图')
xline(0,'--','linewidth',1);
end