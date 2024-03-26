% clf; close all; clear;

load("data/lab4_exp1_rev3.mat")


% min(IinExp1)
% max(IinExp1)

figure(1)
semilogy(exp1_nMOS1_I, exp1_nMOS1_V, ".")
hold on;
semilogy(exp1_nMOS2_I, exp1_nMOS2_V, ".")
semilogy(exp1_nMOS3_I, exp1_nMOS3_V, ".")
semilogy(exp1_nMOS4_I, exp1_nMOS4_V, ".")

% In your report, include a table showing the extracted EKV model parameters for each transistor.

% Also, include a single semilog plot showing all four voltage-current characteristics along with one of
% the fits.


% Also, include a single semilog plot showing the difference between each transistor’s
% gate voltage and the average gate voltage from all four transistors as a function of input
% current.

% How well do these characteristics match each other?

% Do the transistors generally match better at certain levels of inversion than others?

% From one of your measured characteristics, extract that transistor’s incremental transcon-
% ductance gain.

% As you did in Labs 2 and 3, you should be able to use diff and ./ in MATLAB to obtain a crude finite-difference
% approximation to the partial derivative of the transistor’s saturation current with respect to its gate voltage.

% For your report, make a log-log plot showing the incremental transconductance gain of the transistor you selected as
% a function of the current flowing through it, along with a theoretical fit.

% Does the theoretical fit match the data?

