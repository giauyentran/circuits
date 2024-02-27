clear all; clear; clf;
close all;

% Colors for plots
taupe_gray = [156 151 154]./255;
bittersweet = [255 108 140]./255;
light_sea_green = [16 161 156]./255;
black = [0 0 0]./255;
white = [255 255 255]./255;

load("exp1_data.mat")
load("exp2_data.mat")

% Experiment 1
figure(1)
hold on; grid minor;
semilogx(exp1_i_part1,exp1_i_part1, '.')
hold on
semilogx(exp1_i_part2,exp1_i_part2, '.')
title('Diode-Connected Transistor Characteristics')
xlabel('Current (A)')
ylabel("Voltage (V)")
%TODO: curve fit, theoretical fit, styling

%TODO: incremental resistance log-log plot

% Experiment 2
figure(2)
% axis equal
plot(ch1_exp2_v_499, ch2_exp2_v_499, '.', color = light_sea_green, MarkerSize = 7)
hold on; grid minor;
[f,l,m,b,n] = linefit(ch1_exp2_v_499, ch2_exp2_v_499, 5e-4)
plot(ch1_exp2_v_4999, ch2_exp2_v_4999, '.', color = bittersweet, MarkerSize = 7)
plot(ch1_exp2_v_49999, ch2_exp2_v_49999, '.', color = black, MarkerSize = 7)
plot(ch1_exp2_v_499, ch1_exp2_v_499*m+b, linewidth=1.5, color = taupe_gray)

% xlim([0.3, 5]);
% ylim([0.25, 0.75])

title("Diode-Connected Transistor with Series Resistor")
xlabel('Input Voltage (V)')
ylabel('Voltage Across Transistor (V)')
legend("499\Omega", "4.99k\Omega", "49.9k\Omega", "V_{gain} = 0.99", location="northwest")

figure(3)
semilogy(ch1_exp2_v_499, ch1_exp2_i_499, '.', color = light_sea_green, MarkerSize = 7)
hold on; grid minor;
semilogy(ch1_exp2_v_4999, ch1_exp2_i_4999, '.', color = bittersweet, MarkerSize = 7)
semilogy(ch1_exp2_v_49999, ch1_exp2_i_49999, '.', color = black, MarkerSize = 7)

title("Diode-Connected Transistor with Series Resistor")
xlabel('Input Voltage (V)')
ylabel('Current Through Transistor (I)')
legend("499\Omega", "4.99k\Omega", "49.9k\Omega", location="northwest")

figure(4)
hold on; grid minor;
[f2,l2,m2,b2,n2] = linefit(ch1_exp2_v_499, ch1_exp2_i_499, 5e-3)
plot(linspace(0,6,100), linspace(0,6,100) * m2 + b2, color = black, linewidth = 1.5)
plot(ch1_exp2_v_499, ch1_exp2_i_499, '.', color = light_sea_green, MarkerSize = 9)
title("Diode-Connected Transistor with Series Resistor")
xlabel('Input Voltage (V)')
ylabel('Current Through Transistor (I)')
v_on_1 = ch1_exp2_v_499(f2);
i_on_1 = ch1_exp2_i_499(f2);
plot(ch1_exp2_v_499(f2), ch1_exp2_i_499(f2), '.', MarkerSize=20, color = bittersweet)
legend("R_{measured} = 508.2\Omega", "499\Omega", "V_{on} = 0.75V, I_{on} = 219\muA",  location="northwest")
xlim([0, 5.5]);
ylim([0, 0.009]);

figure(5)
hold on; grid minor;
[f3,l3,m3,b3,n3] = linefit(ch1_exp2_v_4999, ch1_exp2_i_4999, 5e-3)
plot(linspace(0,6,100), linspace(0,6,100) * m3 + b3, color = black, linewidth = 1.5)
plot(ch1_exp2_v_4999, ch1_exp2_i_4999, '.', color = bittersweet, MarkerSize = 7)
title("Diode-Connected Transistor with Series Resistor")
xlabel('Input Voltage (V)')
ylabel('Current Through Transistor (I)')
v_on_2 = ch1_exp2_v_4999(f3);
i_on_2 = ch1_exp2_i_4999(f3);
plot(ch1_exp2_v_4999(f3), ch1_exp2_i_4999(f3), '.', MarkerSize=20, color = light_sea_green)
legend("R_{measured} = 5.079k\Omega", "4.99k\Omega", "V_{on} = 0.69V, I_{on} = 21.7\muA", location="northwest")
xlim([0, 5.5]);
ylim([0, 0.0009]);

figure(6)
hold on; grid minor;
[f4, l4, m4, b4, n4] = linefit(ch1_exp2_v_49999, ch1_exp2_i_49999, 1e-3);
plot(linspace(0,6,100), linspace(0,6,100) * m4 + b4, color = bittersweet, linewidth = 1.5)
plot(ch1_exp2_v_49999, ch1_exp2_i_49999, '.', color = black, MarkerSize = 7)
title("Diode-Connected Transistor with Series Resistor")
xlabel('Input Voltage (V)')
ylabel('Current Through Transistor (I)')
v_on_3 = ch1_exp2_v_49999(f4);
i_on_3 = ch1_exp2_i_49999(f4);
plot(ch1_exp2_v_49999(f4), ch1_exp2_i_49999(f4), '.', MarkerSize=20, color = light_sea_green)
legend("R_{measured} = 50.53k\Omega", "49.9k\Omega", "V_{on} = 0.64V, I_{on} = 262\muA", location="northwest")
xlim([0, 5.5]);
ylim([0, 0.00009]);

figure(7)
semilogx(499, i_on_1, '.', MarkerSize=20, color = light_sea_green); %plot(499, v_on_1)
hold on; grid minor;
semilogx(499, 48*10^-6, '*', MarkerSize=10, color = light_sea_green); %plot(499, v_on_1)
semilogx(4999, i_on_2, '.', MarkerSize=20, color = light_sea_green);
semilogx(4999, 48*10^-7, '*', MarkerSize=10, color = light_sea_green); %plot(499, v_on_1)
semilogx(49999, i_on_3, '.', MarkerSize=20, color = light_sea_green);
semilogx(49999, 48*10^-8, '*', MarkerSize=10, color = light_sea_green); %plot(499, v_on_1)
ylabel("Turn-on Current, I_{on} (I)")
ylim([-10^-5, 2.5*10^-4])
xlabel("Series Resistor Value (\Omega)")
title("Diode-Connected Transistor with Series Resistor")
legend("Measured", "", "", "Theoretical")
xlim([300, 10^5])

figure(8)
semilogx(499, v_on_1, '.', MarkerSize=20, color = bittersweet); 
hold on; grid minor;
semilogx(499, 0.61, '*', MarkerSize=10, color = bittersweet); 
semilogx(4999, v_on_2, '.', MarkerSize=20, color = bittersweet); 
semilogx(4999, 0.56, '*', MarkerSize=10, color = bittersweet); 
semilogx(49999, v_on_3, '.', MarkerSize=20, color = bittersweet);
semilogx(49999, 0.50, '*', MarkerSize=10, color = bittersweet); 
ylabel("Turn-on Voltage, V_{on} (V)")
xlabel("Series Resistor Value (\Omega)")
title("Diode-Connected Transistor with Series Resistor")
legend("Measured", "", "", "Theoretical")
xlim([300, 10^5])
ylim([0.4, 0.76])


% Does the circuit behave qualitatively as you
% expected based on your prelab assignment? 
% 
% For your report, make a single plot showing the
% voltage across the diode-connected transistor 
% as a function of the applied input voltage for
% all of the resistors that you used (i.e., one 
% plot with at least three curves on it). 
% 
% Also, make a single semilog plot showing the 
% measured current flowing into the circuit as 
% a function of the applied input voltage. 
% 
% Finally, make a linear plot showing the input current as 
% a function of the applied input voltage for each 
% of the three resistors (i.e., three separate plots 
% with each with one curve). 
% 
% For each plot, include theoretical fits that you
% believe make sense. For each resistor value, 
% extract a value for the turn-on current, Ion,
% and the turn-on voltage, Von. 
% 
% For your report, make plots showing Ion and Von as 
% a function of R. Do these parameters vary with
% R as you expected from your prelab analysis?
