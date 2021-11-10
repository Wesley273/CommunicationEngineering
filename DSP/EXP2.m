%%
%信号的加和
n1=0:10;
x1=n1.^2-n1;
n2=-5:15;
x2=-n2.^2+n2;
[y,~]=sigadd(x1,n1,x2,n2);
figure
subplot(2,2,1)
stem(y);
grid on
title(['$$Signal\quad Add$$'],'interpreter','latex')
%第一对信号的相乘
w0=pi/20;
n1=-20:20;
x1=sin(w0*n1);
a=1.05;
n2=-20:20;
x2=a.^n2;
[y,~]=sigmult(x1,n1,x2,n2);
subplot(2,2,2)
stem(y);
title(['$$sin(\omega _0 n)a^n$$'],'interpreter','latex')
%第二对信号的相乘
w0=pi/20;
n1=-10:10;
x1=cos(w0*n1);
a=0.6;
n2=-5:15;
x2=a.^n2;
[y,~]=sigmult(x1,n1,x2,n2);
subplot(2,2,3)
stem(y);
title(['$$cos(\omega _0 n)(0.6)^n$$'],'interpreter','latex')
%信号的翻折
n=0:4;
x=[1 2 3 4 5];
[y,n]=sigfold(x,n);
subplot(2,2,4)
stem(y);
title(['$$Signal\quad Fold$$'],'interpreter','latex')
%%
%信号加和函数
function[y,n]=sigadd(x1,n1,x2,n2)
n=min(min(n1),min(n2)):max(max(n1),max(n2));
y1=zeros(1,length(n));
y2=y1;
y1((n>=min(n1))&(n<=max(n1))==1)=x1;
y2((n>=min(n2))&(n<=max(n2))==1)=x2;
y=y1+y2;
end
%信号翻转函数
function[y,n]=sigfold(x,n)
y=fliplr(x);n=-fliplr(n);
end
%信号相乘函数
function[y,n]=sigmult(x1,n1,x2,n2)
n=min(min(n1),min(n2)):max(max(n1),max(n2));
y1=zeros(1,length(n));
y2=y1;
y1((n>=min(n1))&(n<=max(n1))==1)=x1;
y2((n>=min(n2))&(n<=max(n2))==1)=x2;
y=y1.*y2;
end