%%
%滤波器参数保存
clear
i=1;
for flag=[0,1]
    for N=35:10:55
        for a=0.1:0.1:1
            B=10;
            A=4;
            Tc=4;
            Ts=1;
            tau=(N-1)/2;
            SNR=5;
            [al,hn,d,x,y,r,sample,judge,error]=basebandSystem1(flag,A,B,Tc,Ts,N,a,SNR);
            code=N*1000+a*100+flag;
            hnall(i,:)=[code,hn,zeros(1,55-length(hn))];
            i=i+1;
        end
    end
end
xlswrite('C:\Users\Wesley\Documents\Git\MATLAB\通信原理\basebandSystem\filter.xlsx',hnall);