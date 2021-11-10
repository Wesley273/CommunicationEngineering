%%
%---------------Playfair编写---------------
clear all
close all
%加密矩阵如下：
%   [H,A,R,P,S;
%    I,C,O,D,B;
%    E,F,G,K,L;
%    M,N,Q,T,U;
%    V,W,X,Y,Z]
KEY=[8,1,18,16,19;
    9,3,15,4,2;
    5,6,7,11,12;
    13,14,17,20,21;
    22,23,24,25,26];
input='liangzitongxinbaomijishudedanshenghekuaisufazhanzhuyaoqujueyuyixialianggeyinsuajingdianbaomitongxinmianlinzhesangenanyichedijiejuedeguanjianwentijimiyaoxieshangshenfenshibiehejiantingjiancezhexiewentideyouxiaojiejuexuyaoxinjishubzaiduixinjishudetansuozhongrenmenfaxianleliangzineizaideanquantexingjiqikenengdeyingyong';
%input='speciallity';
encrypt='';
%预处理
input=strrep(input,'j','i');
i=1;
while(1)
    if i==length(input)
        break;
    end
    if input(i)==input(i+1)
        input=[input(1:i) 'q' input(i+1:end)];
    end
    i=i+1;
end
if rem(length(input),2)~=0
    input=strcat(input,'q');
end
%加密处理
for i=1:2:length(input)-1
    char1=abs(input(i))-96;
    char2=abs(input(i+1))-96;
    [row1,col1]=find(KEY==char1);
    [row2,col2]=find(KEY==char2);
    if row1==row2
        out1=KEY(row1,rem(col1,5)+1);
        out2=KEY(row2,rem(col2,5)+1);
    end
    if col1==col2
        out1=KEY(rem(row1,5)+1,col1);
        out2=KEY(rem(row2,5)+1,col2);
    end
    if row1~=row2 && col1~=col2
        out1=KEY(row1,col2);
        out2=KEY(row2,col1);
    end
    encrypt=[encrypt char(out1+96) char(out2+96)]
end