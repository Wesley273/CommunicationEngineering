%%
%频率抽样法设计FIR滤波器
clear
figure
%count和M仅用于绘图
count=1;
M=[20,60];
for N=M
    k=0:1:N-1;
    wp=0.3*pi;
    %朴素设计法
    Np=floor(wp/(2*pi/N));
    Ns=N-2*Np-1;
    Hk=[ones(1,Np+1),zeros(1,Ns),ones(1,Np)];
    %低通滤波器时域序列h(n)满足h(n)=h(N-1-n)
    alpha=(N-1)/2;
    Phi=(-(2*pi*k/N)*((N-1)/2)).*(k>=0&k<=alpha)+0.*(k==N/2)+((2*pi*(N-k)/N)*((N-1)/2)).*(k>=alpha+2&k<=N-1);
    H=Hk.*exp(1i*Phi);
    %对加以相位的Hk作逆变换得到时域序列，再作DTFT完成插值
    hn = real(ifft(H,N));
    [Hw,w]=freqz(hn,1,'whole');
    %绘图
    subplot(length(M),3,count)
    stem(k*2/N,Hk)
    hold on
    plot(w/pi,abs(Hw))
    legend({'$H(k)$','$|H(e^{j\omega})|$'},'interpreter','latex')
    title(['N=',num2str(N),'  抽样与插值'])
    subplot(length(M),3,count+1)
    stem(k,hn)
    title(['N=',num2str(N),'  冲激响应序列'])
    subplot(length(M),3,count+2)
    plot(w/pi,20*log((abs(Hw))))
    title(['N=',num2str(N),'  幅频特性'])
    count=count+3;
end
%%
%频率抽样法设计FIR滤波器，增加过渡带
clear
figure
%m=1时
%设置参数
m=1;
wp=0.3*pi;
ws=0.5*pi;
deltaw=ws-wp;
N=(m+1)*2*pi/deltaw;
k=0:1:N-1;
%设置通带阻带
Np=floor(wp/(2*pi/N));
Ns=N-2*Np-2*m-1;
%设置过渡带系数
r=0.15;
Hk=[ones(1,Np+1),r*ones(1,m),zeros(1,Ns),r*ones(1,m),ones(1,Np)];
%进行频域插值，按第一类来算，见课本P439
alpha=(N-1)/2;
Phi=(-(2*pi*k/N)*((N-1)/2)).*(k>=0&k<=alpha)+0.*(k==N/2)+((2*pi*(N-k)/N)*((N-1)/2)).*(k>=alpha+2&k<=N-1);
H =Hk.*exp(1i*Phi);
%对加以相位的Hk作逆变换得到时域序列，再作DTFT完成插值
hn = real(ifft(H,N));
[Hw,w]=freqz(hn,1,'whole');

%绘图
subplot(2,3,1)
stem(k*2/N,Hk)
hold on
plot(w/pi,(abs(Hw)))
legend({'$H(k)$','$|H(e^{j\omega})|$'},'interpreter','latex')
title(['m=',num2str(m),'  抽样与插值'])
subplot(2,3,2)
stem(k,hn)
title(['m=',num2str(m),'  冲激响应序列'])
subplot(2,3,3)
plot(w/pi,20*log((abs(Hw))))
title(['m=',num2str(m),'  幅频特性'])

%m=2时
%设置参数
m=2;
wp=0.3*pi;
ws=0.5*pi;
deltaw=ws-wp;
N=(m+1)*2*pi/deltaw;
k=0:1:N-1;
%设置通带阻带
Np=floor(wp/(2*pi/N));
Ns=N-2*Np-2*m-1;
%设置过渡带系数
r=0.15;
Hk=[ones(1,Np+1),4*r*ones(1,1),r*ones(1,1),zeros(1,Ns),r*ones(1,1),4*r*ones(1,1),ones(1,Np)];
%进行频域插值，按第一类来算，见课本P439
alpha=(N-1)/2;
Phi=(-(2*pi*k/N)*((N-1)/2)).*(k>=0&k<=alpha)+0.*(k==N/2)+((2*pi*(N-k)/N)*((N-1)/2)).*(k>=alpha+2&k<=N-1);
H=Hk.*exp(1i*Phi);
%对加以相位的Hk作逆变换得到时域序列，再作DTFT完成插值
hn=real(ifft(H,N));
[Hw,w]=freqz(hn,1,'whole');

%绘图
subplot(2,3,4)
stem(k*2/N,Hk)
hold on
plot(w/pi,(abs(Hw)))
legend({'$H(k)$','$|H(e^{j\omega})|$'},'interpreter','latex')
title(['m=',num2str(m),'  抽样与插值'])
subplot(2,3,5)
stem(k,hn)
title(['m=',num2str(m),'  冲激响应序列'])
subplot(2,3,6)
plot(w/pi,20*log((abs(Hw))))
title(['m=',num2str(m),'  幅频特性'])