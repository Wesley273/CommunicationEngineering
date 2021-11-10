%%
%计算DTFT
N=80;
n=0:1:N-1;
xn=(0.8).^n;
[X,w]=freqz(xn,1,'whole');
figure
subplot(1,2,1)
plot(w,abs(X))
title(['$$|X(e^{j\omega})|$$'],'interpreter','latex')
subplot(1,2,2)
plot(w,angle(X))
title(['$$Arg[X(e^{j\omega})]$$'],'interpreter','latex')
%%
%序列x(n)的对称性
N=20;
w=3/pi;
n=-N+1:1:N-1;
xn=exp(1i*w*n);
figure
subplot(1,2,1)
stem(n,real(xn))
title("Real Part")
subplot(1,2,2)
stem(n,imag(xn))
title("Imgaginary Part")