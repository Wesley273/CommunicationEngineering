%%
%线性卷积与圆周卷积的比较
figure
subplot(4,2,1)
n=0:1:2;
xn1=[0,3,3];
stem(n,xn1)
title(['$x_{1}(n)$'],'interpreter','latex')

subplot(4,2,2)
n=0:1:3;
xn2=[4,4,1,0];
stem(n,xn2)
title(['$x_{2}(n)$'],'interpreter','latex')

subplot(4,2,3)
%计算线性卷积
L=length(xn1)+length(xn2)-1;
n=0:1:L-1;
stem(n,conv(xn1,xn2))
title(['$x_{1}(n)*x_{2}(n)$'],'interpreter','latex')

for N=4:8
subplot(4,2,N)
%计算N点圆卷积,N=4~8
n=0:1:N-1;
xn1=[xn1,zeros(N-length(xn1))];
xn2=[xn2,zeros(N-length(xn2))];
y=ifft(fft(xn1).*fft(xn2));
stem(n,y)
title(['$Circular \quad Convolution \quad L=$',num2str(N)],'interpreter','latex')
end