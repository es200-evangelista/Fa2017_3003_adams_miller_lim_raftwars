% create figure
fig1 = figure(1);
ax = axes(fig1);
xlabel('Academy Raft Wars')
%axis([0 9000 0 5000])
ax.XLim = [0 9000];
ax.YLim = [0 5000];
grid off
 
raft{1} = 'raft1.png';
raft{2} = 'raft2.png';
raft{3} = 'raft3.png';
raft{4} = 'raft4.png';
raft{5} = 'raft5.png';
raft{6} = 'raft6.png';
raft{7} = 'raft7.png';
raft{8} = 'raft8.png';
raft{9} = 'raft9.png';
raft{10} = 'raft10.png';
raft{11} = 'raft11.png';
raft{12} = 'raft12.png';
raft{13} = 'raft13.png';
raft{14} = 'raft14.png';
raft{15} = 'raft15.png';
figure(2)
I=imread('beach2.jpeg');
hbg = imshow(I);
 min_x = 0;
 max_x = 9000;
 min_y = 0;
 max_y = 5000;
 hbg.XData = [min_x,max_x];
 hbg.YData = [max_y,min_y];
 hbg.Parent = ax;
 
 
 close(2)
 

enemy{1} = 'enemy1.png';
enemy{2} = 'enemy2.png';
enemy{3} = 'enemy3.png';
enemy{4} = 'enemy4.png';
enemy{5} = 'enemy5.png';
enemy{6} = 'enemy6.png';
enemy{7} = 'enemy7.png';
enemy{8} = 'enemy8.png';
enemy{9} = 'enemy9.png';
enemy{10} = 'enemy10.png';
enemy{11} = 'enemy11.png';
enemy{12} = 'enemy12.png';
enemy{13} = 'enemy13.png';
enemy{14} = 'enemy14.png';
enemy{15} = 'enemy15.png';


for i = 1:15
    fig2 = figure(2);
    x = imread(['drive-download-20171121T150351Z-001/',raft{i}]);
    h= image(x);
    h.Parent = ax; 
    set(h, 'XData', [0, 800])
    set(h, 'YData', [1000, 0])
    close(fig2)
    pause(0.00001);

for a = 1:15
    fig3 = figure(3);
    x = imread(['drive-download-20171121T154400Z-001/',enemy{a}]);
    h2= image(x);
    h2.Parent = ax; 
    set(h2, 'XData', [9000, 8200])
    set(h2, 'YData', [1000, 0])
    close(fig3)
    pause(0.00001);
end
end

% compute a trajectory according to physics
t = 0:0.01:1000;
vx = 200; vy0=vx;
x = vx*t;
y = 1/2*(-9.81)*t.^2+vy0*t+0;

% prepare plot
CannonBall = figure(5); % opens new plot window
h3 = plot(x(1),y(1400),'ko'); % initially draws the cannonball
h3.Parent = ax;
set(h3,'MarkerSize',20); % set the cannonball size and color
set(h3,'MarkerFaceColor','y')
set(h3,'XData',x(i),'YData',y(i));
close(CannonBall);

% loop to animate
for i=1:length(t)
    % at each step, move the cannonball to the right place
    set(h3,'XData',x(i),'YData',y(i));
    pause(0.0001);
end

%   for CannonBall = CB
%         if (isCollision(enemy,CannonBall))
%           disp('Hit!'); 
%            text(0, 2000, 'Hit by Cannon Ball!!');
%            done = 1;  % game over
%            break;
%        end
%    end
