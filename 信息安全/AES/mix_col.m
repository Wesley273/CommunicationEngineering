function y=mix_col(s)
%  ---------------------------------------------
%   列混淆子函数
%   s:所需操作的列，长度4字节
%  ---------------------------------------------
s=s';
s0=s(1:2);
s1=s(3:4);
s2=s(5:6);
s3=s(7:8);
%只需实现乘2子函数，再进行拆分即可
a=dec2hex(bitxor(bitxor(bitxor(bitxor(hex2dec(xtime(s0)),hex2dec(xtime(s1))),hex2dec(s1)),hex2dec(s2)),hex2dec(s3)));
b=[zeros(1,2-length(a)),a];
b(abs(b)==0)='0';
y(1:2)=b;
a=dec2hex(bitxor(bitxor(bitxor(bitxor(hex2dec(s0),hex2dec(xtime(s1))),hex2dec(xtime(s2))),hex2dec(s2)),hex2dec(s3)));
b=[zeros(1,2-length(a)),a];
b(abs(b)==0)='0';
y(3:4)=b;
a=dec2hex(bitxor(bitxor(bitxor(bitxor(hex2dec(s0),hex2dec(s1)),hex2dec(xtime(s2))),hex2dec(xtime(s3))),hex2dec(s3)));
b=[zeros(1,2-length(a)),a];
b(abs(b)==0)='0';
y(5:6)=b;
a=dec2hex(bitxor(bitxor(bitxor(bitxor(hex2dec(xtime(s0)),hex2dec(s0)),hex2dec(s1)),hex2dec(s2)),hex2dec(xtime(s3))));
b=[zeros(1,2-length(a)),a];
b(abs(b)==0)='0';
y(7:8)=b;
end
