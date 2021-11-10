%自适应波束形成方向图
clc;
clear all; 
close all;
ima=sqrt(-1);
element_num=16;       %阵元数
c=3e8;
f=500e6;
lamda=c/f;
d=1/2*lamda;         %阵元间距与波长的关系
theta=-90:0.5:90;      %范围
theta0=0;            %来波方向
theta1=45;           %干扰方向
theta2=60;           %干扰方向
L=512;              %采样单元数
for i=1:L
    amp0=10*randn(1);%信号的幅度随机产生，保证信号之间是不相关的
    amp1=100*randn(1);
    amp2=100*randn(1);
    ampn=10;
    x(:,i)=amp0*exp(ima*2*pi*1/2*sin(theta0*pi/180)*[0:element_num-1]')+...
      amp1*exp(ima*2*pi*1/2*sin(theta1*pi/180)*[0:element_num-1]')+...
      amp2*exp(ima*2*pi*1/2*sin(theta2*pi/180)*[0:element_num-1]')+...
      ampn*(randn(element_num,1)+ima*randn(element_num,1));%产生阵列信号
end
Rx=1/L*x* x';
steer1=exp(ima*2*pi*1/2*sin(theta0*pi/180)*[0:element_num-1]');
steer2=exp(ima*2*pi*1/2*sin(theta1*pi/180)*[0:element_num-1]');
steer3=exp(ima*2*pi*1/2*sin(theta2*pi/180)*[0:element_num-1]');
C=[steer1 steer2 steer3];
F=[1 0 0]';%把0度方向作为来波方向
w=inv(Rx)*C*(inv(C'*inv(Rx)*C))*F;
for j=1:length(theta)
    a=exp(ima*2*pi*1/2*sin(theta(j)*pi/180)*[0:element_num-1]');
    f(j)=w'*a;
    p(j)=1/(a'*inv(Rx)*a);
end
F=20*log10(abs(f)/(max(max(abs(f)))));
P=20*log10(abs(p)/(max(max(abs(p)))));%此处是功率的对数形式
figure
subplot(121)
plot(theta,P),grid on,hold on
xlabel('theta/o');
ylabel('F/dB');
title('阵列信号方向图')
axis([-90 90 -50 0]);
subplot(122)
plot(theta,F),grid on,hold on;
plot(theta0,-50:0,'.')
plot(theta1,-50:0,'.')
plot(theta2,-50:0,'.')
xlabel('theta/o');
ylabel('功率/dB');axis([-90 90 -50 0]);
title('自适应波束形成方向图')
%figure
%polarplot((theta*pi)/180,P)