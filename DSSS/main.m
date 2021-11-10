%%
%DS-SS演示
clear
symbol=200;   %信息码元个数
Gp=20;          %扩频增益
Fs=8;
PN=sign(PNCode(19,11,Gp*symbol)-0.5); %PN码
PN=rectpulse(PN,Fs); %每个伪码元内采样Fs个点
plot(PN);
axis([0 1000 -1.5 1.5]);
title('伪随机码序列');
grid on;
figure(2)
x=sign(rand(1,symbol)-0.5);  %信息码从0、1序列变成-1、1序列
source=rectpulse(x,Fs*Gp);%每个码元内采样Fs*Gp个点
plot(source);
axis([0 16000 -1.5 1.5]);
title('信源信息码序列');
grid on;
figure(3)
gt=source.*PN;
plot(gt);
axis([0 1000 -1.5 1.5]);
title('复合码序列');
grid on;
figure(4);
f0=6000;%载波频率
fs=8*f0;%采样频率
N=fs/f0;
for i=1:Gp*symbol
    AI=2;
    n=0:1/(N-1):1;   %一个载波周期内采样N个点
    carrier=AI*cos(2*pi*n);
    BPSK((1+(i-1)*N):i*N)=gt((1+(i-1)*N):i*N).*carrier;
end
subplot(3,1,1)
plot(BPSK);
axis([0 200 -2.5 2.5]);
title('BPSK调制后的波形');
grid on;
SNR=10;
r=awgn(BPSK,SNR);%加高斯白噪声形成接收信号
for i=1:Gp*symbol
    n=0:1/(N-1):1;   %一个载波周期内采样N个点
    carrier=cos(2*pi*n);
    demodulate((1+(i-1)*N):i*N)=r((1+(i-1)*N):i*N).*carrier;
end
subplot(3,1,3)
plot(demodulate);
axis([0 200 -2.5 2.5]);
title('BPSK解调波形');
grid on;
figure(6)
%相关解扩
despread=demodulate.*PN;
%低通滤波
wn=1/500;
b=fir1(16,wn);
result=filter(b,1,despread);
plot(result);
axis([0 16000 -1.5 1.5]);
title('解扩并滤波后的波形');
grid on;
for i=1:length(result)
    if result(i)<0
        decision(i)=-1;
    else
        decision(i)=1;
    end
end
%信源信息码与收端恢复出的波形的比较
figure(8)
subplot(2,1,1);
plot(source);
axis([0 16000 -1.5 1.5]);
title('信源信息码序列');
grid on;
subplot(2,1,2);
plot(decision);
axis([0 16000 -1.5 1.5]);
title('收端接收到的波形');
grid on;
[~,error]=symerr(decision,source);%m表示误码个数，n表示误码率
%%
%DS-SS系统性能测试
clear
figure
for Gp=[3,10,100]
    j=1;
    for SNR=-20:1:20
        symbol=20000;   %信息码元个数
        Fs=8;
        PN=sign(PNCode(19,11,Gp*symbol)-0.5); %PN码
        PN=rectpulse(PN,Fs); %每个伪码元内采样Fs个点
        x=sign(rand(1,symbol)-0.5);  %信息码从0、1序列变成-1、1序列
        source=rectpulse(x,Fs*Gp);%每个码元内采样Fs*Gp个点
        gt=source.*PN;
        f0=6000;%载波频率
        fs=8*f0;%采样频率
        N=fs/f0;
        for i=1:Gp*symbol
            AI=2;
            n=0:1/(N-1):1;   %一个载波周期内采样N个点
            carrier=AI*cos(2*pi*n);
            BPSK((1+(i-1)*N):i*N)=gt((1+(i-1)*N):i*N).*carrier;
        end
        r=awgn(BPSK,SNR);%加高斯白噪声形成接收信号
        for i=1:Gp*symbol
            n=0:1/(N-1):1;   %一个载波周期内采样N个点
            carrier=cos(2*pi*n);
            demodulate((1+(i-1)*N):i*N)=r((1+(i-1)*N):i*N).*carrier;
        end
        %相关解扩
        despread=demodulate.*PN;
        %低通滤波
        wn=1/500;
        b=fir1(16,wn);
        result=filter(b,1,despread);
        for i=1:length(result)
            if result(i)<0
                decision(i)=-1;
            else
                decision(i)=1;
            end
        end
        [~,error(j)]=symerr(decision,source);%m表示误码个数，n表示误码率
        j=j+1;
    end
    SNR=-20:1:20;
    semilogy(SNR,error,'Marker','*'),hold on,grid on;
end
legend({'$G_{p}=5$','$G_{p}=10$','$G_{p}=20$'},'interpreter','latex')
ylabel(['$P_{b}$'],'interpreter','latex')
xlabel(['$SNR/dB$'],'interpreter','latex')
title('DS-SS系统性能测试')