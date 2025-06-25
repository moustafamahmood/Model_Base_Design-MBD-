l1= 10;
l2= 7;
theta1=linspace(0,90,1000);
theta2=linspace(0,180,1000);
x1 = l1*cosd(theta1);
y1= l1*sind(theta1);
x2= x1+l2*cosd(theta2);
y2= y1+l2*sind(theta2);
p1 = plot([0,x1],[0,y1]);
p2= plot([x1,x2],[y1,y2]);
hold on;
xlim ([-l1 *2,l1 *2]);
ylim ([0,l1* 2]);
plot(x2,y2);
for i=1:10:length(theta1)
  delete p1;
  delete p2;
  p1 = plot([0,x1(i)],[0,y1(i)],'r');
  p2= plot([x1(i),x2(i)],[y1(i),y2(i)],'b');
drawnow
end

