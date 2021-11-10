function result=decision(input,M,flag)
% ------------------------------------
% 对码元序列进行判决
% input为待判决的序列
% M为所需生成发送信号的个数
% flag为判决方法选择标志，0为最小欧式距离法，1为相关度量法
% ------------------------------------
m=0:1:M-1;
sm=cos(2*pi*m/M)+1j*sin(2*pi*m/M);
if flag==0
    %最小欧氏距离检测法
    distance=abs(input.'-sm);   %获取距离度量
    [~,position]=min(distance');%寻求距离度量最小值
end
if flag==1
    %最大相关度量检测法
    C=real((input.').*conj(sm));%获取相关度量
    [~,position]=max(C');       %寻求相关度量最大值
end
result=position-1;
end