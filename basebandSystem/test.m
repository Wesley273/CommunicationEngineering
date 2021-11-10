%%
%使用直接设计方式得到滤波器
clear
flag=1;
B=1000;
A=64;
Tc=4;
Ts=1;
N=35;
tau=(N-1)/2;
a=0.2;
SNR=20000;
[al,hn,d,x,y,r,sample,judge,error]=basebandSystem(flag,A,B,Tc,Ts,N,a,SNR);
%星座图绘制
%constellationGraph(al,sample);
%信号测试点绘图
figure
toplot=hn;
n=0:1:length(toplot)-1;
stem(n,toplot)
title(['滤波器冲激响应 α= ',num2str(a), ' N= ',num2str(35)])
xlabel('n')
ylabel('h(n)')
%%
%误比特率测试
clear
figure
i=1;
BOTTOM=-15;
DELTA=1;
TOP=18;
for SNR=BOTTOM:DELTA:TOP
    flag=1;
    B=1000;
    A=4;
    Tc=4;
    Ts=1;
    N=35;
    tau=(N-1)/2;
    a=0.35;
    [al,hn,d,x,y,r,sample,judge,error]=basebandNoEye(flag,A,B,Tc,Ts,N,a,SNR);
    errorall(i)=error;
    i=i+1;
end
SNR=BOTTOM:DELTA:TOP;
semilogy(SNR,errorall,'Marker','*')
grid on;
hold on;
m=BOTTOM:0.01*DELTA:TOP;
P=qfunc(sqrt(2*10.^(m/10)));
semilogy(m,P)
legend('实测值','理论值')
title('误比特率分析')
xlabel('SNR/dB')
ylabel('误比特率')
%%
%滤波器第一零点带宽与阻带最小衰减测试
clear
close all
B=1000;
A=4;
Tc=4;
Ts=1;
j=1;
SNR=200000;
for flag=[1,0]
    if flag==1
        filterName=['平方根升余弦滚降滤波器'];
    else
        filterName=['升余弦滚降滤波器'];
    end
    for N=35:10:55
        i=1;
        tau=(N-1)/2;
        for a=0.1:0.1:1
            [~,hn,~,~,~,~,~,~,~]=basebandNoEye(flag,A,B,Tc,Ts,N,a,SNR);
            [X,w]=freqz(hn,1,5000000,'whole');
            BWPosition=find(abs(X)<0.00001,1,'first');
            BW(j,i)=w(BWPosition)/(2*pi);
            As(j,i)=20*log10(max(abs(X(BWPosition:round(length(X)/2))))/max(abs(X)));
            i=i+1;
        end
        %--------------------------------------------------------
        %滤波器第一零点带宽可视化
        figure
        %理论值
        a=0:0.01:1;
        FM=(1+a)/8;
        plot(a,FM,'Linewidth',1.5)
        hold on;
        %拟合值
        a=0.1:0.1:1;
        p=polyfit(a,BW(j,:),1);
        BWEXP=p(1)*a+p(2);
        plot(a,BWEXP,'Linewidth',1.5)
        hold on;
        %实测值
        scatter(a,BW(j,:),500,'.')
        title([filterName,'第一零点带宽与 α 关系 N = ',num2str(N)])
        legend('理论值','最小二乘拟合','实测值','Location','Northwest')
        xlabel('α')
        ylabel('BW/Hz')
        %--------------------------------------------------------
        %滤波器阻带最小衰减可视化
        %实测值
        figure
        a=0.1:0.1:1;
        scatter(a,abs(As(j,:)),500,'.')
        hold on;
        %拟合值
        a=0.1:0.1:1;
        p=polyfit(a,abs(As(j,:)),1);
        BWEXP=p(1)*a+p(2);
        plot(a,BWEXP,'Linewidth',1.5)
        title([filterName,'阻带最小衰减与 α 关系 N = ',num2str(N)])
        legend('实测值','最小二乘拟合','Location','Northwest')
        xlabel('α')
        ylabel('As/dB')
        %换行
        j=j+1;
    end
end
%%
%使用文件读取方式得到滤波器
clear
close all
flag=1;
B=1000;
A=4;
N=55;
tau=(N-1)/2;
a=0.5;
SNR=20;
[al,hn,d,x,y,r,sample,judge,error]=baseband(flag,A,B,N,a,SNR);
%星座图绘制
%constellationGraph(al,sample);
%信号测试点绘图
figure
toplot=hn;
n=0:1:length(toplot)-1;
stem(n,toplot)
title(['平方根升余弦滚降滤波器冲激响应 α= ',num2str(a), ' N= ',num2str(35)])
xlabel('n')
ylabel('h(n)')