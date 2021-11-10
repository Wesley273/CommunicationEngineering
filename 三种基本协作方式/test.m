clc;
tic;
max_snr=25;
ber1=NO_COOP(max_snr);
semilogy(0:max_snr,ber1,'r');
hold on
ber2=AF(max_snr);
semilogy(0:max_snr,ber2,'k');
hold on
ber3=DF(max_snr);
semilogy(0:max_snr,ber3,'g');
legend('NO_COOP','AF','DF');
toc;