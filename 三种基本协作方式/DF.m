function BER1=DF(max_snr)
%产生随机序列
N=5000;
%为统计误码率做准备
BER1=zeros(1,max_snr);
for SNR=0:max_snr
    X1=rand(1,N)>0.5;
    %卷积编码
    C1=cnv(X1);
    %星座图映射，QPSK
    if rem(length(C1),2)>0
        C1=[C1,0];
    end
    B1=QpskMapping(C1);
    B1d=[];
    BB1d=[];
    M=length(B1);
    %噪声能量（已归一化）
    sig02=sqrt(1/(10^(SNR/10)));
    sig1=sqrt(1/(10^((SNR-5)/10)));
    %==========================================
    %生成加性高斯白噪声
   % N0=sig02*(randn(1,M)+j*randn(1,M));
    %N2=sig02*(randn(1,M)+j*randn(1,M));
    N1=sig1*(randn(1,M)+j*randn(1,M));
    %============================================
    %user接收
    RR2=B1+N1;
    for i=1:M
        dh = [1+j -1+j -1-j 1-j]/sqrt(2);
        D1=abs(RR2(i)*[1 1 1 1]-dh).^2;
        [minScale1 positionmin1]=min(D1);
        BB1d=[BB1d dh(positionmin1)];
    end
     CC1d=QpskInverseMapping(BB1d);
     %vitebi译码
    CC1d=CC1d(1:length(CC1d));
    [XX1d,survivor_state,cumulated_metric]=viterbi(CC1d);
    %卷积编码
    CC1=cnv(XX1d);
    %星座图映射，QPSK
    if rem(length(CC1),2)>0
        CC1=[CC1,0];
    end
    B2=QpskMapping(CC1);
    for i=1:M
        %生成加性高斯白噪声
        N0=sig02*(randn+j*randn);
        N2=sig02*(randn+j*randn);
        %生成具有瑞利分布特性的信道衰落系数
        H0=my_RayleighCH();
        H2=my_RayleighCH();
        R1=H0*B1(i)+N0;
        R2=H2*B2(i)+N2;
        %信号合成
        S1=conj(H0)*R1;
        S2=conj(H2)*R2;
        SS=S1+S2;
        %解调
        dh = [1+j -1+j -1-j 1-j]/sqrt(2);
        D1=abs(SS*[1 1 1 1]-dh).^2;
        [minScale1 positionmin1]=min(D1);
        B1d=[B1d dh(positionmin1)];
    end
    C1d=QpskInverseMapping(B1d);
    %vitebi译码
    C1d=C1d(1:length(C1d));
    [X1d,survivor_state,cumulated_metric]=viterbi(C1d);
    err1=(X1==X1d);
    tot_err1=0;
     for i=1:N
        if err1(i)==0
           tot_err1=tot_err1+1;
        end
     end
     BER1(SNR+1)=tot_err1/N;
end
    
    
        
        