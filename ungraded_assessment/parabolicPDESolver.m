function [ solution, solutionErr ] = parabolicPDESolver( numOfSim, b, meshStep, maxTimeLevel)
% The following function solves parabolic PDE by the Monte Carlo method.
% The solution is calculated on a square region [-b,b]x[-b,b].
%
% INPUT:
%   numOfSim .. number of simulations for Monte Carlo method
%   b .. boundary
%   meshStep .. mesh step parameter
%   maxTimeLevel .. maximum number of steps
% OUTPUT:
%   S .. solution

if nargin <= 3 
    maxTimeLevel = 100; 
end

RHS_ic= @(x,y) 10*x*exp(-x^2-y^2)+273; % initial condition right-hand side
RHS_bc = @(x,y) 273;  % boundary condition right-hand side

mesh = -b:meshStep:b; 
solution = nan(length(mesh), length(mesh));
solutionErr = nan(length(mesh), length(mesh));
W = nan(numOfSim,1);

% Calculation of the soluton in the internal region
for iX = 1:(length(mesh)-1+1)
    for iY = 1:(length(mesh)-1+1)
        for sim = 1:numOfSim
            [xPos, yPos] = meshRandomWalk(mesh(iX), mesh(iY), meshStep, b, maxTimeLevel);
            if (abs(xPos) >= b) || (abs(yPos) >= b)
                W(sim) = RHS_bc(xPos, yPos);
            else
                W(sim) = RHS_ic(xPos, yPos);
            end
        end
        [s, ~, err] = calcStats(W);
        solution(iX, iY) = s;
        solutionErr(iX,iY) = err;
    end
    disp(iX/(length(mesh)-1+1));
end

% Calculation of the solution on the boundary
% solution(1,:) = RHS_bc(b,b);
% solution(length(mesh),:) = RHS_bc(b,b);
% solution(:,1) = RHS_bc(b,b);
% solution(:,length(mesh)) = RHS_bc(b,b);

end

