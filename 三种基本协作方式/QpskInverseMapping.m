%====================================================================
%7/12/08 ZHANGSONG
%====================================================================
%QPSK½âµ÷
function bit_sequence=QpskInverseMapping(qpsk_sequence)
bit_sequence=[];
qpsk_sequence_length=length(qpsk_sequence);
for i=1:qpsk_sequence_length
    if qpsk_sequence(i)== 1/sqrt(2)*(-1-j)
        bit_sequence=[bit_sequence 0 0];
    end
    if qpsk_sequence(i)== 1/sqrt(2)*(1-j)
        bit_sequence=[bit_sequence 1 0];
    end
    if qpsk_sequence(i)== 1/sqrt(2)*(1+j)
        bit_sequence=[bit_sequence 1 1];
    end
    if qpsk_sequence(i)== 1/sqrt(2)*(-1+j)
        bit_sequence=[bit_sequence 0 1];
    end
end