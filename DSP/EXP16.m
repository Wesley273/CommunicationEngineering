%%
clear
b=[1,0,0,0];
a=[1,13/24,5/8,1/3];
n=0:63;
fprintf('*******滤波器全极点格型形式*******')
K=dir2latc(a)
figure;
h=impz(b,a,n);
u=dstep(b,a,n);
subplot(2,1,1),stem(n,h,'.');
title('单位冲激响应');
subplot(2,1,2),stem(u,'.');
title('单位阶跃响应');