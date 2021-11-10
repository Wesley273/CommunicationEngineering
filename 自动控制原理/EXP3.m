%%
%2.12(b)
clear
syms G1 G2 G3 G4
%----------求解C/R----------
G1=G1*G2;                   %比较点后移
G23=G2+G3;                  %进行并联
G5=G23;                     %比较点后移
CR=(G1+G23)*(G4/(1+G4*G5)); %求解G234构成的主反馈回路系统闭环传递函数
pretty(CR)                  %输出
%----------求解C/N----------
CN=G4/(1+G23*G4);           %求解G23构成的主反馈回路系统闭环传递函数
pretty(CN)                  %输出
%%
%2.15(d)
clear
syms a b c d e f g h l
%----------求解C/R1----------
L1=-e*g;
L2=-c*f;
L3=-b*c*d*e*h;
L4=-a*d*e*h;
delta0=1-L1-L2-L3-L4+L1*L2; %求解梅森公式所需参数
p1=b*c*d*e;delta1=1;
p2=a*d*e;delta2=1;
p3=b*c;delta3=1+e*g;
p4=a;delta4=1+e*g;          %求解各前向通路增益及代数余子式
CR1=(1/delta0)*(p1*delta1+p2*delta2+p3*delta3+p4*delta4);%求解闭环传递函数
CR1=simplify(CR1);          %形式化简
pretty(CR1)                 %输出
%----------求解C/R2----------
p1=l*e;delta1=1+c*f;        %这里Δ与上相同，故直接求解pi及代数余子式
p2=-e*h*a*l;delta2=1;
p3=-e*h*b*c*l;delta3=1;
CR2=(1/delta0)*(p1*delta1+p2*delta2+p3*delta3);
CR2=simplify(CR2);
pretty(CR2)
%%
%矩阵形式解系统函数
clear;
syms G1 G2 H R N;
P=[1 0 H;-G1 1 0;0 G2 1];
Q=[R;N;0];
X=P\Q;
pretty(X)
%%
%2.15(d)矩阵方法求解
clear
syms a b c d e f g h l R1 R2
P=[ 1 0 0 0 h 0;
    b -1 -f 0 0 0;
    a c -1 0 0 0;
    0 0 -d 1 g 0;
    0 0 0 e -1 0;
    0 0 1 0 1 -1];
%R2=0;
R1=0;
Q=[R1;0;0;R2*l;0;0];
X=P\Q;
pretty(X(6));
%%
%2.11(d)
clear
syms G1 G2 G3 G4 H1 H2 H3
H4=H2/(G1*G3);  %对H2进行比较点前移及引出点后移
G5=G3/(1+G3*H3);%求解G3、H3回路构成的子系统
G6=G1/(1+G1*H1);%求解G1、H1回路构成的子系统
G7=G2*G5*G6;    %进行串联
CR=G7/(1+G7*H4);%G7构成的主反馈回路系统闭环传递函数
CR=simplify(CR);%形式化简
pretty(CR)      %输出
%%
%2.15(c)
clear
syms a b c d e f g h
L1=a*f;
L2=g*b;
L3=c*h;
L4=e*f*g*h;
delta0=1-L1-L2-L3-L4+L1*L3;
p1=a*b*c*d;delta1=1;
p2=e*d;delta2=1-L2;
CR=(1/delta0)*(p1*delta1+p2*delta2);
CR=simplify(CR);
pretty(CR)
%%
clear
syms a b c d e f g h l R1 R2
P=[0 0 0 0 -h 0;
   b 0 -f 0 0 0;
   a c 0 0 0 0;
   0 0 d 0 -g 0;
   0 0 0 e 0 0;
   0 0 1 0 1 0;];
Q=[1 0;
   0 0;
   0 0;
   0 l;
   0 0;
   0 0;];
E=eye(size(P));
result=(E-P)\Q;
pretty(result)