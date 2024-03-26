% plot Vout as a function of Vin, DONE
% along with a theoretical fit. ALMOST DONE
% What is the incremental voltage gain of the emitter follower? DONE?
% What is the difference between Vin and Vout for this circuit? 
% What determines this voltage difference?

load("data/Lab3exp3.mat")

Vin = VExp3Ch1; %= Vb
Vout = Ch2Exp3Voltage; %= Ve
Ib = Ch1Exp3Current;
R = 4990; %4.9k
Ut = 0.02569;

rb = Ut./Ib;

Beta = 170;

GainVe = Vout./Vin;

Tfit = Ib.*(rb + (Beta).*R);

hold on

title('Follower Voltage Transfer Characteristics')
xlabel('Input Voltage (V)') 
ylabel('Output Voltage (V)')

plot(VExp3Ch1,Ch2Exp3Voltage, '.');
 
%plot(VExp3Ch1, GainVe, '--');
% The incremental voltage gain of the emitter follower is 0 before 0.5V and
% quickly curves into 1 after 0.5V. 

% The differnece between Vin and Vout is how Vin will always be slightly
% bigger than Vout after 0.5V becuase the change in Vin is the change in
% Iout time rb plus the change in Vout

plot(VExp3Ch1, Tfit, 'k');

legend({'VTC', 'Theoretical Fit'})

hold off