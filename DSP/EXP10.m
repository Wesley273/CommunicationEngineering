%%
%奇谐分量和偶谐分量的分解
N=11;
n=0:1:N-1;
xn=10*(0.8).^n;
[xec, xoc] = circevod(xn);

figure
subplot(3,1,1)
stem(n,xn)
title(['$x(n)$'],'interpreter','latex')

subplot(3,1,2)
stem(n,xec)
title(['$x_{ep}(n)$'],'interpreter','latex')

subplot(3,1,3)
stem(n,xoc)
title(['$x_{op}(n)$'],'interpreter','latex')
%%
%检验实序列的性质
N=11;
n=0:1:N-1;
xn=10*(0.8).^n;
[xec, xoc] = circevod(xn);
X=fft(xn);

figure
subplot(2,2,1)
stem(n,real(X))
title(['$Re[X(k)]$'],'interpreter','latex')

subplot(2,2,2)
stem(n,imag(X))
title(['$Im[X(k)]$'],'interpreter','latex')

subplot(2,2,3)
stem(n,fft(xec))
title(['$DFT[x_{ep}(n)]$'],'interpreter','latex')

subplot(2,2,4)
stem(n,-1i*fft(xoc))
title(['$DFT[x_{op}(n)]$'],'interpreter','latex')
%%
function [xec, xoc] = circevod(x)
% signal decomposition into circular-even and circular-odd parts
% --------------------------------------------------------------
% [xec, xoc] = circevod(x)
%
if any(imag(x) ~= 0)
error('x is not a real sequence')
end
N = length(x); n = 0:(N-1);
xec = 0.5*(x + x(mod(-n,N)+1)); xoc = 0.5*(x - x(mod(-n,N)+1));
end