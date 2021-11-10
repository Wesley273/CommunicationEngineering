function[N,Hk,wk]=dir2fs(b)
%表达式参加课本P256
%只需求出其DFT及即可得到频率抽样型的表达式
N=length(b);
Hk=fft(b);
k=0:N-1;
wk=exp(2*pi*1i/N).^k;