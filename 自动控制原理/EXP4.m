%%
%例2-12
clear
syms s Uo Ui t
L=1;
C=1;
R=1;
%----------求解全响应----------
Ui=1/s;
u0=0.1;
i0=0.1;
equation=L*C*((s^2)*Uo-s*u0-i0/C)+R*C*(s*Uo-u0)+Uo-Ui;
Uo=solve(equation,Uo);
y=ilaplace(Uo);
%----------求解单位阶跃响应----------
%重新初始化Uo防止影响后续运算
syms Uo
Ui=1/s;
equation=L*C*(s^2)*Uo+R*C*s*Uo+Uo-Ui;
Uo=solve(equation,Uo);
g=ilaplace(Uo)
figure
fplot(g,[0,20])
axis([0,20,0,1.5]),grid on;
title('Unit Step Response')
ylabel('Amplitude')
xlabel('t/s')
%----------求解单位脉冲响应----------
%脉冲响应为阶跃响应的导数
h=diff(g)
figure
fplot(h,[0,20])
axis([0,20,-0.5,0.7]),grid on;
title('Unit Impulse Response')
ylabel('Amplitude')
xlabel('t/s')
%----------求解零状态响应----------
%这里的零状态响应即单位阶跃响应
yzs=g
figure
fplot(yzs,[0,20])
axis([0,20,0,1.5]),grid on;
title('Zero State Response')
ylabel('Amplitude')
xlabel('t/s')
%----------求解零输入响应----------
%零输入响应为全响应-零状态响应
yzi=y-yzs
figure
fplot(yzi,[0,20])
axis([0,20,-0.2,0.2]),grid on;
title('Zero Input Response')
ylabel('Amplitude')
xlabel('t/s')
%%
%三种典型响应的求解
wn=4;
zeta=0.707;num=[wn^2];den=[1 2*wn*zeta wn^2];
sys=tf(num,den);
t=0:0.01:3;
figure(1)
impulse(sys,t);grid on;
xlabel('t');ylabel('c(t)');title('Impulse Response');
figure(2)
step(sys,t);grid on;
xlabel('t');ylabel('c(t)');title('Step Response');
figure(3)
u=t;
lsim(sys,u,t,0);grid on;
xlabel('t');ylabel('c(t)');title('Ramp Response');
%%
%系统动态性能求解
figure
t=0:0.01:10;
for zeta=[0,0.1,0.2,0.3,0.5,0.6,0.707,0.9,1,2]
    wn=4;
    num=[wn^2];den=[1 2*wn*zeta wn^2];
    sys=tf(num,den);
    step(sys,t);grid on;hold on;
end
xlabel('t');ylabel('c(t)');title('Step Response');
legend('ζ=0','ζ=0.1','ζ=0.2','ζ=0.3','ζ=0.5','ζ=0.6','ζ=0.707','ζ=0.9','ζ=1','ζ=2','Location','Northwest')