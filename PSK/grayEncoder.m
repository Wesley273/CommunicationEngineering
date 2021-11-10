function symbol=grayEncoder(an,k,table)
% ------------------------------------
% 将比特序列使用格雷码编码
% an为待编码的比特序列
% k为每码元比特位数
% table为格雷码编码表
% ------------------------------------
m=1;
symbol=zeros(1,length(an)/k);
for i=1:k:length(an)-k+1
    judge=an(i:i+k-1)-table;
    %y=(an(i:i+k-1)-table)'
    %x=find(min((an(i:i+k-1)-table)')==0&max((an(i:i+k-1)-table)')==0)
    [line,row]=size(judge);
    for j=1:line
        if judge(j,:)==zeros(1,row)
            symbol(m)=j-1;
            break
        end
    end
    m=m+1;
end
end