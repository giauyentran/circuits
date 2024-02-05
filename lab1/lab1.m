load("exp1.mat")
load("exp2.mat")

% Experiment 1
figure(1)
hold on
plot(Vsexp1, Currentexp1, 'b.')
[f1, l1, m1, b1, n1] = linefit(Vsexp1, Currentexp1, 4e-5);
plot(Vsexp1, Vsexp1*m1+b1, 'r-')

title('Current Voltage Characteristic of 499 \Omega Resistor')
xlabel('Current (A)')
ylabel('Voltage (V)')

measured_r = 1/m1; % ohms

% Experiment 2
figure(2)
hold on
plot(Vsexp2, Voutexp2, 'b.')
[f2, l2, m2, b2, n2] = linefit(Vsexp2, Voutexp2, 4e-5);
plot(Vsexp2, Vsexp2*m2+b2, 'r-')
hold off

title('')
xlabel('V_{in} (V)');
ylabel('V_{out} (V)')

divider_ratio = m2;

% Experiment 3

% Experiment 4

