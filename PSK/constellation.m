function constellation(source,MPSK)
% ------------------------------------
% QPSK星座图绘制
% source为发送码元序列
% MPSK为通过AWGN信道后的抽样输出
% ------------------------------------
figure
for i=1:1:length(source)
    switch(source(i))
        case 0
            scatter(real(MPSK(i)),imag(MPSK(i)),'r','.')
            hold on;
        case 1
            scatter(real(MPSK(i)),imag(MPSK(i)),'g','.')
            hold on;
        case 2
            scatter(real(MPSK(i)),imag(MPSK(i)),'b','.')
            hold on;
        case 3
            scatter(real(MPSK(i)),imag(MPSK(i)),'m','.')
            hold on;
    end
end
end