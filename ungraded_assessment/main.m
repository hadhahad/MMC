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
numOfSims = 10000;
meshStep = 1e-1;
maxSteps = 50;
boundary = 2;

% for i = 1:10
%     [a, b] = meshRandomWalk(0,0,meshStep,boundary,maxSteps);
%     disp(a);
%     disp(b);
%     disp('--------------------');
% end

[sol, err] = parabolicPDESolver(numOfSims, boundary, meshStep, maxSteps);
% disp(sol);
x = -boundary:meshStep:boundary;
[x,y] = meshgrid(x);
mesh(y,x,sol);
xlabel('x');
ylabel('y');
zlabel('u(x,y)');
% mesh(x,y,x.*x.*x.*x-y.*y.*y.*y + 375);


