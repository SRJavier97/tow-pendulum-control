function salida = fcn(entrada)
global l1 l2

Xd= entrada(1);
Yd = entrada(2);
Xpd = entrada(3);
Ypd = entrada(4);

%T2d=atan((sqrt(1-(-l1^2-l2^2+Xd^2+Yd^2)^2/(4*l1^2*l2^2)))/((-l1^2-l2^2+Xd^2+Yd^2)/(2*l1*l2)));
%T1d=atan(((l1*Yd+(Yd*(-l1^2-l2^2+Xd^2+Yd^2))/(2*l1)-l2*Xd*sqrt(1-(-l1^2-l2^2+Xd^2+Yd^2)^2/(4*l1^2*l2^2)))/(Xd^2+Yd^2))/(sqrt(1-(l1*Yd+(Yd*(-l1^2-l2^2+Xd^2+Yd^2))/(2*l1)-l2*Xd*sqrt(1-(-l1^2-l2^2+Xd^2+Yd^2)^2/(4*l1^2*l2^2)))^2/(Xd^2+Yd^2)^2)));

T2d=atan2(sqrt(1-(l1^2+l2^2-Xd^2-Yd^2)^2/(4*l1^2*l2^2)),(-l1^2-l2^2+Xd^2+Yd^2)/(2*l1*l2));
T1d=atan2((l1*Yd+(Yd*(-l1^2-l2^2+Xd^2+Yd^2))/(2*l1)-l2*Xd*sqrt(1-(-l1^2-l2^2+Xd^2+Yd^2)^2/(4*l1^2*l2^2)))/(Xd^2+Yd^2),sqrt(1-(l1*Yd+(Yd*(-l1^2-l2^2+Xd^2+Yd^2))/(2*l1)-l2*Xd*sqrt(1-(-l1^2-l2^2+Xd^2+Yd^2)^2/(4*l1^2*l2^2)))^2/(Xd^2+Yd^2)^2));

T2pd=-((2*(Xd*Xpd+Yd*Ypd))/(l1*l2*sqrt(-((((l1-l2)^2-Xd^2-Yd^2)*((l1+l2)^2-Xd^2-Yd^2))/(l1^2*l2^2)))));
T1pd=(Xd^6*Xpd+2*(l1^2+l2^2)*Xd^3*Yd*Ypd+Xd^4*(3*Xpd*Yd^2+l1*l2*sqrt(-((((l1-l2)^2-Xd^2-Yd^2)*((l1+l2)^2-Xd^2-Yd^2))/(l1^2*l2^2)))*Ypd)-Xd^2*(Xpd*((l1^2-l2^2)^2+2*(l1^2+l2^2)*Yd^2-3*Yd^4)+l1*l2*(-l1^2+l2^2-2*Yd^2)*sqrt(-((((l1-l2)^2-Xd^2-Yd^2)*((l1+l2)^2-Xd^2-Yd^2))/(l1^2*l2^2)))*Ypd)+Yd^2*(Xpd*(l1-l2-Yd)*(l1+l2-Yd)*(l1-l2+Yd)*(l1+l2+Yd)+l1*l2*sqrt(-((((l1-l2)^2-Xd^2-Yd^2)*((l1+l2)^2-Xd^2-Yd^2))/(l1^2*l2^2)))*(-l1^2+l2^2+Yd^2)*Ypd)-2*Xd*Yd*(l1*(l1-l2)*l2*(l1+l2)*Xpd*sqrt(-((((l1-l2)^2-Xd^2-Yd^2)*((l1+l2)^2-Xd^2-Yd^2))/(l1^2*l2^2)))+((l1^2-l2^2)^2-(l1^2+l2^2)*Yd^2)*Ypd))/(l1^2*l2*sqrt(-((((l1-l2)^2-Xd^2-Yd^2)*((l1+l2)^2-Xd^2-Yd^2))/(l1^2*l2^2)))*(Xd^2+Yd^2)^2*sqrt((1/(l1^2*(Xd^2+Yd^2)^2))*(Xd^6-(l1-l2-Yd)*(l1+l2-Yd)*Yd^2*(l1-l2+Yd)*(l1+l2+Yd)+2*l1*l2*Xd^3*Yd*sqrt(-((((l1-l2)^2-Xd^2-Yd^2)*((l1+l2)^2-Xd^2-Yd^2))/(l1^2*l2^2)))+2*l1*l2*Xd*Yd*sqrt(-((((l1-l2)^2-Xd^2-Yd^2)*((l1+l2)^2-Xd^2-Yd^2))/(l1^2*l2^2)))*(l1^2-l2^2+Yd^2)+Xd^4*(2*(l1-l2)*(l1+l2)+Yd^2)+Xd^2*((l1^2-l2^2)^2+4*l1^2*Yd^2-Yd^4))));

salida(1) = T1d;
salida(2) = T2d;
salida(3) = T1pd;
salida(4) = T2pd;