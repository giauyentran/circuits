clear; close all; clf

% Colors for plots
taupe_gray = [156 151 154]./255;
bittersweet = [255 108 140]./255;
light_sea_green = [16 161 156]./255;
black = [0 0 0]./255;
white = [255 255 255]./255;

load("data/Lab3exp1.mat")

Ic = -Ch2Exp1Current(1:134) - Ch1Exp1Current(1:134);
Ib = Ch1Exp1Current(1:134);
V = Vexp1Ch1(1:134);

Ut_lab2 = 0.024;
Is_lab2 = 4.081e-16;
%% Experiment 1
figure(1); clf
% collector current and base current as a function of base voltage along 
% with appropriate theoretical fits and extracted parameter values

semilogy(V, Ic, '.', Color=light_sea_green)
hold on
semilogy(V, Ib, '.', Color=bittersweet)

fit1 = fit(transpose(V), transpose(Ic), 'exp1');
fit_param_cv = coeffvalues(fit1);
Is_cv = fit_param_cv(1);
Ut_cv = 1/fit_param_cv(2);

fit2 = fit(transpose(V), transpose(Ib), 'exp1');
fit2_param_cv = coeffvalues(fit2);
Is_cv2 = fit2_param_cv(1);
Ut_cv2 = 1/fit2_param_cv(2);

plot(V, Is_cv*exp(1/Ut_cv*V), 'k-', linewidth = 1)
plot(V, Is_cv2*exp(1/Ut_cv2*V), 'k-', linewidth = 1)

title("Collector and Base Current of Bipolar Transistor")
xlabel("Voltage (V)")
ylabel("Current (A)")
legend("Collector Current", "Base Current", "Theoretical Fit" ,Location='northwest')

%% 
figure(2)
clf
% Plot the current gain, β, which is defined as the ratio of the collector
% current to the base current, as a function of the base current (you 
% should make the base-current-axis logaritmic for this plot)
current_gain = Ic./Ib;
% semilogx(Ib, current_gain, 'b.', Color = light_sea_green, MarkerSize=8)
plot(Ib, current_gain, 'b.', Color = light_sea_green, MarkerSize=8)

title('Biopolar Transistor Current Gain')
xlabel('Base Current (A)')
ylabel('Current Gain')

%% 
figure (3)
% make a log-log plot of rb versus Ib along with an appropriate 
% theoretical fit
% rb = Ut/Ib

rb = Ut_lab2./Ib;
loglog(Ib(2:134), diff(V)./diff(Ib), '.', Color=light_sea_green, MarkerSize = 9)
hold on
loglog(Ib, rb, 'k-', linewidth = 1.5)

title('Incremental Resistance of Bipolar Transistor')
xlabel('Base Current (A)')
ylabel('Incremental Resistance (\Omega)')
legend('Experimental Data', 'Theoretical Fit')

%% 
figure(4)
clf
% Make a log-log plot of gm versus Ic along with an appropriate 
% theoretical fit.
% gm = Ic/Ut

gm = Ic./Ut_lab2;
loglog(Ic(2:134), diff(Ic)./diff(V), '.', Color=light_sea_green, MarkerSize = 8)
hold on
loglog(Ic, gm, 'k-', LineWidth = 1.5)

title('Incremental Transconductance Gain of Bipolar Transistor')
xlabel('Collector Current (A)')
ylabel('Incremental Transconductance Gain (S)')
legend('Experimental Data', 'Theoretical Fit', Location='northwest')



