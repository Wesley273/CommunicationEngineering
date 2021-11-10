%%
%sigma对QPSK星座图影响
clear
M=4;
k=log2(M);
table=generateGrayCode(k);
L=1000;
for i=[0,0.1,0.5,1]
    sigma=sqrt(i);
    SNR=10*log10(1/(2*sigma^2));%这里的SNR为每码元能量
    an=randi([0,1],1,L*k);
    source=grayEncoder(an,k,table);
    MPSK=pskmod(source,M);
    MPSK=awgn(MPSK,SNR);
    %星座图
    constellation(source,MPSK)
    xlabel(['$cos(2\pi f_{c}t)$'],'interpreter','latex')
    ylabel(['$-sin(2\pi f_{c}t)$'],'interpreter','latex')
    title(['QPSK星座图',' 噪声方差 = ',num2str(i)])
end
%%
%相关度量判决下，QPSK在数据点分别为1000，10000，100000时误比特率测试
clear
M=4;
k=log2(M);
table=generateGrayCode(k);
flag=1;
BOTTOM=0;
TOP=13;
DELTA=0.8;
bitError=zeros(1,TOP-BOTTOM+1);
symbolError=bitError;
for L=[1000,10000,100000]
    i=1;
    for SNR=BOTTOM:DELTA:TOP
        an=randi([0,1],1,L*k);
        source=grayEncoder(an,k,table);
        MPSK=pskmod(source,M);
        MPSK=awgn(MPSK,SNR);
        result=decision(MPSK,M,flag);
        [bitError(i),symbolError(i)]=getErrorRate(result,an,source,table);
        i=i+1;
    end
    %绘制误比特率曲线
    figure
    %实测值
    SNR=BOTTOM:DELTA:TOP;
    EbN0=10.^(SNR/10)/k;
    semilogy(10*log10(EbN0),bitError,'Marker','*')
    hold on;
    %理论值
    SNR=BOTTOM:0.01:TOP;
    EbN0=10.^(SNR/10)/k;
    theory=qfunc(sqrt(2*EbN0));
    semilogy(10*log10(EbN0),theory)
    legend('实测值','理论值');
    title(['QPSK误比特率 L = ',num2str(L)])
    ylabel(['$P_{b}$'],'interpreter','latex')
    xlabel(['$\frac{E_b}{N_0}/dB$'],'interpreter','latex')
    grid on;
end
%%
%QPSK在数据点为100000点时，相关度量与最小欧氏距离判决对比
clear
M=4;
k=log2(M);
table=generateGrayCode(k);
BOTTOM=0;
TOP=13;
DELTA=0.8;
bitError=zeros(1,TOP-BOTTOM+1);
symbolError=bitError;
L=100000;
for flag=[1,0]
    if flag==1
        name=['相关度量法'];
    else
        name=['最小欧式距离法'];
    end
    i=1;
    for SNR=BOTTOM:DELTA:TOP
        an=randi([0,1],1,L*k);
        source=grayEncoder(an,k,table);
        MPSK=pskmod(source,M);
        MPSK=awgn(MPSK,SNR);
        result=decision(MPSK,M,flag);
        [bitError(i),symbolError(i)]=getErrorRate(result,an,source,table);
        i=i+1;
    end
    %绘制误比特率曲线
    figure
    %实测值
    SNR=BOTTOM:DELTA:TOP;
    EbN0=10.^(SNR/10)/k;
    semilogy(10*log10(EbN0),bitError,'Marker','*')
    hold on;
    %理论值
    SNR=BOTTOM:0.01:TOP;
    EbN0=10.^(SNR/10)/k;
    theory=qfunc(sqrt(2*EbN0));
    semilogy(10*log10(EbN0),theory)
    legend('实测值','理论值');
    title([name,'QPSK误比特率 L = ',num2str(L)])
    ylabel(['$P_{b}$'],'interpreter','latex')
    xlabel(['$\frac{E_b}{N_0}/dB$'],'interpreter','latex')
    grid on;
end
%%
%8PSK与QPSK在最小欧氏距离法判决，数据点为100000点时对比
clear
figure
%-------------------8PSK-------------------
M=8;
k=log2(M);
L=100000;
table=generateGrayCode(k);
flag=0;
BOTTOM=-3;
TOP=13;
DELTA=0.8;
bitError=zeros(1,TOP-BOTTOM+1);
symbolError=bitError;
i=1;
for SNR=BOTTOM:DELTA:TOP
    an=randi([0,1],1,L*k);
    source=grayEncoder(an,k,table);
    MPSK=pskmod(source,M);
    MPSK=awgn(MPSK,SNR);
    result=decision(MPSK,M,flag);
    [bitError(i),symbolError(i)]=getErrorRate(result,an,source,table);
    i=i+1;
end
%绘制8PSK误码率曲线
%实测值
SNR=BOTTOM:DELTA:TOP;
EbN0=10.^(SNR/10)/k;
EsN0=10.^(SNR/10);
semilogy(10*log10(EbN0),symbolError,'Marker','*')
hold on;
%理论值
SNR=BOTTOM:0.01:TOP;
EbN0=10.^(SNR/10)/k;
EsN0=10.^(SNR/10);
theory=2*qfunc(sqrt(2*EsN0)*sin(pi/M));
semilogy(10*log10(EbN0),theory)
hold on;
%-------------------QPSK-------------------
M=4;
k=log2(M);
table=generateGrayCode(k);
i=1;
for SNR=BOTTOM:DELTA:TOP
    an=randi([0,1],1,L*k);
    source=grayEncoder(an,k,table);
    MPSK=pskmod(source,M);
    MPSK=awgn(MPSK,SNR);
    result=decision(MPSK,M,flag);
    [bitError(i),symbolError(i)]=getErrorRate(result,an,source,table);
    i=i+1;
end
%绘制QPSK误码率曲线
%实测值
SNR=BOTTOM:DELTA:TOP;
EbN0=10.^(SNR/10)/k;
semilogy(10*log10(EbN0),symbolError,'Marker','*')
hold on;
%理论值
SNR=BOTTOM:0.01:TOP;
EbN0=10.^(SNR/10)/k;
EsN0=10.^(SNR/10);
theory=2*qfunc(sqrt(2*EbN0)).*(1-0.5*qfunc(sqrt(2*EbN0)));
semilogy(10*log10(EbN0),theory)
%-------------------图例设置-------------------
legend('8PSK实测值','8PSK理论值','QPSK实测值','QPSK理论值');
title('8PSK与QPSK误符号率对比')
ylabel(['$P_{M}$'],'interpreter','latex')
xlabel(['$\frac{E_b}{N_0}/dB$'],'interpreter','latex')
grid on;