clear;clc;close all;
Fin = [1e3,5e3,10e3,50e3,100e3,200e3,500e3,995e3];
FFT_point = [256,512,1024,2048,4096,8192,16384,65536,262144,2^20,2^21,2^22];
Fsample = 2e6;
Fnper = zeros(length(Fin),length(FFT_point));
Fcin = zeros(length(Fin),length(FFT_point));
for i = 1:length(Fin)
    for j = 1:length(FFT_point)
        Fnper(i,j) = Fin(i)*FFT_point(j)/Fsample;
        Fnper(i,j) = round(Fnper(i,j));
        if mod(Fnper(i,j),2) == 0
            Fnper(i,j) = Fnper(i,j) -1 ;
        end
        if Fnper(i,j) > 0
            Fcin(i,j) = Fsample*Fnper(i,j)/FFT_point(j);
        end
    end
end
writematrix(Fcin,'Fcin.xlsx')
writematrix(Fnper,'Fnper.xlsx')
