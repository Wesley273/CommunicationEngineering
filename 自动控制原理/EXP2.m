%%
clear
%惯性环节
G1=tf([1],[10 1]);
%一阶微分环节
G2=tf([1 0],[1]);
%比例环节
G3=tf([5],[1]);
%振荡环节
numg4=[4];
deng4=[1 8 4];
G4=tf(numg4,deng4);
%积分环节
H1=zpk([],[0],5);
numh2=[2];denh2=[1];
H2=tf(numh2,denh2);
%H2移到G4之后
nh2=conv(numh2,deng4);
dh2=conv(denh2,numg4);
H2=tf(nh2,dh2);
H3=1;
H4=zpk([1],[0],5);
%计算各个回路
sys1=series(G3,G4);
sys2=feedback(sys1,H1,+1);
sys3=series(G2,sys2);
sys4=feedback(sys3,H2);
sys5=series(G1,sys4);
sys6=parallel(H3,H4);
sys=feedback(sys5,H3)
%%
%零极点形式与多项式形式转换
clear
num=[1 2 1 4];
den=[2 1 0 3];
systf=tf(num,den)
[z,p,k]=tf2zp(num,den);
syszpk=zpk(z,p,k)
[num,den]=zp2tf(z,p,k)
systf=tf(num,den)