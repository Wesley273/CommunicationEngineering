function y=bin2deci(x)
% ����������ת��Ϊʮ������

t=length(x);
y=(t-1:-1:0);
y=2.^y;
y=x*y';