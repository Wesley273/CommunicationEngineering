%%
figure
i=1;
for x=0:0.0001:1
u(i)=x;
y(i)=fas(x);
i=i+1;
end
plot(u,y)
%%
%系统传递函数
G1=tf([0.1 0.03],[1 0]);
G2=tf([0.5],[0.02 1]);
G3=tf([0.5],[1,1]);
G4=tf([20],[0.1 1]);
sys1=parallel(G1,G3);
sys2=series(G1,sys1);
sys3=feedback(sys2,G4)
rlocus(sys3)