%%
%求xa(t)的32点DFT
f1=1;
f2=2;
f3=3;
fs=32;
Ts=1/fs;
N=31;
t=0:Ts:N*Ts;
n=0:1:31;
xa=0.15*sin(2*pi*f1*t)+sin(2*pi*f2*t)-0.1*sin(2*pi*f3*t);

figure
subplot(2,2,1)
stem(n,xa)
title(['$x_{a}(t)$'],'interpreter','latex')

subplot(2,2,2)
Xa=fft(xa);
stem(n,Xa)
title(['$DFT[x_{a}(t)]$'],'interpreter','latex')

%求有限长序列16点DFT
subplot(2,2,3)
n=0:1:15;
xn=sin(n*pi/8)+sin(n*pi/4);
stem(n,xn)
title(['$x_{n}(t)$'],'interpreter','latex')

subplot(2,2,4)
Xn=fft(xn);
stem(n,Xn)
title(['$DFT[x_{n}(t)]$'],'interpreter','latex')
%%
%幅频特性与相频特性的绘制及N点DFT的物理意义
n=0:1:3;
xn=[1,1,1,1];
[X,w]=freqz(xn,1,'whole');

figure
subplot(3,2,1)
stem(n,xn)
title(['$x(n)$'],'interpreter','latex')

subplot(3,2,2)
plot(w,abs(X))
title(['$|X(e^{j\omega})|$'],'interpreter','latex')

subplot(3,2,3)
plot(w,angle(X))
title(['$Arg[X(e^{j\omega})]$'],'interpreter','latex')

subplot(3,2,4)
xn=[1,1,1,1,0,0,0,0];
n=0:1:7;
Xn=fft(xn);
stem(n,abs(Xn))
title(['$Eight \quad Points \quad |X(k)|$'],'interpreter','latex')

subplot(3,2,5)
xn=[1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0];
n=0:1:15;
Xn=fft(xn);
stem(n,abs(Xn))
title(['$Sixteen \quad Points \quad |X(k)|$'],'interpreter','latex')
%%
%N=5的矩形序列
N=5;
xn=ones(1,N);
n=0:1:N-1;

figure
subplot(3,2,1)
stem(n,xn)
title(['$x(n)$'],'interpreter','latex')

subplot(3,2,2)
[Xw,w]=freqz(xn,1,'whole');
plot(w,abs(Xw))
title(['$|X(e^{j\omega})|$'],'interpreter','latex')
xn=ones(1,5*N);
n=0:1:5*N-1;

subplot(3,2,3)
stem(n,xn)
title(['$\widetilde{x}(n)$'],'interpreter','latex')

subplot(3,2,4)
Xk=fft(xn);
stem(n,abs(Xk))
title(['$|\widetilde{X}(k)|$'],'interpreter','latex')

subplot(3,2,5)
xn=ones(1,N);
n=0:1:N-1;
Xk=fft(xn);
stem(n,abs(Xk))
title(['$|X(k)|$'],'interpreter','latex')
%%
%N=10的矩形序列
N=10;
xn=ones(1,N);
n=0:1:N-1;

figure
subplot(3,1,1)
stem(n,xn)
title(['$x(n)$'],'interpreter','latex')

subplot(3,1,2)
xn=ones(1,5*N);
n=0:1:5*N-1;
stem(n,xn)
title(['$\widetilde{x}(n)$'],'interpreter','latex')

subplot(3,1,3)
Xk=fft(xn);
stem(n,abs(Xk))
title(['$|\widetilde{X}(k)|$'],'interpreter','latex')