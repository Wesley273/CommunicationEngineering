%%
x=ones(1,8);  %R8(n)
n=0:length(x)-1;

figure
subplot(3,2,1)
t0=clock;
[m1,a1]=dft1(x);
t1=etime(clock,t0)
stem(n,m1);
title('dft1得到的幅频特性');

subplot(3,2,2)
plot(n,a1)
title('相频特性');

subplot(3,2,3)
t0=clock;
[m2,a2]=dft2(x);
t2=etime(clock,t0)
stem(n,m2);
title('dft2得到的幅频特性');

subplot(3,2,4)
plot(n,a2);
title('相频特性');

subplot(3,2,5)
t0=clock;
y=fft(x);
t3=etime(clock,t0)
stem(n,abs(y));
title('FFT得到的幅频特性');

subplot(3,2,6)
plot(n,angle(y));
title('相频特性');
%%
p=8;
n=0:15;
figure
for k=1:3
    q=2^k;
    x1=exp(-((n-p).^2)/q);
    subplot(3,2,2*k-1),stem(n,x1,'.'); title(['q=',num2str(q),' x(n)']);
    [m,a,w]=dtft(x1);
    subplot(3,2,2*k),plot(w/pi,m); title(['q=',num2str(q),' 幅频特性']);
end

q=8;
figure
for k=1:3
    p=-2*(k^2)+11*k-1;     %p=8、13、14
    x1=exp(-((n-p).^2)/q);
    subplot(3,2,2*k-1),stem(n,x1,'.'); title(['p=',num2str(p),' x(n)']);
    [m,a,w]=dtft(x1);
    subplot(3,2,2*k),plot(w/pi,m); title(['p=',num2str(p),' 幅频特性']);
end

figure
f1=[0.0625,0.4375,0.5625];
for k=1:3
    f=f1(k);
    a=0.1;
    x2=exp(-a)*sin(2*pi*f*n);
    subplot(3,2,2*k-1),stem(n,x2,'.'); title(['f=',num2str(f),' x(n)']);
    [m,a,w]=dtft(x2);
    subplot(3,2,2*k),plot(w/pi,m); title(['f=',num2str(f),' 幅频特性']);
end
%%
function[Am,pha]=dft1(x)   %DFT定义
N=length(x);
w=exp(-1i*2*pi/N);
for k=1:N
    sum=0;
    for n=1:N
        sum=sum+x(n)*w^((k-1)*(n-1));
    end
    Am(k)=abs(sum);
    pha(k)=angle(sum);
end
end
function[Am,pha]=dft2(x)
N=length(x);
n=0:N-1;
k=n;
w=exp(-1i*2*pi/N);
nk=n'*k;
wnk=w.^(nk);
xk=x*wnk;
Am=abs(xk);
pha=angle(xk);
end
function[m,a,w]=dtft(x)
N=length(x);
n=0:N-1;
w=linspace(-2*pi,2*pi,500);  %在-π/2到π/2产生N点行矢量
y=x*exp(-1i*n'*w);
m=abs(y);
a=angle(y);
end