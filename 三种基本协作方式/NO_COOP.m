function BER2=NO_COOP(max_snr)
%�����������
N=5000;
%Ϊͳ����������׼��
BER1=zeros(1,max_snr);
for SNR=0:max_snr
    X1=rand(1,N)>0.5;
    %�������
    C1=cnv(X1);
    %����ͼӳ�䣬QPSK
    if rem(length(C1),2)>0
        C1=[C1,0];
    end
    B1=QpskMapping(C1);
    B1d=[];
    M=length(B1);
    %�����������ѹ�һ����
    sig = sqrt(1/(10^(SNR/10)));
    for i=1:M
        %���ɼ��Ը�˹������
        N0=sig*(randn+j*randn);
        %���ɾ��������ֲ����Ե��ŵ�˥��ϵ��
        H0=my_RayleighCH();
        %�����ź�
        R1=H0*B1(i)+N0;
        S1=conj(H0)*R1;
        %���
        dh = [1+j -1+j -1-j 1-j]/sqrt(2);
        D1=abs(S1*[1 1 1 1]-dh).^2;
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
     BER2(SNR+1)=tot_err1/N;
end