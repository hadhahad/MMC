
P = [1 3 1 7];
%X = multi(N, P);
%histogram(X);

% xAxis = -2:meshStep:2;
% yAxis = xAxis;
% [xAxis,yAxis] = meshgrid(xAxis);
% F = xAxis.*exp(-xAxis.^2-yAxis.^2);
% mesh(xAxis, yAxis, F);

% clc;    % Clear the command window.
% clearvars;
% close all;  % Close all figures (except those of imtool.)
% workspace;  % Make sure the workspace panel is showing.
% fontSize = 20;
% format compact;
% numberOfSteps = 100;
% deltax = rand(numberOfSteps) - 0.5;
% deltay = rand(numberOfSteps) - 0.5;
% xy = zeros(numberOfSteps,2);
% for step = 2 : numberOfSteps
% 	% Walk in the x direction.
% 	xy(step, 1) = xy(step, 1) + deltax(step);	
% 	% Walk in the y direction.
% 	xy(step, 2) = xy(step, 2) + deltay(step);
% 	% Now plot the walk so far.
% 	xCoords = xy(1:step, 1);
% 	yCoords = xy(1:step, 2);
% 	plot(xCoords, yCoords, 'bo-', 'LineWidth', 2);
% 	hold on;
% 	textLabel = sprintf('%d', step);
% 	text(xCoords(end), yCoords(end), textLabel, 'fontSize', fontSize);
% end


clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
clear;  % Erase all existing variables. Or clearvars if you want.
workspace;  % Make sure the workspace panel is showing.
format long g;
format compact;

meshStep = 1e-1;
maxSteps = 1000;
boundary = 2;


xPos = 0.0;
yPos = 0.0;
numOfSteps = 0;


