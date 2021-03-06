%%
%滤波实验
clear
figure
%设置抽样频率为200Hz，则能处理的最高频率为100Hz
fs=200;
Ts=1/fs;
n=0:Ts:1;
%设置信号中的三个分量
%低频分量
w1=2*pi*30;
x1=2*cos(w1*n);
subplot(4,3,4)
plot(n,x1)
title('低频原信号')
%中频分量
w2=2*pi*60;
x2=3*cos(w2*n);
subplot(4,3,7)
plot(n,x2)
title('中频原信号')
%高频分量
w3=2*pi*90;
x3=2*cos(w3*n);
subplot(4,3,10)
plot(n,x3)
title('高频原信号')
%混合信号
y=x1+x2+x3;
subplot(4,3,2)
plot(n,y)
title('混合信号')

%滤出低频分量
%设计butterworth低通滤波器
%设置参数，要注意wp与ws不需要带π
wp=0.4;
ws=0.45;
Rp=1;
As=20;
%计算滤波器所需参数
[N,wc]=buttord(wp,ws,Rp,As);
[Bdirlp,Adirlp] = butter(N,wc,'low');
%绘图并滤波
subplot(4,3,5)
[H,w]=freqz(Bdirlp,Adirlp,'whole');
plot(w/pi,20*log10(abs(H)))
title("巴特低通滤波器幅频特性")
subplot(4,3,6)
y1=filter(Bdirlp,Adirlp,y);
plot(n,y1)
title('滤出的低频信号')

%滤出中频分量
%设计butterworth带通滤波器
%设置参数
wp=[0.55,0.65];
ws=[0.5,0.7];
Rp=1;
As=20;
%计算滤波器所需参数
[N,wc]=buttord(wp,ws,Rp,As);
[Bdirlp,Adirlp] = butter(N,wc,'bandpass');
%绘图并滤波
subplot(4,3,8)
[H,w]=freqz(Bdirlp,Adirlp,'whole');
plot(w/pi,20*log10(abs(H)))
title("巴特带通滤波器幅频特性")
subplot(4,3,9)
y2=filter(Bdirlp,Adirlp,y);
plot(n,y2)
title('滤出的中频信号')

%滤出高频分量
%设计butterworth高通滤波器
%设置参数
wp=0.8;
ws=0.75;
Rp=1;
As=20;
%计算滤波器所需参数
[N,wc]=buttord(wp,ws,Rp,As);
[Bdirlp,Adirlp] = butter(N,wc,'high');
%绘图并滤波
subplot(4,3,11)
[H,w]=freqz(Bdirlp,Adirlp,'whole');
plot(w/pi,20*log10(abs(H)))
title("巴特高通滤波器幅频特性")
subplot(4,3,12)
y2=filter(Bdirlp,Adirlp,y);
plot(n,y2)
title('滤出的高频信号')