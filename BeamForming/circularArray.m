%%%%%%%%%%%%%          4.0版本
%%%%%%%%%%%%%          均匀圆阵,完整版，包括水平、俯仰与三维

clear;
close all;
clc;

N = 36;
c = 300000000;
f = 5000000000;
lambda = c/f;
R = 0.15;
theta = linspace(0,180,361);
phi = linspace(0,360,361);
phi0 = 180;
theta0 = 90;
k = 2*pi/lambda;
phin = 2*pi/N;

F1 = zeros(361,361);

for ii = 1:361
    for jj = 1:361
        for n = 1:N
            F1(ii,jj) = F1(ii,jj) + exp(1j*k*R*(cosd(phi0-n*phin*180/pi)*sind(theta0)-cosd(phi(jj)-n*phin*180/pi).*sind(theta(ii)))); 
        end
    end
end

F1 = 20*log10(abs(F1)/max(max(abs(F1))));

plot(phi,F1(theta0*2+1,:));
xlabel('水平角 \phi °');
ylabel('增益大小 (dB)');
title('圆阵DBF');
xlim([0,360]);
ylim([-25,0]);
grid;

figure(2)
plot(theta,F1(:,phi0));
xlabel('俯仰角 \theta °');
ylabel('增益大小 (dB)');
title('圆阵DBF');
xlim([0,180]);
ylim([-25,0]);
grid;

figure(3)
mesh(phi,theta,F1)
xlabel('水平角 \phi °');
ylabel('俯仰角 \theta ° ');
zlabel('增益大小 (dB)');
title('圆环阵DBF三维视图');