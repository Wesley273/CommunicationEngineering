function y=deci2bin(x,t)
% ʮ������xת��Ϊ���������������������ٱ�ʾΪtλ

y=zeros(1,t);
i=1;
while x>=0&i<=t
    y(i)=rem(x,2);
    x=(x-y(i))/2;
    i=i+1;
end
y=y(t:-1:1);

