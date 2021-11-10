%%
%差分方程求解冲激响应与阶跃响应
b=[1];
a=[1,-1,0.9];
n=[-20:120];
h=impz(b,a,n);
figure
subplot(2,1,1);
stem(h);
title('Impulse Response');xlabel('n');ylabel('h(n)')
x=stepseq(0,-20,120);
g=filter(b,a,x);
subplot(2,1,2);
stem(g)
title('Step Response');xlabel('n');ylabel('g(n)')
%%
%差分方程数值求解
b=[1];a=[1,-3/2,1/2];
n=0:120;
x=(1/4).^n.*stepseq(0,0,120);
X=[0,0];
Y=[4,10];
xic=filtic(b,a,Y,X);
y1=filter(b,a,x,xic);
figure
stem(n,y1)
axis([-3,125,-1,3])
title('Solution to the equation');xlabel('n');ylabel('y(n)')
%%
%差分方程理论求解
syms z n
x=heaviside(n)*((1/4)^n);
X=ztrans(x);
H=1/(1-1.5*z^(-1)+0.5*z^(-2));
Y=(X+1-2*z^(-1))*H;
hn=iztrans(Y,z,n);
pretty(hn)
figure
ezplot(hn)
%%
function[x,n]=stepseq(n0,n1,n2)
n=n1:1:n2;
x=(n-n0)>=0;
end