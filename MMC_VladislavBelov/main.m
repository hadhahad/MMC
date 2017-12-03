clc;
close all;
clear;
workspace;
format long g;
format compact;


%%% Initial parameters %%%
numOfSims = 1000000;
meshStep = 1e-1;
maxSteps = 250;
boundary = 2;


%%% Calculate the solution and its error via the Monte Carlo method %%%
[sol, err] =  ... 
    parabolicPDESolver(numOfSims, boundary, meshStep, maxSteps, 1);


%%% Generate diagrams %%%
path = 'MMC_VladislavBelov/results/';
solutionPlotName = ['solution_3D' ...
    '_sim' num2str(numOfSims) '_step' num2str(meshStep) ...
    '_time' num2str(maxSteps) '_boundary' num2str(boundary) '.svg'];
errorPlotName = ['solutionError' ...
    '_sim' num2str(numOfSims) '_step' num2str(meshStep) ...
    '_time' num2str(maxSteps) '_boundary' num2str(boundary) '.svg'];
x = -boundary:meshStep:boundary;
[x,y] = meshgrid(x);
% figure;
% pcolor(x,y,10.*x.*exp(-x.*x-y.*y)+273);   % plot the initial condition

% 3-D solution plot
figure;
colormap parula;
f = surf(y,x,sol);
% set(f, 'LineStyle', 'none');
xlabel('x');
ylabel('y');
zlabel('u(x,y)');
saveas(gcf, strcat(path,solutionPlotName));

% 2-D solution plot
solutionPlotName(10) = '2';
figure;
colormap parula;
f = pcolor(y,x,sol);
% set(f, 'LineStyle', 'none');
xlabel('x');
ylabel('y');
colorbar;
saveas(gcf, strcat(path,solutionPlotName));

% 2-D solution error plot
figure;
colormap copper;
f = pcolor(y,x,err);
% set(f, 'LineStyle', 'none');
xlabel('x');
ylabel('y');
colorbar;
saveas(gcf, strcat(path,errorPlotName));


%%% Save maximal error to the txt-file %%%
fileName = ['maxError' ...
    '_sim' num2str(numOfSims) '_step' num2str(meshStep) ...
    '_time' num2str(maxSteps) '_boundary' num2str(boundary) '.txt'];
fileID = fopen(strcat(path,fileName), 'w');
fprintf(fileID, num2str(max(max(err)),'%0.10f'));
fileID = fclose('all');


%%% Final %%%
disp('*********************************');
disp('** The simulation is completed **');
disp('*********************************');
