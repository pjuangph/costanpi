function [rc] = duct(P,xi,eta)
%DUCT Summary of this function goes here
%   INPUTs: xi, eta
%   OUTPUT, X(1) = actual x coordinate
%           X(2) = actual y coordinate
%   xi and eta are scaled to duct x,y
xmax = max(P(:,1));
xmin = min(P(:,1));

dx = (xmax-xmin);
rc(1) = xi*dx+xmin;
%% Find Location of RC and Max y
j = 1;
for i = 1:size(P,1)-1
   if (rc(1)<P(i,1) && rc(1)>P(i+1,1) || rc(1)==P(i,1))
       y(j) = P(i,2);          
       j= j+1;
   elseif (rc(1)>P(i,1) && rc(1)<P(i+1,1) || rc(1)==P(i+1,1))
       y(j) = P(i,2);          
       j= j+1;
   end   
end
if (exist('y','var')==0)
   disp('look here'); 
end
ymax = max(y);
ymin = min(y);
rc(2) = eta*(ymax-ymin)+ymin;
end

