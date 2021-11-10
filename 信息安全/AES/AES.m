function cipher_text=AES(M,K)
%  ---------------------------------------------
%   ���ݼ��ܱ�׼AES�㷨��Matlabʵ��
%   M:�������ģ�32λ16���������ַ�����ʽ
%   K:������Կ��32λ16���������ַ�����ʽ
%  ---------------------------------------------

%  ------------��һ������Կ��չ------------
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

%  ------------�ڶ�����ʮ��ѭ��------------
%��ʼ�������
temp=add_key(M,p,0);
%����ѭ��
for j=1:1:9
    %�ֽڴ���
    for s_i=[1:1:4]
        for s_j=[1:2:8]
            temp(s_j:s_j+1,s_i)=sbox(temp(s_j:s_j+1,s_i));
        end
    end
    %����λ
    temp=row_trans(temp,0);
    %�л��
    M(1:8)=mix_col(temp(:,1));
    M(9:16)=mix_col(temp(:,2));
    M(17:24)=mix_col(temp(:,3));
    M(25:32)=mix_col(temp(:,4));
    %�������
    temp=add_key(M,p,j);
end
%��ʮ��
%�ֽڴ���
for s_i=[1:1:4]
    for s_j=[1:2:8]
        temp(s_j:s_j+1,s_i)=sbox(temp(s_j:s_j+1,s_i));
    end
end
%�б任
temp=row_trans(temp,0);
%�������
M=[temp(:,1)',temp(:,2)',temp(:,3)',temp(:,4)'];
temp=add_key(M,p,10);

%  ------------�����������------------
cipher_text=[temp(:,1)',temp(:,2)',temp(:,3)',temp(:,4)'];
end