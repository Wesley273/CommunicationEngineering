function S=row_trans(temp,flag)
%  ---------------------------------------------
%   行移位子函数
%   temp:某轮的状态矩阵
%   flag:'1'代表右移，'0'代表左移
%  ---------------------------------------------
for i=[1:2:8]
    k=(i-1)/2;
    for j=[0:1:1]
        str=temp(i+j,:);
        if(flag)
            str=[str(end-k+1:end),str(1:end-k)];
        else
            str=[str(k+1:end),str(1:k)];
        end
        S(i+j,:)=str;
    end
end
end