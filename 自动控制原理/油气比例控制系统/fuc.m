function y=fuc(u)
if u < 0.0606
    y = 0.1 ;
elseif u < 0.1006
    y = 0.1 + (u-0.0606) *20;
else y = 0.9;
end
end