function [xFinPos, yFinPos] = meshRandomWalk(...
    xStartPos, yStartPos, meshStep, b, maxTime)
% This function simulates a random walk on a mesh within a given boundary.
%
%
% INPUT:
%   xStartPos .. x-axis start value
%   yStartPos .. y-axis start value
%   meshStep .. step taken by a walk at a time
%   b .. boundary value
%   maxTime .. maximum number of steps
% 
% OUTPUT:
%   xFinPos .. x-axis final position
%   yFinPos .. y-axis final position

steps = [-meshStep meshStep];
xPos = xStartPos;
yPos = yStartPos;
time = maxTime;

while  (abs(xPos) < b) && (abs(yPos) < b) && (time > 0)
    xStep = steps(randi(2));    % random step within the x-axis
    yStep = steps(randi(2));    % random step within the y-axis
    xPos = xPos + xStep;
    yPos = yPos + yStep;
    time = time - 1;
end

xFinPos = xPos;
yFinPos = yPos;

end