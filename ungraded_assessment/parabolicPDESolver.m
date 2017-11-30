function [ solution, solutionErrByPoint ] = parabolicPDESolver( numOfSim, b, meshStep, maxTimeLevel)
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

RHS_ic= @(x,y) 1; % initial condition right-hand side
RHS_bc = @(x,y) 1;  % boundary condition right-hand side

mesh = boundary:meshStep:boundary; 
solution = nan(length(mesh), length(mesh));
solutionErrByPoint = nan(length(mesh), length(mesh));
W = nan(numOfSim);

for iX = 2:(length(mesh)-1)
    for iY = 2:(length(mesh)-1)
        for sim = 1:numOfSim
            [xPos, yPos] = meshRandomWalk(mesh(iX), mesh(iY), meshStep, b, maxTimeLevel);
            if onBoundary(xPos, yPos, b)
                W(sim) = RHS_bc(xPos, yPos);
            else
                W(sim) = RHS_ic(xPos, yPos);
            end
        end
        [solution(iX, iY), ~, solutionErrByPoint(iX,iY)] = calcStats(W);
    end
end

% TODO: calculate solution values onthe boundary

end

