function hn=raisedCosine(N,a,Ts,Tc)
% ------------------------------------
% 窗函数法设计升余弦滤波器
% N为滤波器阶数
% a为滚降系数，0<a≤1
% Ts为滤波器数字化时的抽样周期
% Tc为表征升余弦滤波器的频率响应的常数
% ------------------------------------
n=0:1:N-1;
tau=(N-1)/2;
t=(n-tau)*Ts;
%理想的升余弦滚降滤波器进行时域抽样
hdn=(sin(pi*t/Tc)./(pi*t/Tc)).*(cos(a*pi*t/Tc)./(1-4*a^2*t.^2/(Tc^2)));
%两个分母为0的点，进行补充
hdn(tau+1)=1;
if (Tc/(2*a*Ts)==fix(Tc/(2*a*Ts)))&&(Tc/(2*a*Ts)<=tau)
    hdn(tau+Tc/(2*a*Ts)+1)=(2*a*sin(pi/(2*a))/pi)*pi/4;
    hdn(tau-Tc/(2*a*Ts)+1)=hdn(tau+Tc/(2*a*Ts)+1);
end
%加窗截短
window=(blackman(N))';
hn=hdn.*window;
end