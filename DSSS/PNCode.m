function[out]=PNCode(g,state,N)
gen=dec2bin(g)-48;
M=length(gen);
curState=dec2bin(state,M-1)-48; 
for k=1:N
    out(k)=curState(M-1);
    a=rem(sum(gen(2:end).*curState),2);
    curState=[a curState(1:M-2)];
end
end


