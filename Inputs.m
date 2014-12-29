%% Create simple duct geometry, p1 to pN - CCW direction
p1 = [10,2];
p2 = [5,2];
p3 = [5,0];
p4 = [-3,0];
p5 = [-3,-3];
p6 = [7,-3];
p7 = [7,0];
p8 = [10,0];
P = [p1;p2;p3;p4;p5;p6;p7;p8];
%% Define Grid Size
imax = 20;
kmax = 10;
% Initialize Grid
xi = zeros(imax,1); % Initialize xi
eta = zeros(kmax,1);
for i = 1:imax % Populate xi
   xi(i)= (i-1)/(imax-1);
end
for k=1:kmax % Populate eta
   eta(k) = (k-1)/(kmax-1); 
end
%% Map Grid Points to Computational Plane
Pe1 = [1,1];
Pe2 = [.5,1];
Pe3 = Pe2;
Pe4 = [0,1];
Pe5 = [0,0];
Pe6 = [.5,0];
Pe7 = Pe6;
Pe8 = [1,0];
%% TFI Transfinite Interpolation - Create the Grid
grid = zeros(imax,kmax);
u(1,:,:) = grid;
u(2,:,:) = grid;
for i =1:imax;
    for k = 1:kmax
        u(1,i,k) = UniformSpacing(0,1,i,imax);
        u(2,i,k) = UniformSpacing(0,1,k,kmax);
    end
end
%% TFI - Map Grid onto the surface
U = zeros(imax,kmax);
V = U;
xp = u; % Actual grid in real coordinates 
e1 = duct(P,0,0); e2 = duct(P,1,0); e3 = duct(P,0,1); e4 = duct(P,1,1);
for i =1:imax
    for k = 1:kmax
        U= (1-u(1,i,k))*duct(P,0,u(2,i,k))+u(1,i,k)*duct(P,1,u(2,i,k));
        V = (1-u(2,i,k))*duct(P,u(1,i,k),0)+u(2,i,k)*duct(P,u(1,i,k),1);        
        UV = (1-u(1,i,k))*(1-u(2,i,k))*e1 + u(1,i,k)*(1-u(2,i,k))*e2;
        UV = UV + (1-u(1,i,k))*u(2,i,k)*e3 + u(1,i,k)*u(2,i,k)*e4;
        xp(1,i,k) = U(1)+V(1)-UV(1);
        xp(2,i,k) = U(2)+V(2)-UV(2);
    end
end


