function table=generateGrayCode(k)
% ------------------------------------
% 格雷码生成器
% k为每码元比特位数
% ------------------------------------
base=[0;1];
joint=base;
for m=1:k-1
    joint=[zeros(size(joint,1),1),joint,ones(size(joint,1),1),joint];
    joint=[joint(1:size(joint,1),1:size(joint,2)/2);flipud(joint(1:size(joint,1),size(joint,2)/2+1:size(joint,2)))];
end
table=joint;
end