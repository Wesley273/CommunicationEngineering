function data=add_key(M,KEYs,num)
%  ---------------------------------------------
%   轮密相加子函数
%   M:当前轮状态矩阵展成的字符串
%   KEYs:扩展密钥矩阵
%   nums:轮数
%  ---------------------------------------------
    key(1,:)=KEYs(1+num*4,:);
    key(2,:)=KEYs(2+num*4,:);
    key(3,:)=KEYs(3+num*4,:);
    key(4,:)=KEYs(4+num*4,:);
    %轮密相加
    temp1=dec2hex(bitxor(hex2dec(M(1:8)),hex2dec(key(1,:))));
    temp6(:,1)=[zeros(1,8-length(temp1)),temp1];
    temp2=dec2hex(bitxor(hex2dec(M(9:16)),hex2dec(key(2,:))));
    temp6(:,2)=[zeros(1,8-length(temp2)),temp2];
    temp3=dec2hex(bitxor(hex2dec(M(17:24)),hex2dec(key(3,:))));
    temp6(:,3)=[zeros(1,8-length(temp3)),temp3];
    temp4=dec2hex(bitxor(hex2dec(M(25:32)),hex2dec(key(4,:))));
    temp6(:,4)=[zeros(1,8-length(temp4)),temp4];
    temp6(abs(temp6)==0)='0';
    data=temp6;
end