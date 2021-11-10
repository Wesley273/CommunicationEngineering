%%
%直接法滤波器设计
figure
clear
%设计butterworth低通滤波器
%设置参数，要注意wp与ws不需要带π
wp=0.2;
ws=0.3;
Rp=1;
As=15;
%计算所需参数
[N,wc]=buttord(wp,ws,Rp,As);
[Bdirlp,Adirlp] = butter(N,wc,'low');
%转换为级联型
fprintf('*******低通滤波器级联形式*******')
[C,B,A] = dir2cas(Bdirlp,Adirlp)
%绘图
subplot(4,2,1)
[H,w]=freqz(Bdirlp,Adirlp,'whole');
plot(w/pi,20*log10(abs(H)))
title("巴特沃斯数字低通幅频特性")
subplot(4,2,2)
plot(w/pi,angle(H))
title("巴特沃斯数字低通相频特性")

%设计butterworth高通滤波器
%设置参数
wp=0.6;
ws=0.4;
Rp=1;
As=15;
%计算所需参数
[N,wc]=buttord(wp,ws,Rp,As);
[Bdirlp,Adirlp] = butter(N,wc,'high');
%转换为级联型
fprintf('*******高通滤波器级联形式*******')
[C,B,A] = dir2cas(Bdirlp,Adirlp)
%绘图
subplot(4,2,3)
[H,w]=freqz(Bdirlp,Adirlp,'whole');
plot(w/pi,20*log10(abs(H)))
title("巴特沃斯数字高通幅频特性")
subplot(4,2,4)
plot(w/pi,angle(H))
title("巴特沃斯数字高通相频特性")

%设计butterworth带通滤波器
%设置参数
wp=[0.3,0.4];
ws=[0.2,0.5];
Rp=3;
As=18;
%计算所需参数
[N,wc]=buttord(wp,ws,Rp,As);
[Bdirlp,Adirlp] = butter(N,wc,'bandpass');
%转换为级联型
fprintf('*******带通滤波器级联形式*******')
[C,B,A] = dir2cas(Bdirlp,Adirlp)
%绘图
subplot(4,2,5)
[H,w]=freqz(Bdirlp,Adirlp,'whole');
plot(w/pi,20*log10(abs(H)))
title("巴特沃斯数字带通幅频特性")
subplot(4,2,6)
plot(w/pi,angle(H))
title("巴特沃斯数字带通相频特性")

%设计butterworth带阻滤波器
%设置参数
wp=[0.2,0.8];
ws=[0.4,0.7];
Rp=1;
As=30;
%计算所需参数
[N,wc]=buttord(wp,ws,Rp,As);
[Bdirlp,Adirlp] = butter(N,wc,'stop');
%转换为级联型
fprintf('*******带阻滤波器级联形式*******')
[C,B,A] = dir2cas(Bdirlp,Adirlp)
%绘图
subplot(4,2,7)
[H,w]=freqz(Bdirlp,Adirlp,'whole');
plot(w/pi,20*log10(abs(H)))
title("巴特沃斯数字带阻幅频特性")
subplot(4,2,8)
plot(w/pi,angle(H))
title("巴特沃斯数字带通相频特性")