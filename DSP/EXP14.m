%%
N=10;M=15;
nx=0:N-1;
x=[nx<=5];
n1=0:11;
h1=0.8.^n1;
nh=0:M-1;
h=zeros(1,M);
h(nh<=11)=h1;
y1=conv(x,h);
n01=min(nx)+min(nh);
n02=max(nx)+max(nh);
ny1=[n01:n02];
figure
subplot(321),stem(nx,x);
text(8,0.7,'x(n)');
subplot(322),stem(nh,h);
text(11,0.7,'h(n)');
subplot(312),stem(ny1,y1);
text(18,3,'直接线性卷积');
n=0:N+M-2;
L=length(n);
xk=fft(x,L);
hk=fft(h,L);
yk=xk.*hk;
y2=ifft(yk);
y2=abs(y2);
subplot(313),stem(n,y2);
text(18,3,'用FFT进行卷积');
%%
n1=0:15;
x1=n1;
n2=0:7;
M=length(n2);
x2=ones(1,M);
y1=conv(x1,x2);
n01=min(n1)+min(n2);
n02=max(n1)+max(n2);
ny1=[n01:n02];
figure
subplot(421),stem(n1,x1); title('x1(n)');
subplot(422),stem(n2,x2); title('x2(n)');
subplot(423),stem(ny1,y1); title('线性卷积');
for L=17:3:29 n=0:L-1;
    xk1=fft(x1,L);
    xk2=fft(x2,L);
    yk=xk1.*xk2;
    y2=ifft(yk);
    y2=abs(y2);
    subplot(4,2,(L-5)/3),stem(n,y2); title('用FFT进行卷积');
end