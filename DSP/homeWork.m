%%
%7-1
clear
figure
N=33;
n=0:1:N-1;
wc=0.3*pi;
a=(N-1)/2;
%理想低通滤波器对应的序列
hd=(sin(wc*(n-a))./(pi*(n-a)));
hd(a+1)=wc/pi;%这里要单独考虑，不然会出现NAN

%矩形窗截断
subplot(1,2,1)
window=(hamming(N))';
hd1=hd.*window;
stem(n,hd1),hold on
plot(n,window)
title('$Rectangle \quad Window \quad M=25$','interpreter','latex')
legend({'$h_{d}(n)$','$\omega(n)$'},'interpreter','latex')

subplot(1,2,2)
[Hw,w]=freqz(hd1,1,'whole');
plot(w/pi,20*log10(abs(Hw)))
title('$|H(e^{j\omega})|$','interpreter','latex')
%%
%7-2
clear
figure
N=43;
n=0:1:N-1;
wc=0.5*pi;
a=(N-1)/2;
%理想低通滤波器对应的序列
hd=(sin(wc*(n-a))./(pi*(n-a)));
hd(a+1)=wc/pi;%这里要单独考虑，不然会出现NAN

%矩形窗截断
subplot(1,2,1)
window=(hamming(N))';
hd1=hd.*window;
stem(n,hd1),hold on
plot(n,window)
title('$Rectangle \quad Window \quad M=25$','interpreter','latex')
legend({'$h_{d}(n)$','$\omega(n)$'},'interpreter','latex')

subplot(1,2,2)
[Hw,w]=freqz(hd1,1,'whole');
plot(w/pi,20*log10(abs(Hw)))
title('$|H(e^{j\omega})|$','interpreter','latex')
absHw=20*log10(abs(Hw))
%%
op=0.28*pi; rp=1;
os=0.3*pi; as=16;
figure;
[b,a]=afd_butt(op,os,rp,as);
[H,w]=freqs(b,a); h=impulse(b,a); t=0:length(h)-1;
subplot(221),plot(w/(2*pi),abs(H));title('巴特幅频特性');xlabel('Hz');
subplot(222),plot(w/(2*pi),angle(H));title('巴特相频特性');xlabel('Hz');
subplot(223),plot(w/(2*pi),20*log10(abs(H)/max(abs(H))));title('巴特幅度分贝表示 ');xlabel('Hz');
subplot(224),plot(t,h);title('巴特单位冲激响应h(t)');xlabel('sec');