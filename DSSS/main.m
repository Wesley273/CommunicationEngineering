%%
%DS-SS��ʾ
clear
symbol=200;   %��Ϣ��Ԫ����
Gp=20;          %��Ƶ����
Fs=8;
PN=sign(PNCode(19,11,Gp*symbol)-0.5); %PN��
PN=rectpulse(PN,Fs); %ÿ��α��Ԫ�ڲ���Fs����
plot(PN);
axis([0 1000 -1.5 1.5]);
title('α���������');
grid on;
figure(2)
x=sign(rand(1,symbol)-0.5);  %��Ϣ���0��1���б��-1��1����
source=rectpulse(x,Fs*Gp);%ÿ����Ԫ�ڲ���Fs*Gp����
plot(source);
axis([0 16000 -1.5 1.5]);
title('��Դ��Ϣ������');
grid on;
figure(3)
gt=source.*PN;
plot(gt);
axis([0 1000 -1.5 1.5]);
title('����������');
grid on;
figure(4);
f0=6000;%�ز�Ƶ��
fs=8*f0;%����Ƶ��
N=fs/f0;
for i=1:Gp*symbol
    AI=2;
    n=0:1/(N-1):1;   %һ���ز������ڲ���N����
    carrier=AI*cos(2*pi*n);
    BPSK((1+(i-1)*N):i*N)=gt((1+(i-1)*N):i*N).*carrier;
end
subplot(3,1,1)
plot(BPSK);
axis([0 200 -2.5 2.5]);
title('BPSK���ƺ�Ĳ���');
grid on;
SNR=10;
r=awgn(BPSK,SNR);%�Ӹ�˹�������γɽ����ź�
for i=1:Gp*symbol
    n=0:1/(N-1):1;   %һ���ز������ڲ���N����
    carrier=cos(2*pi*n);
    demodulate((1+(i-1)*N):i*N)=r((1+(i-1)*N):i*N).*carrier;
end
subplot(3,1,3)
plot(demodulate);
axis([0 200 -2.5 2.5]);
title('BPSK�������');
grid on;
figure(6)
%��ؽ���
despread=demodulate.*PN;
%��ͨ�˲�
wn=1/500;
b=fir1(16,wn);
result=filter(b,1,despread);
plot(result);
axis([0 16000 -1.5 1.5]);
title('�������˲���Ĳ���');
grid on;
for i=1:length(result)
    if result(i)<0
        decision(i)=-1;
    else
        decision(i)=1;
    end
end
%��Դ��Ϣ�����ն˻ָ����Ĳ��εıȽ�
figure(8)
subplot(2,1,1);
plot(source);
axis([0 16000 -1.5 1.5]);
title('��Դ��Ϣ������');
grid on;
subplot(2,1,2);
plot(decision);
axis([0 16000 -1.5 1.5]);
title('�ն˽��յ��Ĳ���');
grid on;
[~,error]=symerr(decision,source);%m��ʾ���������n��ʾ������
%%
%DS-SSϵͳ���ܲ���
clear
figure
for Gp=[3,10,100]
    j=1;
    for SNR=-20:1:20
        symbol=20000;   %��Ϣ��Ԫ����
        Fs=8;
        PN=sign(PNCode(19,11,Gp*symbol)-0.5); %PN��
        PN=rectpulse(PN,Fs); %ÿ��α��Ԫ�ڲ���Fs����
        x=sign(rand(1,symbol)-0.5);  %��Ϣ���0��1���б��-1��1����
        source=rectpulse(x,Fs*Gp);%ÿ����Ԫ�ڲ���Fs*Gp����
        gt=source.*PN;
        f0=6000;%�ز�Ƶ��
        fs=8*f0;%����Ƶ��
        N=fs/f0;
        for i=1:Gp*symbol
            AI=2;
            n=0:1/(N-1):1;   %һ���ز������ڲ���N����
            carrier=AI*cos(2*pi*n);
            BPSK((1+(i-1)*N):i*N)=gt((1+(i-1)*N):i*N).*carrier;
        end
        r=awgn(BPSK,SNR);%�Ӹ�˹�������γɽ����ź�
        for i=1:Gp*symbol
            n=0:1/(N-1):1;   %һ���ز������ڲ���N����
            carrier=cos(2*pi*n);
            demodulate((1+(i-1)*N):i*N)=r((1+(i-1)*N):i*N).*carrier;
        end
        %��ؽ���
        despread=demodulate.*PN;
        %��ͨ�˲�
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
        [~,error(j)]=symerr(decision,source);%m��ʾ���������n��ʾ������
        j=j+1;
    end
    SNR=-20:1:20;
    semilogy(SNR,error,'Marker','*'),hold on,grid on;
end
legend({'$G_{p}=5$','$G_{p}=10$','$G_{p}=20$'},'interpreter','latex')
ylabel(['$P_{b}$'],'interpreter','latex')
xlabel(['$SNR/dB$'],'interpreter','latex')
title('DS-SSϵͳ���ܲ���')