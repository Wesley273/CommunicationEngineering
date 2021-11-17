function [al,hn,d,x,y,r,sample,judge,error]=basebandNoEye(flag,A,B,Tc,Ts,N,a,SNR)
% ------------------------------------
% 基带系统
% flag为系统选择标志，'0'为非匹配型，'1'为匹配型
% A为每码元周期内抽样点数
% B为发送比特数
% Tc为表征升余弦滤波器的频率响应的常数
% Ts为滤波器数字化时的抽样周期
% N为滤波器阶数
% a为滚降因子
% SNR为给定信噪比
% Eb为平均每比特能量
% ------------------------------------
[al,d]=bipolarSource(B,A);
tau=(N-1)/2;
if flag==1
    %匹配滤波型
    hn=rootRaisedCosine(N,a,Ts,Tc);
    x=conv(d,hn);
    %计算平均每比特能量
    Eb=sum(x.*x)/B;
    y=x+gaussianNoise(SNR,Eb,length(x));
    r=conv(y,hn);
    %去除尾部2tau个无用点
    r(length(r)-2*tau+1:length(r))=[];
    %进行抽样判决
    [sample,judge,error]=decision(al,r,A,2*tau);
end
if flag==0
    %非匹配滤波型
    hn=raisedCosine(N,a,Ts,Tc);
    x=conv(d,hn);
    %计算平均每比特能量
    Eb=sum(x.*x)/B;
    %去掉尾部tau个无用点
    x(length(x)-tau+1:length(x))=[];
    y=x+gaussianNoise(SNR,Eb,length(x));
    r=y;
    %进行抽样判决
    [sample,judge,error]=decision(al,r,A,tau);
end
end