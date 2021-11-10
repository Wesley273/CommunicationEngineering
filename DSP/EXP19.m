%%
clear
figure
%圆周偶对称线性相位的验证
subplot(2,2,1)
hn=[1,2,3,2,1];
n=0:1:length(hn)-1;
stem(n,hn)
title('$h_{1}(n)$','interpreter','latex')

subplot(2,2,3)
[Hw,w]=freqz(hn,1,'whole');
plot(w/pi,angle(Hw))
title('$Arg[H_{1}(e^{j\omega})]$','interpreter','latex')

%圆周奇对称线性相位的验证
subplot(2,2,2)
hn=[1,2,3,-3,-2,-1];
n=0:1:length(hn)-1;
stem(n,hn)
title('$h_{2}(n)$','interpreter','latex')

subplot(2,2,4)
[Hw,w]=freqz(hn,1,'whole');
plot(w/pi,angle(Hw))
title('$Arg[H_{2}(e^{j\omega})]$','interpreter','latex')
%%
clear
figure
%Ⅰ型FIR，适用于低通、高通、带通、带阻
subplot(4,3,1)
hn=[1,-2,3,5,3,-2,1];
n=0:1:length(hn)-1;
stem(n,hn)
title('$h_{1}(n)$','interpreter','latex')

subplot(4,3,2)
[Hw,w]=freqz(hn,1,'whole');
plot(w/pi,abs(Hw))
title('$H_{1}(e^{j\omega})$','interpreter','latex')

subplot(4,3,3)
zplane(hn,1)
xlabel('$Re[z]$','interpreter','latex')
ylabel('$jIm[z]$','interpreter','latex')
title('Zeros')

%Ⅱ型FIR，适用于低通、带通
subplot(4,3,4)
hn=[1,-2,3,3,-2,1];
n=0:1:length(hn)-1;
stem(n,hn)
title('$h_{2}(n)$','interpreter','latex')

subplot(4,3,5)
[Hw,w]=freqz(hn,1,'whole');
plot(w/pi,abs(Hw))
title('$H_{2}(e^{j\omega})$','interpreter','latex')

subplot(4,3,6)
zplane(hn,1)
xlabel('$Re[z]$','interpreter','latex')
ylabel('$jIm[z]$','interpreter','latex')
title('Zeros')

%Ⅲ型FIR，适用于带通、微分器、希尔伯特变换器
subplot(4,3,7)
hn=[1,-2,3,5,-3,2,-1];
n=0:1:length(hn)-1;
stem(n,hn)
title('$h_{3}(n)$','interpreter','latex')

subplot(4,3,8)
[Hw,w]=freqz(hn,1,'whole');
plot(w/pi,abs(Hw))
title('$H_{3}(e^{j\omega})$','interpreter','latex')

subplot(4,3,9)
zplane(hn,1)
xlabel('$Re[z]$','interpreter','latex')
ylabel('$jIm[z]$','interpreter','latex')
title('Zeros')

%Ⅳ型FIR，适用于高通、带通、微分器、希尔伯特变换器
subplot(4,3,10)
hn=[1,-2,3,-3,2,-1];
n=0:1:length(hn)-1;
stem(n,hn)
title('$h_{4}(n)$','interpreter','latex')

subplot(4,3,11)
[Hw,w]=freqz(hn,1,'whole');
plot(w/pi,abs(Hw))
title('$H_{4}(e^{j\omega})$','interpreter','latex')

subplot(4,3,12)
zplane(hn,1)
xlabel('Re[z]')
ylabel('$jIm[z]$','interpreter','latex')
title('Zeros')