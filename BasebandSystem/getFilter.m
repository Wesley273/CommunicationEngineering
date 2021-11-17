function hn=getFilter(N,a,flag)
% ------------------------------------
% 从文件中读取滤波器
% N为滤波器阶数
% a为滚降系数，0<a≤1
% flag为系统选择标志，'0'为非匹配型，'1'为匹配型
% ------------------------------------
code=N*1000+a*100+flag;
hnall=readtable('C:\Users\Wesley\Documents\Git\MATLAB\通信原理\basebandSystem\filter.xlsx','ReadRowNames',true);
hn=table2array(hnall(num2str(code),:));
hn(N+1:length(hn))=[];
end