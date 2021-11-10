%%
%分别使用矩形窗和汉明窗进行低通滤波器设计
clear
figure
%M=25时
N=25;
n=0:1:N-1;
wc=1;
a=(N-1)/2;
%理想低通滤波器对应的序列
hd=(sin(wc*(n-a))./(pi*(n-a)));
hd(a+1)=wc/pi;%这里要单独考虑，不然会出现NAN

%矩形窗截断
subplot(4,2,1)
window=ones(1,N);
hd1=hd.*window;
stem(n,hd1),hold on
plot(n,window)
title('$Rectangle \quad Window \quad M=25$','interpreter','latex')
legend({'$h_{d}(n)$','$\omega(n)$'},'interpreter','latex')

subplot(4,2,2)
[Hw,w]=freqz(hd1,1,'whole');
plot(w/pi,20*log10(abs(Hw)))
title('$|H(e^{j\omega})|$','interpreter','latex')

%汉明窗截断
subplot(4,2,3)
window=(hamming(N))';
hd2=hd.*window;
stem(n,hd),hold on
plot(n,window)
title('$Hamming \quad Window \quad M=25$','interpreter','latex')
legend({'$h_{d}(n)$','$\omega(n)$'},'interpreter','latex')

subplot(4,2,4)
[Hw,w]=freqz(hd2,1,'whole');
plot(w/pi,20*log10(abs(Hw)))
title('$|H(e^{j\omega})|$','interpreter','latex')

%M=49时
N=49;
n=0:1:N-1;
wc=1;
a=(N-1)/2;
window=ones(1,N);
hd=(sin(wc*(n-a))./(pi*(n-a)));
hd(a+1)=wc/pi;

%矩形窗截断
subplot(4,2,5)
hd1=hd.*window;
stem(n,hd1),hold on
plot(n,window)
title('$Rectangle \quad Window \quad M=49$','interpreter','latex')
legend({'$h_{d}(n)$','$\omega(n)$'},'interpreter','latex')

subplot(4,2,6)
[Hw,w]=freqz(hd1,1,'whole');
plot(w/pi,20*log10(abs(Hw)))
title('$|H(e^{j\omega})|$','interpreter','latex')

%汉明窗截断
subplot(4,2,7)
window=(hamming(N))';
hd2=hd.*window;
stem(n,hd),hold on
plot(n,window)
title('$Hamming \quad Window \quad M=49$','interpreter','latex')
legend({'$h_{d}(n)$','$\omega(n)$'},'interpreter','latex')

subplot(4,2,8)
[Hw,w]=freqz(hd2,1,'whole');
plot(w/pi,20*log10(abs(Hw)))
title('$|H(e^{j\omega})|$','interpreter','latex')
%%
%分别用三种窗设计FIR滤波器
clear
figure
N=13;
n=0:1:N-1;
wc=0.2*pi;
a=(N-1)/2;
hd=(sin(wc*(n-a))./(pi*(n-a)));
hd(a+1)=wc/pi;

%三角窗
subplot(3,2,1)
window=(bartlett(N))';
hd1=hd.*window;
stem(n,hd),hold on
plot(n,window)
title('$Bartlett \quad Window$','interpreter','latex')
legend({'$h_{d}(n)$','$\omega(n)$'},'interpreter','latex')

subplot(3,2,2)
[Hw,w]=freqz(hd1,1,'whole');
plot(w/pi,20*log10(abs(Hw)))
title('$|H(e^{j\omega})|$','interpreter','latex')

%汉明窗
subplot(3,2,3)
window=(hamming(N))';
hd2=hd.*window;
stem(n,hd),hold on
plot(n,window)
title('$Hamming \quad Window$','interpreter','latex')
legend({'$h_{d}(n)$','$\omega(n)$'},'interpreter','latex')

subplot(3,2,4)
[Hw,w]=freqz(hd2,1,'whole');
plot(w/pi,20*log10(abs(Hw)))
title('$|H(e^{j\omega})|$','interpreter','latex')

%布莱克曼窗
subplot(3,2,5)
window=(blackman(N))';
hd3=hd.*window;
stem(n,hd),hold on
plot(n,window)
title('$Blackman \quad Window$','interpreter','latex')
legend({'$h_{d}(n)$','$\omega(n)$'},'interpreter','latex')

subplot(3,2,6)
[Hw,w]=freqz(hd3,1,'whole');
plot(w/pi,20*log10(abs(Hw)))
title('$|H(e^{j\omega})|$','interpreter','latex')
%%
%根据指标设计滤波器ωp=0.3π，ωs=0.5π，Ap=0.25dB，As=50dB
%选用Hamming窗即可
clear
figure
%性能指标
wp=0.3*pi;
ws=0.5*pi;
wc=(wp+ws)/2;
%计算参数
deltaw=ws-wp;
N=6.6*pi/deltaw;
n=0:1:N-1;
a=(N-1)/2;
%理想低通滤波器对应的序列
hd=(sin(wc*(n-a))./(pi*(n-a)));
hd(a+1)=wc/pi;

%汉明窗
subplot(2,1,1)
window=(hamming(N))';
hd2=hd.*window;
stem(n,hd),hold on
plot(n,window)
title('$Hamming \quad Window$','interpreter','latex')
legend({'$h_{d}(n)$','$\omega(n)$'},'interpreter','latex')

subplot(2,1,2)
[Hw,w]=freqz(hd2,1,'whole');
plot(w/pi,20*log10(abs(Hw)))
title('$|H(e^{j\omega})|$','interpreter','latex')
%%
%设计带通滤波器
clear
figure
%性能指标
wpl=0.2*pi;
wsl=0.4*pi;
wph=0.6*pi;
wsh=0.8*pi;
%计算参数
w1=(wsl+wpl)/2;
w2=(wsh+wph)/2;
N=6.6*pi/min(wsl-wpl,wsh-wph);
%利用fir1函数进行设计
hd=fir1(N,[w1/pi,w2/pi],hamming(N+1));
[Hw,w]=freqz(hd,1,'whole');
plot(w/pi,20*log10(abs(Hw)))
title('$|H(e^{j\omega})|$','interpreter','latex')