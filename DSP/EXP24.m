%%
%冲激响应不变法设计低通滤波器
clear
figure
%设置参数
T=1;
wp=0.2*pi;
ws=0.3*pi;
Rp=1;
As=15;
%巴特沃斯滤波器
[b,a]=afd_butt(wp,ws,Rp,As);
[Bdir,Adir]=imp_invr(b,a,T);
[Cpar,Bpar,Apar] = dir2par(Bdir,Adir)%转换为并联型

subplot(4,3,1)
[Hw,w]=freqs(b,a);
plot(w,20*log10(abs(Hw)))
title("巴特模拟滤波器幅频特性")

subplot(4,3,2)
[H,w]=freqz(Bdir,Adir,'whole');
plot(w/pi,20*log10(abs(H)))
title("巴特数字滤波器幅频特性")

subplot(4,3,3)
plot(w/pi,angle(H))
title("巴特数字滤波器相频特性")

%切比雪夫Ⅰ型滤波器
[b,a]=afd_chb1(wp,ws,Rp,As);
[Bdir,Adir]=imp_invr(b,a,T);
[Cpar,Bpar,Apar] = dir2par(Bdir,Adir)%转换为并联型

subplot(4,3,4)
[Hw,w]=freqs(b,a);
plot(w,20*log10(abs(Hw)))
title("切比雪夫Ⅰ型模拟滤波器幅频特性")

subplot(4,3,5)
[H,w]=freqz(Bdir,Adir,'whole');
plot(w/pi,20*log10(abs(H)))
title("切比雪夫Ⅰ型数字滤波器幅频特性")

subplot(4,3,6)
plot(w/pi,angle(H))
title("切比雪夫Ⅰ型数字滤波器相频特性")

%切比雪夫Ⅱ型滤波器
[b,a]=afd_chb2(wp,ws,Rp,As);
[Bdir,Adir]=imp_invr(b,a,T);
[Cpar,Bpar,Apar] = dir2par(Bdir,Adir)%转换为并联型

subplot(4,3,7)
[Hw,w]=freqs(b,a);
plot(w,20*log10(abs(Hw)))
title("切比雪夫Ⅱ型模拟滤波器幅频特性")

subplot(4,3,8)
[H,w]=freqz(Bdir,Adir,'whole');
plot(w/pi,20*log10(abs(H)))
title("切比雪夫Ⅱ型数字滤波器幅频特性")

subplot(4,3,9)
plot(w/pi,angle(H))
title("切比雪夫Ⅱ型数字滤波器相频特性")

%椭圆滤波器
[b,a]=afd_elip(wp,ws,Rp,As);
[Bdir,Adir]=imp_invr(b,a,T);
[Cpar,Bpar,Apar] = dir2par(Bdir,Adir)

subplot(4,3,10)
[Hw,w]=freqs(b,a);
plot(w,20*log10(abs(Hw)))
title("椭圆模拟滤波器幅频特性")

subplot(4,3,11)
[H,w]=freqz(Bdir,Adir,'whole');
plot(w/pi,20*log10(abs(H)))
title("椭圆数字滤波器幅频特性")

subplot(4,3,12)
plot(w/pi,angle(H))
title("椭圆数字滤波器相频特性")