%%
%x(n)=cos(5nπ/16)
figure
subplot(3,2,1)
N=16;
n=0:1:N-1;
xn=cos(5*pi*n/16);
stem(n,xn)
title(['$x(n) \quad N=16$'],'interpreter','latex')

subplot(3,2,3)
[Xw,w]=freqz(xn,1,'whole');
plot(w,abs(Xw))
title(['$|X(e^{j\omega})| \quad N=16$'],'interpreter','latex')

subplot(3,2,5)
Xk=fft(xn);
stem(n,abs(Xk))
title(['$|X(k)| \quad N=16$'],'interpreter','latex')

subplot(3,2,2)
N=32;
n=0:1:N-1;
xn=cos(5*pi*n/16);
stem(n,xn)
title(['$x(n) \quad N=32$'],'interpreter','latex')

subplot(3,2,4)
[Xw,w]=freqz(xn,1,'whole');
plot(w,abs(Xw))
title(['$|X(e^{j\omega})| \quad N=32$'],'interpreter','latex')

subplot(3,2,6)
Xk=fft(xn);
stem(n,abs(Xk))
title(['$|X(k)| \quad N=32$'],'interpreter','latex')
%%
%x(n)=[1,2,3,4,5,6,6,5,4,3,2,1]
xn=[1,2,3,4,5,6,6,5,4,3,2,1];
N=length(xn);
n=0:1:N-1;
figure
subplot(3,2,1)
stem(n,xn)
title(['$x(n)$'],'interpreter','latex')

subplot(3,2,3)
Xk=fft(xn);
stem(n,abs(Xk))
title(['$|X(k)|$'],'interpreter','latex')

subplot(3,2,5)
plot(n,angle(Xk))
title(['$Arg[X(k)]$'],'interpreter','latex')

subplot(3,2,2)
[Xw,w]=freqz(xn,1,'whole');
plot(w,abs(Xw))
title(['$|X(e^{j\omega})|$'],'interpreter','latex')

subplot(3,2,4)
[Xw,w]=freqz(xn,1,'whole');
plot(w,angle(Xw))
title(['$Arg[X(e^{j\omega})]$'],'interpreter','latex')

subplot(3,2,6)
plot(w,abs(Xw))
hold on;
stem(2*pi*n/N,abs(Xk))
legend({'$|X(e^{j\omega})|$','$|X(k)|$'},'interpreter','latex')