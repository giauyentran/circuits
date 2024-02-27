clear; close all; clf

% Colors for plots
taupe_gray = [156 151 154]./255;
bittersweet = [255 108 140]./255;
light_sea_green = [16 161 156]./255;
black = [0 0 0]./255;
white = [255 255 255]./255;

load("Lab3exp2.mat")

%% Experiment 2

% Make a single semilog plot showing collector current versus base voltage 
% for all of the resistor values that you used along with the collector 
% characterisic and theoretical fit that you obtained in Experiment 1 
% (i.e., one plot with four curves on it)
figure(1)

% For each resistor, make a linear plot of collector current as a function 
% of base voltage along with an appropriate theoretical fit (i.e., three 
% plots each with one curve plus any appropriate fit).
figure(2)

figure(3)

figure(4)

% Make a single log-log plot showing Rb as a function of Ib along with 
% appropriate theoretical fits. 
figure(5)

% Make a single log-log plot showing Gm as a function of Ic, along with 
% appropriate theoretical fits.
figure(6)
