function [xFinPos, yFinPos] = meshRandomWalk(xStartPos, yStartPos, meshStep, b, maxTimeLevel)
% A random walk within a given boundary.
%
% INPUT:
%   xStartPos .. x-axis start value
%   yStartPos .. y-axis start value
%   meshStep .. step taken by a walk at a time
%   b .. boundary value
%   maxTimeLevel .. maximum number of steps
% OUTPUT:
%   xFinPos .. x-axis final position
%   yFinPos .. y-axis final position

%W .. value of the random variable (determined with respect to 
%        the particular parabolic differential equation)

steps = [-meshStep meshStep];   % possible steps which have to be taken 
xPos = xStartPos;
yPos = yStartPos;
time = maxTimeLevel;
onBoundary = false;

while  not(onBoundary(xPos, yPos, b)) && (time > 0)
    xStep = steps(randi(2));
    yStep = steps(randi(2));
    xPos = xPos + xStep;
    yPos = yPos + yStep;
    time = time - 1;
end

xFinPos = xPos;
yFinPos = yPos;

end


function X = onBoundary(xPos, yPos, b)
% Checking if the point is located on 
% the boundary of the square [-b,b]x[-b,b]
%
% INPUT:
%   xPos .. current position on the x-axis
%   yPos .. current position on the y-axis
%   b .. interval boundary value
% OUTPUT:
%   X .. boolean value (true, if the point is located on the boundary)

if (abs(xPos) < b) && (abs(yPos) < b)
    X = true;
else
    X = false;
end

end