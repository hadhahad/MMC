function [solution, solutionErr] = parabolicPDESolver(...
    numOfSim, b, meshStep, maxTime, verbose)
% The following function solves parabolic PDE by the Monte Carlo method.
% The solution is calculated on a square region [-b,b]x[-b,b].
%
%
% INPUT:
%   numOfSim .. number of simulations for Monte Carlo method
%   b .. boundary - determines the [-b,b]x[-b,b] region
%   meshStep .. mesh step parameter
%   maxTimeLevel .. maximum number of steps
%
% OUTPUT:
%   solution .. solution storage
%   solutionErr .. solution error storage

if nargin <= 3, maxTime = 25; end
if nargin <= 4, verbose = false; end
if verbose, disp('Simulation progress: 0.00 %'); end
if maxTime == 0, return; end

RHS_ic= @(x,y) 10*x*exp(-x^2-y^2)+273; % initial condition right-hand side
RHS_bc = 273;  % boundary condition right-hand side

mesh = -b:meshStep:b;
solution = nan(length(mesh), length(mesh));
solutionErr = nan(length(mesh), length(mesh));
W = nan(numOfSim,1);    % random variable values storage

% Assigning of the solution on the boundary
solution(1,:) = RHS_bc;
solution(length(mesh),:) = RHS_bc;
solution(2:(length(mesh)-1),1) = RHS_bc;
solution(2:(length(mesh)-1),length(mesh)) = RHS_bc;
% Solution error on the boundary is equal to zero
solutionErr(1,:) = 0;
solutionErr(length(mesh),:) = 0;
solutionErr(2:(length(mesh)-1),1) = 0;
solutionErr(2:(length(mesh)-1),length(mesh)) = 0;

% Calculation of the soluton in the internal region
for iX = 2:(length(mesh)-1)
    for iY = 2:(length(mesh)-1)
        for sim = 1:numOfSim
            [xPos, yPos] =  ...
                meshRandomWalk(mesh(iX), mesh(iY), meshStep, b, maxTime);
            if (abs(xPos) >= b) || (abs(yPos) >= b)
                W(sim) = RHS_bc;
            else
                W(sim) = RHS_ic(xPos, yPos);
            end
        end
        [solution(iX, iY), ~, solutionErr(iX,iY)] = calcStats(W);
    end
    % Progress evaluation
    if verbose
        disp(['Simulation progress: ' ...
            num2str(iX*100/(length(mesh)-1),'%0.2f') ' %']);
    end
end

end

