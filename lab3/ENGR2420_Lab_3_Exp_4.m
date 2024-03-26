% For each collector resistor, measure the circuit's VTC.
% Make a single plot showing all of the VTCs DONE
% along with appropriate theoretical fits. 
% You should also include the emitter-follower VTC that you measured in Experiment 3 on this plot. 
% For each collector resistor, what is the incremental voltage gain of the amplifier? 
% What determines this voltage gain?
load("data/Lab3exp3.mat")
load("Lab3exp4.mat")

Vin1 = VCh1Exp41; % Vb
Vout1 = Ch2Exp4Voltage1; % Vc
Ib1 = Ch1Exp4Current1; 

Vin2 = VCh1Exp42;
Vout2 = Ch2Exp4Voltage2; 
Ib2 = Ch1Exp4Current2;

Vin3 = VCh1Exp43;
Vout3 = Ch2Exp4Voltage3; 
Ib3 = Ch1Exp4Current3;

Vin = VExp3Ch1; %= Vb
Vout = Ch2Exp3Voltage; %= Ve
Ib = Ch1Exp3Current;

Ut = 0.02569;

rb1 = Ut./Ib1;
rb2 = Ut./Ib2;
rb3 = Ut./Ib3;

R = 500; %4.9k
Rc1 = 500;
Rc2 = 1000;
Rc3 = 1500;

Ic1 = Vout1./Rc1;
Ic2 = Vout2./Rc2;
Ic3 = Vout3./Rc3;

Beta = 170;
Beta1 = Ic1./Ib1;
Beta2 = Ic2./Ib2;
Beta3 = Ic3./Ib3;

GainVe = Vout./Vin;
Gain1 = gradient(Vout1)./gradient(Vin3);
Gain2 = gradient(Vout2)./gradient(Vin2);
Gain3 = gradient(Vout3)./gradient(Vin3);
% For 1R, the gain before 0.5V is 0, between 0.5V and around 3V the gain is
% -1, and from 3V to 5V the gain is 1. 

% For 2R, the gain before 0.5V is 0, between 0.5V and around 2.5V the gain is
% -2, and from 2.5V to 5V the gain is 1. 

% For 3R, the gain before 0.5V is 0, between 0.5V and around 2V the gain is
% -3, and from 2V to 5V the gain is 1. 

% The determining factor that affects this voltage gain is, the change in
% Rc values. As the multiple of Rc increases, the larger the lower end of
% gain is and how long it will be that value. 

Tfit1 = Ib1.*(rb1 + (Beta1).*Rc1);
Tfit2 = Ib2.*(rb2 + (Beta2).*Rc2);
Tfit3 = Ib3.*(rb3 + (Beta3).*Rc3);

hold on

title('Inverter Voltage Transfer Characteristics')
xlabel('Input Voltage (V)') 
ylabel('Output Voltage (V)') 

plot(Vin1,Vout1, '.', 'LineWidth', 1.5);

%plot(Vin1, Gain1, '--');

plot(Vin1, Tfit1, 'LineWidth', 1);

plot(Vin2,Vout2, '.', 'LineWidth', 1.5);

%plot(Vin2, Gain2, '--');

plot(Vin2, Tfit2, 'LineWidth', 1);

plot(Vin3,Vout3, '.', 'LineWidth', 1.5);

%plot(Vin3, Gain3, '--');

plot(Vin3, Tfit3, 'LineWidth', 1);

plot(VExp3Ch1,Ch2Exp3Voltage, '.', 'LineWidth', 1.5);

legend({'VTC 1', 'Theretical Fit 1', 'VTC 2','Theretical Fit 2', 'VTC 3','Theretical Fit 3', 'EF VTC'})

hold off