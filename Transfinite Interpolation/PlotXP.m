x = squeeze(xp(1,:,:));
y = squeeze(xp(2,:,:));
h = figure(2);
hold on
for i = 1:imax
   plot(x(i,:),y(i,:),'.'); 
end
for i = 1:kmax
   plot(x(:,i),y(:,i),'.'); 
end
hold off
saveas(h,'Grid.jpg','jpg');
axis([-4 11 -4 3]);