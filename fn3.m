function ydot = fn3(t, y) 
ydot = zeros (2,1);
ydot(1) = y(2); 
ydot(2) =-4*y(2)-13*y(1);
end