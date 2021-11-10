function y=xtime(b)
%  ---------------------------------------------
%   GF(2^8)上的乘二子函数
%   b:待操作的字节
%  ---------------------------------------------
a=dec2bin(hex2dec(b));
c=[zeros(1,8-length(a)),a];
c(abs(c)==0)='0';
switch c(1)
    case  '0'
        temp='00';
    case '1'
        temp='FF';
end

d=dec2hex(bitxor(bin2dec(strcat(c(2:8),'0')),bitand(hex2dec('1B'),hex2dec(temp))));
b=[zeros(1,2-length(d)),d];
b(abs(b)==0)='0';
y=b;
end