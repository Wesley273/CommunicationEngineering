function [sample,judge,error]=decision(al,r,A,tau)
% ------------------------------------
% 抽样判决及误比特率计算子程序
% al为发送比特序列
% r为接受滤波器输出
% A为每比特周期内抽样点数
% tau为系统总延时
% ------------------------------------
m=1;
error=0;
for i=(1+tau):A:A*length(al)+tau
    %进行采样
    sample(m)=r(i);
    %进行判决
    if sample(m)>=0
        judge(m)=1;
    else
        judge(m)=0;
    end
    %错判则error数加1
    if judge(m)~=al(m)
        error=error+1;
    end
    m=m+1;
end
error=error/length(al);