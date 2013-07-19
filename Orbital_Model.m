function dS = Orbital_Model (~,S)

gp = 3.986e14;
%Gravitational parameter of the Earth (G * m). 

R = S(1:3);
%Current satellite position.

r = norm(R);
%Current satellite distance from the center of the Earth.

dS = zeros(6,1);
%Allocates memory for the model state vector.

dS(1:3) = S(4:6);
%Current satellite velocity.

dS(4:6) = -gp * R / r^3;
%Current satellite acceleration.

end