function cipher_text=AES(M,K)
%  ---------------------------------------------
%   数据加密标准AES算法的Matlab实现
%   M:输入明文，32位16进制数，字符串格式
%   K:输入密钥，32位16进制数，字符串格式
%  ---------------------------------------------

%  ------------第一步：密钥扩展------------
p(1,:)=K(1:8);
p(2,:)=K(9:16);
p(3,:)=K(17:24);
p(4,:)=K(25:32);
for i=1:1:10
    temp=dec2hex(bitxor(hex2dec(p(1+(i-1)*4,:)),g_function(p(4*i,:),i)));
    temp=[zeros(1,8-length(temp)),temp];
    temp(abs(temp)==0)='0';
    p(1+i*4,:)=temp;
    for j=2:1:4
        temp=dec2hex(bitxor(hex2dec(p(j+(i-1)*4,:)),hex2dec(p(j+i*4-1,:))));
        temp=[zeros(1,8-length(temp)),temp];
        temp(abs(temp)==0)='0';
        p(j+i*4,:)=temp;
    end
end

%  ------------第二步：十轮循环------------
%初始轮密相加
temp=add_key(M,p,0);
%九轮循环
for j=1:1:9
    %字节代换
    for s_i=[1:1:4]
        for s_j=[1:2:8]
            temp(s_j:s_j+1,s_i)=sbox(temp(s_j:s_j+1,s_i));
        end
    end
    %行移位
    temp=row_trans(temp,0);
    %列混合
    M(1:8)=mix_col(temp(:,1));
    M(9:16)=mix_col(temp(:,2));
    M(17:24)=mix_col(temp(:,3));
    M(25:32)=mix_col(temp(:,4));
    %轮密相加
    temp=add_key(M,p,j);
end
%第十轮
%字节代换
for s_i=[1:1:4]
    for s_j=[1:2:8]
        temp(s_j:s_j+1,s_i)=sbox(temp(s_j:s_j+1,s_i));
    end
end
%行变换
temp=row_trans(temp,0);
%轮密相加
M=[temp(:,1)',temp(:,2)',temp(:,3)',temp(:,4)'];
temp=add_key(M,p,10);

%  ------------第三步：输出------------
cipher_text=[temp(:,1)',temp(:,2)',temp(:,3)',temp(:,4)'];
end