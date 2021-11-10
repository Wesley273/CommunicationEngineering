%%
%常见离散信号的产生
%先定义长度
N=10;
n=0:1:N-1;
%产生δ(n)
figure
subplot(2,2,1)
Dirac=zeros(N,1);
Dirac(1)=1;
stem(n,Dirac)
axis([-0.5 N-0.5 -0.5 1.5])
title(['$$\delta(n)$$'],'interpreter','latex')
%产生u(n)
subplot(2,2,2)
Step=ones(N,1);
stem(n,Step)
axis([-0.5 N-0.5 -0.5 1.5])
title(['$$u(n)$$'],'interpreter','latex')
%产生sin(ωn)
w=pi/5;
subplot(2,2,3)
Sin=sin(w*n);
stem(n,Sin)
axis([-0.5 N-0.5 -2 2])
title(['$$sin(\omega n)\quad\omega=\frac{\pi}{5}$$'],'interpreter','latex')
%产生a(n)
n=-N+1:1:N-1;
subplot(2,2,4)
a=1.2;
an=a.^n;
stem(n,an)
title(['$$a(n)\quad a=1.2$$'],'interpreter','latex')
%%
%产生复指数序列
a=-0.2;
b=-0.5;
K0=4;
N=30;
n=-N/2+1:1:N/2-1;
figure
subplot(2,2,1)
en=K0*exp((a+1i*b)*n);
stem(n,real(en))
title(['$$Re[K_0e^{a+jb}]$$'],'interpreter','latex')
subplot(2,2,2)
stem(n,imag(en))
title(['$$Im[K_0e^{a+jb}]$$'],'interpreter','latex')
subplot(2,2,3)
stem(n,abs(en))
title(['$$|K_0e^{a+jb}|$$'],'interpreter','latex')
subplot(2,2,4)
stem(n,angle(en))
title(['$$Arg[K_0e^{a+jb}]$$'],'interpreter','latex')
%%
%产生一般的正弦序列
%先定义长度
N=40;
n=-N+1:1:N-1;
f=0.1;
A0=2;
phi=pi/3;
Sin=A0*sin(2*pi*f*n+phi);
figure
stem(n,Sin)
title(['$$A_0 sin(2\pi fn+\phi)$$'],'interpreter','latex')