function [al,d]=bipolarSource(B,A)
% ------------------------------------
% 比特序列al与发送信号d(t)的生成
% B为发送比特数
% A为每个码元周期内抽样点数
% ------------------------------------
d=zeros(1,A*B);
m=1;
for i=1:A:A*B
    if rand>=0.5
        al(m)=1;
        d(i)=1;
    else
        al(m)=0;
        d(i)=-1;
    end
    m=m+1;
end
end