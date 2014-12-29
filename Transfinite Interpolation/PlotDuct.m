nx = 10;
ny = nx;
xi = linspace(0,1,nx);
eta = linspace(0,1,ny);
x = zeros(nx,ny);
y = x;
for i = 1:nx
    for j = 1:ny
        [p] = duct(P,xi(i),eta(j));
        x(i,j) = p(1);
        y(i,j) = p(2);
    end
end
close all;
h = figure(1);
hold on
for i = 1:ny
   plot(x(i,:),y(i,:),'.-'); 
end
for i = 1:nx
   plot(x(:,i),y(:,i),'.-'); 
end
hold off
title('Duct - Interior Points (Not Grid)');
h = figure(2);
plot(P(1:4,1),P(1:4,2),'.-','linewidth',1.5)
hold on
plot(P(5:end,1),P(5:end,2),'.-','linewidth',1.5)
hold off
axis([-4 11 -4 3]);
title('Duct - Edges and Control Points');
saveas(h,'Duct1.jpg','jpg');