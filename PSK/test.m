%%
%任意进制PSK星座图绘制
clear
M=32;                            %MPSK进制数选择
flag=0;                         %判决方式选择
k=log2(M);
sigma=sqrt(0.0001);                 %噪声方差
SNR=10*log10((1/k)/(2*sigma^2));
L=10000;
table=generateGrayCode(k);      %码表生成
an=randi([0,1],1,L*k);          %信源序列
source=grayEncoder(an,k,table); %格雷码映射
MPSK=pskmod(source,M);          %PSK调制
MPSK=awgn(MPSK,SNR);            %通过AWGN信道
result=decision(MPSK,M,flag);   %判决
[bitError,symbolError]=getErrorRate(result,an,source,table);
%星座图
scatterplot(MPSK)
xlabel(['$cos(2\pi f_{c}t)$'],'interpreter','latex')
ylabel(['$-sin(2\pi f_{c}t)$'],'interpreter','latex')
title([num2str(M),'PSK星座图'])
%%
%M>4时任意进制误码率及误比特率测试
clear
close all
M=32;
k=log2(M);
L=100000;
table=generateGrayCode(k);
flag=0;
BOTTOM=0;
TOP=20;
bitError=zeros(1,TOP-BOTTOM+1);
symbolError=bitError;
i=1;
for SNR=BOTTOM:1:TOP
    an=randi([0,1],1,L*k);
    source=grayEncoder(an,k,table);
    MPSK=pskmod(source,M);
    MPSK=awgn(MPSK,SNR);
    result=decision(MPSK,M,flag);
    [bitError(i),symbolError(i)]=getErrorRate(result,an,source,table);
    i=i+1;
end
%绘制误码率曲线
figure
SNR=BOTTOM:1:TOP;
semilogy(SNR-10*log10(k),symbolError,'Marker','*')
hold on;
SNR=BOTTOM:0.1:TOP;
EbN0=10.^(SNR/10)/k;
EsN0=10.^(SNR/10);
theory=2*qfunc(sqrt(2*EsN0)*sin(pi/M));
semilogy(10*log10(EbN0),theory)
legend('实测值','理论值');
title([num2str(M),'PSK 误符号率'])
ylabel(['$P_{M}$'],'interpreter','latex')
xlabel(['$\frac{E_b}{N_0}/dB$'],'interpreter','latex')
%绘制误比特率曲线
figure
SNR=BOTTOM:1:TOP;
semilogy(SNR-10*log10(k),bitError,'Marker','*')
hold on;
SNR=BOTTOM:0.1:TOP;
EbN0=10.^(SNR/10)/k;
EsN0=10.^(SNR/10);
theory=2*qfunc(sqrt(2*EsN0)*sin(pi/M))/k;
semilogy(10*log10(EbN0),theory)
legend('实测值','理论值');
title([num2str(M),'PSK 误比特率'])
ylabel(['$P_{b}$'],'interpreter','latex')
xlabel(['$\frac{E_b}{N_0}/dB$'],'interpreter','latex')