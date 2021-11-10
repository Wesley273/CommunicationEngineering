%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%7/16/2008  ZHANGSONG
%my_RayleighCH.m
%�������ġ��Ľ���JAKESģ����OFDMϵͳ�еķ��桷��д���ŵ�ģ��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function H=my_RayleighCH()
N=30;
nn=1:N;
S=(rand(1,N)-0.5)*2*pi;
F=(rand(1,N)-0.5)*2*pi;
G=(rand(1,N)-0.5)*2*pi;
A=(2*pi*N-pi+S)/4*N;
C1=cos(G).*cos(2*pi*cos(A)+F);
C2=sin(G).*cos(2*pi*cos(A)+F);
H1=sum(C1)*2/sqrt(N);
H2=sum(C2)*2/sqrt(N);
H=H1+j*H2;

