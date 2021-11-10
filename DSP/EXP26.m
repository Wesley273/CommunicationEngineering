%%
%数字频带转换实验
clear
figure
%设置参数
T=1;
wplp=0.2*pi;
wphp=0.6*pi;
ws=0.3*pi;
Rp=1;
As=15;
%切比雪夫Ⅰ型低通滤波器设计
[b,a]=afd_chb1(wplp,ws,Rp,As);
[Bdirlp,Adirlp]=imp_invr(b,a,T);
%计算α
alpha=-(cos((wplp+wphp)/2))/(cos((wplp-wphp)/2));
%作频带转换
Nz = -[alpha,1];
Dz = [1,alpha];
[Bdirhp,Adirhp] = zmapping(Bdirlp,Adirlp,Nz,Dz);
%转换为级联型
[C,B,A] = dir2cas(Bdirhp,Adirhp)

subplot(3,2,1)
[Hw,w]=freqs(b,a);
plot(w,20*log10(abs(Hw)))
title("切比雪夫Ⅰ型模拟低通幅频特性")

subplot(3,2,3)
[H,w]=freqz(Bdirlp,Adirlp,'whole');
plot(w/pi,20*log10(abs(H)))
title("切比雪夫Ⅰ型数字低通幅频特性")

subplot(3,2,5)
plot(w/pi,angle(H))
title("切比雪夫Ⅰ型数字低通相频特性")

subplot(3,2,4)
[H,w]=freqz(Bdirhp,Adirhp,'whole');
plot(w/pi,20*log10(abs(H)))
title("切比雪夫Ⅰ型数字高通幅频特性")

subplot(3,2,6)
plot(w/pi,angle(H))
title("切比雪夫Ⅰ型数字高通相频特性")