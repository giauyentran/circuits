clear; clf;

% Colors for plots
taupe_gray = [156 151 154]./255;
bittersweet = [255 108 140]./255;
light_sea_green = [16 161 156]./255;
black = [0 0 0]./255;
white = [255 255 255]./255;

load data/lab4_exp3_data_rev2.mat

% In your report, include a semilog plot showing all three output 
% current-voltage (drain) characteristics (with no fits).

semilogy(exp3_ch2_V_100nA, exp3_ch2_I_100nA, '.', Color=black)
hold on
semilogy(exp3_ch2_V_1uA, exp3_ch2_I_1uA, '.', Color=bittersweet)
semilogy(exp3_ch2_V_100uA, exp3_ch2_I_100uA, '.', Color=light_sea_green)

title("Drain Current-Voltage Characteristic")
xlabel("Voltage (V)")
ylabel("Current (A)")

lgd = legend('Weak','Moderate','Strong');
title(lgd,'Inversion','FontSize', 10)

% From each drain characteristic, extract values of the Early voltage, 
% the Early effect resis- tance (ro), the transistor’s on resistance (ron), 
% and its intrinsic gain (i.e., the ratio ro/ron). In your report, include 
% a table of these values for each input current level

% ohmic fits
[fweak,lweak,mweak,bweak,nweak] = linefit(exp3_ch2_V_100nA, exp3_ch2_I_100nA, 40e-4);
[fmoderate,lmoderate,mmoderate,bmoderate,nmoderate] = linefit(exp3_ch2_V_1uA, exp3_ch2_I_1uA, 10e-4);
[fstrong,lstrong,mstrong,bstrong,nstrong] = linefit(exp3_ch2_V_100uA, exp3_ch2_I_100uA, 10e-4);

% Ohmic Fits Sanity Check
% semilogy(exp3_ch2_V_100nA, exp3_ch2_V_100nA*mweak+bweak, '-', Color=black)
% semilogy(exp3_ch2_V_1uA, exp3_ch2_V_1uA*mmoderate+bmoderate, '-', Color=black)
% semilogy(exp3_ch2_V_100uA, exp3_ch2_V_100uA*mstrong+bstrong, '-', Color=black)

% sat fits
[fweaks,lweaks,mweaks,bweaks,nweaks] = linefit(exp3_ch2_V_100nA(50:end), exp3_ch2_I_100nA(50:end), 10e-3);
[fmoderates,lmoderates,mmoderates,bmoderates,nmoderates] = linefit(exp3_ch2_V_1uA(50:end), exp3_ch2_I_1uA(50:end), 5e-3);
[fstrongs,lstrongs,mstrongs,bstrongs,nstrongs] = linefit(exp3_ch2_V_100uA(70:end), exp3_ch2_I_100uA(70:end), 10e-4);

% Sat Fits Sanity Check
% semilogy(exp3_ch2_V_100nA, exp3_ch2_V_100nA*mweaks+bweaks, 'k-')
% semilogy(exp3_ch2_V_1uA, exp3_ch2_V_1uA*mmoderates+bmoderates, 'r-')
% semilogy(exp3_ch2_V_100uA, exp3_ch2_V_100uA*mstrongs+bstrongs, 'b-')

% Extracted Values

Isat_weak = bweaks;
Isat_moderate = bmoderates;
Isat_strong = bstrongs;

ro_weak = 1/mweaks;
ro_moderate = 1/mmoderates;
ro_strong = 1/mstrongs;

va_weak = ro_weak * Isat_weak;
va_moderate = ro_moderate * Isat_moderate;
va_strong = ro_strong * Isat_strong;

ron_weak = 1/mweak;
ron_moderate = 1/mmoderate;
ron_strong = 1/mstrong;

gain_weak = ro_weak/ron_weak;
gain_moderate = ro_moderate/ron_moderate;
gain_strong = ro_strong/ron_strong;











