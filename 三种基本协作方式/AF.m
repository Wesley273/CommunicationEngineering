function BER1=AF(max_snr)
%�����������
N=5000;
%Ϊͳ����������׼��
BER1=zeros(1,max_snr);
for SNR=0:max_snr
    X1=rand(1,N)>0.5;
    %������� 
    C1=cnv(X1);
    if rem(length(C1),2)>0
        C1=[C1,0];
    end
    %����ͼӳ�䣬QPSK
    B1=QpskMapping(C1);
    B1d=[];
    M=length(B1);
    %�����������ѹ�һ����
    sig02 = sqrt(1/(10^(SNR/10)));
    sig1=sqrt(1/(10^((SNR-5)/10)));
    %==========================================
    for i=1:M
        %���ɼ��Ը�˹������
        N0=sig02*(randn+j*randn);
        N2=sig02*(randn+j*randn);
        N1=sig1*(randn+j*randn);
       %���ɾ��������ֲ����Ե��ŵ�˥��ϵ��
        H0=my_RayleighCH();
        H2=my_RayleighCH();
        G=sqrt(0.5/(0.5+sig1*sig1));
        %�����ź�
        R1=H0*B1(i)+N0;
        R2=H2*G*(B1(i)+N1)+N2;
        %�źźϳ�
        S1=conj(H0)*R1;
        S2=conj(H2)*R2;
        SS=S1+S2;
        %���
        dh = [1+j -1+j -1-j 1-j]/sqrt(2);
        D1=abs(SS*[1 1 1 1]-dh).^2;
        [minScale1 positionmin1]=min(D1);
        B1d=[B1d dh(positionmin1)];
    end
    C1d=QpskInverseMapping(B1d);
    %vitebi����
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

    