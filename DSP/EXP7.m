%%
%采样定理的验证
figure
T=20;
fs=5000;
Ts=1/fs;
n=-T:Ts:T;
xa=exp(-1000*abs(n));
[X,w]=freqz(xa,1,'whole');
subplot(1,2,1)
plot(w,abs(X))
title(['$$|X(e^{j\omega})| \quad f_s=5000Hz$$'],'interpreter','latex')
subplot(1,2,2)
T=2;
fs=1000;
Ts=1/fs;
n=-T:Ts:T;
xa=exp(-1000*abs(n));
[X,w]=freqz(xa,1,'whole');
plot(w,abs(X))
title(['$$|X(e^{j\omega})| \quad f_s=1000Hz$$'],'interpreter','latex')