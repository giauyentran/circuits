clear; close all; clf

% Colors for plots
taupe_gray = [156 151 154]./255;
bittersweet = [255 108 140]./255;
light_sea_green = [16 161 156]./255;
black = [0 0 0]./255;
white = [255 255 255]./255;

load("Lab3exp4.mat")

%% Experiment 4

% For each collector resistor, measure the circuit’s VTC. Make a single 
% plot showing all of the VTCs along with appropriate theoretical fits.
figure(2)