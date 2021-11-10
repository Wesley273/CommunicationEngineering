%%
%窗函数法设计微分器（Ts=1）
clear
figure
N=6;
n=0:1:N-1;
%理想的微分器时域表达式
hn=((-1).^(n+N/2+1))./(pi*((n-(N-1)/2).^2));

%使用Hamming窗截断
subplot(2,3,1)
window=(hamming(N))';
hn2=hn.*window;
stem(n,hn)
hold on
plot(n,window)
title('$Hamming \quad Window \quad M=6$','interpreter','latex')
legend({'$h(n)$','$\omega(n)$'},'interpreter','latex')

subplot(2,3,2)
%实际的微分器幅频特性
[Hw,w]=freqz(hn2,1,'whole');
plot(w/pi,abs(Hw))
hold on
%理想微分器幅频特性
idealHw=w.*(w>=0&w<=pi)+(-(w-2*pi)).*(w>pi&w<=2*pi);
plot(w/pi,idealHw)
title('$|H(e^{j\omega})|$','interpreter','latex')
legend({'Real','Ideal'})

subplot(2,3,3)
plot(w/pi,angle(Hw))
title('$Arg[H(e^{j\omega})]$','interpreter','latex')

%使用Blackman窗截断
subplot(2,3,4)
window=(blackman(N))';
hn2=hn.*window;
stem(n,hn)
hold on
plot(n,window)
title('$Hamming \quad Window \quad M=6$','interpreter','latex')
legend({'$h(n)$','$\omega(n)$'},'interpreter','latex')

subplot(2,3,5)
%实际的微分器幅频特性
[Hw,w]=freqz(hn2,1,'whole');
plot(w/pi,abs(Hw))
hold on
%理想微分器幅频特性
idealHw=w.*(w>=0&w<=pi)+(-(w-2*pi)).*(w>pi&w<=2*pi);
plot(w/pi,idealHw)
title('$|H(e^{j\omega})|$','interpreter','latex')
legend({'Real','Ideal'})

subplot(2,3,6)
plot(w/pi,angle(Hw))
title('$Arg[H(e^{j\omega})]$','interpreter','latex')
%%
%频率采样法设计微分器
clear
figure
%count和M仅用于绘图
count=1;
M=[6,16,26];
for N=M
    %理想微分器幅频特性
    k=0:1:N-1;
    alpha=N/2-1;
    %微分器的h(n)满足，h(n)=-h(N-1-n)
    Phi=(pi/2-(2*pi*k/N)*((N-1)/2)).*(k>=0&k<=alpha)+0.*(k==N/2)+(-pi/2+(2*pi*(N-k)/N)*((N-1)/2)).*(k>=alpha+2&k<=N-1);
    %对理想微分器抽样
    Hk=2*pi*k/N.*(k>=0&k<=alpha)-(2*pi*k/N-2*pi).*(k>alpha&k<=N-1);
    %进行插值
    hn = real(ifft(Hk.*exp(1i*Phi),N));
    [Hw,w]=freqz(hn,1,'whole');
    %绘图
    subplot(length(M),3,count)
    stem(2*k/N,Hk)
    hold on
    plot(w/pi,abs(Hw))
    legend({'$H(k)$','$|H(e^{j\omega})|$'},'interpreter','latex')
    title(['N=',num2str(N),'  抽样与插值'])
    subplot(length(M),3,count+1)
    stem(k,hn)
    title(['N=',num2str(N),'  冲激响应序列'])
    subplot(length(M),3,count+2)
    plot(w/pi,angle(Hw))
    title('$Arg[H(e^{j\omega})]$','interpreter','latex')
    count=count+3;
end