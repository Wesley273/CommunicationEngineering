%====================================================================
%7/12/08 ZHANGSONG
%====================================================================
%根据论文《A new cooperative diversity scheme for next 
%generation wireless network》编写程序
%发送数据部分
%Transmiter.m
%=======
function BER1=xxx(SNR_interuser,max_snr)
%产生随机序列
N=1024;
%为统计误码率做准备
%max_snr=20;
BER1=zeros(1,max_snr);
%BER2=zeros(1,max_snr);
sig_interuser=sqrt(1/(10^(SNR_interuser/10)));
%SNR_interuser=100          
for SNR=0:max_snr
    %U1和U2分别代表两天线发送的数据
    U1=rand(1,N)>0.5;
   % U2=rand(1,N)>0.5;
    %卷积编码
    G=[0 0 1 0 1 0 0 1;0 0 0 0 0 0 0 1;1 0 0 0 0 0 0 1];
    C1=cnv(U1,G);
    %C2=cnv(U2,G);
    %星座图映射，QPSK
    if rem(length(C1),2)>0
        C1=[C1,0];
    end
   % if rem(length(C2),2)>0
    %    C2=[C2,0];
   % end 
    B1=QpskMapping(C1);
   % B2=QpskMapping(C2);
    B1d=[];
    %B2d=[];
    M=length(B1);
    %噪声能量（已归一化）
    sig = sqrt(1/(10^(SNR/10)));
    %==========================================
    for i=1:M
        S1o=B1(i);
        %S2o=B2(i);
        %生成加性高斯白噪声
        Ndo=sig*(randn+j*randn);
       %生成具有瑞利分布特性的信道衰落系数
        H1do=my_RayleighCH();
        H2do=my_RayleighCH();
        %the received signal at the destination user during the odd time slots
       % Rdo=S1o*H1do+S2o*H2do+Ndo;
    %===========================================    
        %the received signal at U1 and U2
         N12o=sig_interuser*(randn+j*randn);
        % N21o=sig_interuser*(randn+j*randn);
        % R21o=S2o+N21o;
         R12o=S1o+N12o;
    %============================================
        %coherent detection of U1 and U2
        %SS2o=R21o;
        SS1o=R12o;
        dh = [1+j -1+j -1-j 1-j]/sqrt(2);
        %D1=abs(SS2o*[1 1 1 1]-dh).^2;
        D2=abs(SS1o*[1 1 1 1]-dh).^2;
        %[minScale1 positionmin1]=min(D1);
        [minScale2 positionmin2]=min(D2);
        %the decision results at U1 and U2 at even time
       % S2od=dh(positionmin1);
        S1od=dh(positionmin2);
    %===========================================
     %the received signal at the destination user during the odd time slots
        H1de=my_RayleighCH();
        H2de=my_RayleighCH();
        Nde=sig*(randn+j*randn);
       % Rde=-conj(S2od)*H1de+conj(S1od)*H2de+Nde;
    %===========================================
     %coherent detection of destination
     %   BB1=conj(H1do)*H1do*S1o+H2de*conj(H2de)*S1od+conj(H1do)*Ndo...
      %      +conj(H1do)*H2do*S2o-H2de*conj(H1de)*S2od+H2de*conj(Nde);
      %  BB2=conj(H2do)*H1do*S1o-H1de*conj(H2de)*S1od+conj(H2do)*Ndo...
       %    +conj(H2do)*H2do*S2o+H1de*conj(H1de)*S2od-H1de*conj(Nde);
        BB1=conj(H1do)*H1do*S1o+H2de*conj(H2de)*S1od+conj(H1do)*Ndo...
            +H2de*conj(Nde);
       % BB2=conj(H2do)*Ndo...
        %   +conj(H2do)*H2do*S2o+H1de*conj(H1de)*S2od-H1de*conj(Nde);
        dh = [1+j -1+j -1-j 1-j]/sqrt(2);
        D1=abs(BB1*[1 1 1 1]-dh).^2;
       % D2=abs(BB2*[1 1 1 1]-dh).^2;
        [minScale1 positionmin1]=min(D1);
        %[minScale2 positionmin2]=min(D2);
        %the decision results at U1 and U2
        B1d=[B1d dh(positionmin1)];
        %B2d=[B2d dh(positionmin2)];
    end
    C1d=QpskInverseMapping(B1d);
   % C2d=QpskInverseMapping(B2d);
    C1d=C1d(1:length(C1d)-1);
   % C2d=C2d(1:length(C2d)-1);
    [U1d,survivor_state,cumulated_metric]=viterbi(C1d,G);
   % [U2d,survivor_state,cumulated_metric]=viterbi(C2d,G);
    err1=(U1==U1d);
    %err2=(U2==U2d);
    tot_err1=0;
    %tot_err2=0;
    for i=1:N
        if err1(i)==0
           tot_err1=tot_err1+1;
        end
     %    if err2(i)==0
     %      tot_err2=tot_err2+1;
     %    end 
    end
    BER1(SNR+1)=tot_err1/N;
   % BER2(SNR+1)=tot_err2/N;
end
%===============================================
 %semilogy(0:max_snr,BER1,'r');
 %xlabel('SNR');
 %ylabel('Symbol Error Ratio(SER)');
% title('U1');
% hold on;
% BER_ALamouti=my_Alamouti(max_snr);
% hold on;
% SER_nodiversity=no_diversity(max_snr);
% legend('xxx方案','Alamouti方案','没有采用分集');
 %figure
 %semilogy(0:max_snr,BER2);
 %xlabel('SNR');
 %ylabel('Symbol Error Ratio(SER)');
 %title('U2');
toc;