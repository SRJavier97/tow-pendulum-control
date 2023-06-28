function salida = fcn(entrada)
global l1 l2

Xd= entrada(1);
Yd = entrada(2);

%T2d=atan((sqrt(1-(-l1^2-l2^2+Xd^2+Yd^2)^2/(4*l1^2*l2^2)))/((-l1^2-l2^2+Xd^2+Yd^2)/(2*l1*l2)));
%T1d=atan(((l1*Yd+(Yd*(-l1^2-l2^2+Xd^2+Yd^2))/(2*l1)-l2*Xd*sqrt(1-(-l1^2-l2^2+Xd^2+Yd^2)^2/(4*l1^2*l2^2)))/(Xd^2+Yd^2))/(sqrt(1-(l1*Yd+(Yd*(-l1^2-l2^2+Xd^2+Yd^2))/(2*l1)-l2*Xd*sqrt(1-(-l1^2-l2^2+Xd^2+Yd^2)^2/(4*l1^2*l2^2)))^2/(Xd^2+Yd^2)^2)));

T2d=atan2(sqrt(1-(l1^2+l2^2-Xd^2-Yd^2)^2/(4*l1^2*l2^2)),(-l1^2-l2^2+Xd^2+Yd^2)/(2*l1*l2));
T1d=atan2((l1*Yd+(Yd*(-l1^2-l2^2+Xd^2+Yd^2))/(2*l1)-l2*Xd*sqrt(1-(-l1^2-l2^2+Xd^2+Yd^2)^2/(4*l1^2*l2^2)))/(Xd^2+Yd^2),sqrt(1-(l1*Yd+(Yd*(-l1^2-l2^2+Xd^2+Yd^2))/(2*l1)-l2*Xd*sqrt(1-(-l1^2-l2^2+Xd^2+Yd^2)^2/(4*l1^2*l2^2)))^2/(Xd^2+Yd^2)^2));

salida(1) = T1d;
salida(2) = T2d;