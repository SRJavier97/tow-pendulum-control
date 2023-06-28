function salida = fcn(entrada)
global l1 l2
a=-pi/2;
pos1 = entrada(1);
pos2 = entrada(3);

x=l1*cos(pos1)+l2*cos(pos1+pos2);
y=l1*sin(pos1)+l2*sin(pos1+pos2);

P=[cos(a) -sin(a);sin(a) cos(a)]*[x;y];

salida(1) = P(1);
salida(2) = P(2);