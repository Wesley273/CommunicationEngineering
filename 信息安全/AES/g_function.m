function W1=g_function(W,num)
%  ---------------------------------------------
%   密钥扩展中的g函数
%   W:输入的字，长度8字节
%   nums:轮数
%  ---------------------------------------------
RCON=['01000000';'02000000';'04000000';'08000000';'10000000';'20000000';'40000000';'80000000';'1b000000';'36000000'];
B0=sbox(W(1:2));
B1=sbox(W(3:4));
B2=sbox(W(5:6));
B3=sbox(W(7:8));
W1=strcat(B1,B2,B3,B0);
W1=bitxor(hex2dec(RCON(num,:)),hex2dec(W1));
end

