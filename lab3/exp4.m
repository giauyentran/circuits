clear; close all; clf

% Colors for plots
taupe_gray = [156 151 154]./255;
bittersweet = [255 108 140]./255;
light_sea_green = [16 161 156]./255;
black = [0 0 0]./255;
white = [255 255 255]./255;

% These all have the same naming convention, so the variables overwrite
% each other
load("data/Lab3exp4M1.mat")
load("data/Lab3exp4M2.mat")
load("data/Lab3exp4M3.mat")

%% Experiment 4

% For each collector resistor, measure the circuit’s VTC. Make a single 
% plot showing all of the VTCs along with appropriate theoretical fits.
figure(2)