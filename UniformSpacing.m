function [outcome] = UniformSpacing(xmin,xmax,indx,indxMax)
%UNIFORMSPACING Distribute interior grid points based on coordinates
coef = (indx-1)/(indxMax-1);
outcome = xmin + coef * (xmax-xmin);
end

