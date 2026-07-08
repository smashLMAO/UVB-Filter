
fs = 15000000; 

f_center = 4625000;                
f_pass = [f_center-10000, f_center+10000]; 
f_stop = [f_center-25000, f_center+25000]; 

rp = 1;   
rs = 60; 

[n, wn] = ellipord(f_pass/(fs/2), f_stop/(fs/2), rp, rs);

[b, a] = ellip(n, rp, rs, wn, 'bandpass');

[h, f] = freqz(b, a, 16384, fs);
magnitude_db = 20*log10(abs(h));

figure;
plot(f/1000, magnitude_db, 'LineWidth', 1.5);
grid on;
xlim([(f_center-50000)/1000, (f_center+50000)/1000]); 
ylim([-80, 5]);
xlabel('Frekvencia (kHz)');
ylabel('Magnitúdó (dB)');
title('Tervezett 4625 kHz-es sávszűrő karakterisztikája');


filterobj = dfilt.df2t(b, a);
fvtool(filterobj); 
