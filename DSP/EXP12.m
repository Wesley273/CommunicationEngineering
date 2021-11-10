%%
%重叠保留法与重叠相加法
n=0:1:18;
xn=3*n+2;
hn=[1,2,3,4];

figure
subplot(4,1,1)
stem(n,xn)
title(['$x(n)$'],'interpreter','latex')

subplot(4,1,2)
n=0:1:3;
stem(n,hn)
title(['$h(n)$'],'interpreter','latex')

subplot(4,1,3)
yn=hsolpsav(xn,hn,5);
n=0:1:length(yn)-1;
stem(n,yn)
title('重叠保留法')

subplot(4,1,4)
clear
n=0:1:18;
xn=3*n+2;
hn=[1,2,3,4];
yn=hsolpadd(xn,hn,7);
n=0:1:length(yn)-1;
stem(n,yn)
title('重叠相加法')
%%
function [y] = hsolpsav(x,h,N)
% High-speed Overlap-Save method of block convolutions using FFT
% --------------------------------------------------------------
% [y] = hsolpsav(x,h,N)
% y = output sequence
% x = input sequence
% h = impulse response
% N = block length (must be a power of two)
%
N = 2^(ceil(log10(N)/log10(2)));
Lenx = length(x);
M = length(h);
M1 = M-1;
L = N-M1;
h = fft(h,N);
%
x = [zeros(1,M1), x, zeros(1,N-1)];
K = floor((Lenx+M1-1)/(L)); % # of blocks
Y = zeros(K+1,N);
for k=0:K
    xk = fft(x(k*L+1:k*L+N));
    Y(k+1,:) = real(ifft(xk.*h));
end
Y = Y(:,M:N)';
y = (Y(:))';
end
function [y] = hsolpadd(x,h,N)
% High-speed Overlap-Add method of block convolutions using FFT
% --------------------------------------------------------------
% [y] = hsolpadd(x,h,N)
% y = output sequence
% x = input sequence
% h = impulse response
% N = block length (must be a power of two)
%
N = 2^(ceil(log10(N)/log10(2)));
Lenx = length(x);
M = length(h);
x=[x,zeros(1,N-1)];
t=zeros(1,M-1);
y=zeros(1,Lenx+M-1);
a=floor(Lenx/N);
for k=0:a
    A=x(k*N+1:k*N+N);
    y1=fft(A,Lenx+M-1);
    y2=fft(h,Lenx+M-1);
    y3=y1.*y2;
    q=ifft(y3,Lenx+M-1);
    y(k*N+1:k*N+M-1)=q(1:M-1)+t(1:M-1);
    y(k*N+M:k*N+N)=q(M:N);
    t(1:M-1)=q(N+1:N+M-1);
end
y=y(1:Lenx+M-1);
end