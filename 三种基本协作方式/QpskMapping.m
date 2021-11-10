%===============================================================================
%10/30/04 Sun Jie-ting ECUST
%===============================================================================
% QpskMapping.m
% =============
% Description: This m-file implemens the base-band QPSK modulation
% Usage:  qpsk_sequence = QpskMapping(psudo_bit_sequence)
% Inputs:
%         psudo_bit_sequence: binary sequence to be modulated
% Outputs:
%         qpsk_sequence: modulated data sequence
% Data format: the length of qpsk_sequence is a half of that of psudo_bit_sequence
% ================================================================================
function qpsk_sequence = QpskMapping(psudo_bit_sequence)
psudo_bit_sequence_length = length(psudo_bit_sequence);
bit_to_transform = [0 0];
if  mod(psudo_bit_sequence_length,2 ) == 0
    qpsk_sequence = ones(1,psudo_bit_sequence_length/2);
    for k=1:psudo_bit_sequence_length/2
        bit_to_transform = psudo_bit_sequence(2*k-1:2*k);
        if bit_to_transform == [0 0]
            qpsk_sequence(k) = 1/sqrt(2)*(-1-j);
        end
        if bit_to_transform == [1 0]
            qpsk_sequence(k) = 1/sqrt(2)*(1-j);
        end
        if bit_to_transform == [1 1]
            qpsk_sequence(k) = 1/sqrt(2)*(1+j);
        end
         if bit_to_transform == [0 1]
            qpsk_sequence(k) = 1/sqrt(2)*(-1+j);
        end
    end
else
    disp('Please input a sequence with even members');
    qpsk_sequence = 0;
end