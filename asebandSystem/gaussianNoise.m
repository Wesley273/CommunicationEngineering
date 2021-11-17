function AWGN=gaussianNoise(SNR,Eb,L)
% ------------------------------------
% 零均值高斯白噪声的生成
% SNR为给定信噪比
% Eb为平均每比特能量
% L为所需高斯随机序列长度
% ------------------------------------
sigma=sqrt(Eb/(2*10^(SNR/10)));
AWGN=normrnd(0,sigma,1,L);
end