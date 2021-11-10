function [bitError,symbolError]=getErrorRate(result,an,source,table)
% ------------------------------------
% 对码元序列进行判决
% result为抽样判决结果
% an为发送比特序列
% source为所发送码元序列
% table为格雷码编码表
% ------------------------------------
L=length(source);
k=log2(length(table));
symbolError=length(find(result~=source))/L;
for i=1:1:L
    bit((i-1)*k+1:i*k)=table(result(i)+1,:);
end
bitError=length(find(bit~=an))/(L*k);
end