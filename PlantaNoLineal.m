function salida = fcn(entrada)
global g m1 m2 l1 l2 lc1 lc2 I1 I2 b1 b2

T1 = entrada(1);
Tp1 = entrada(2);
T2 = entrada(3);
Tp2 = entrada(4);
Par1 = entrada(5);

Tpp1=-((-(I2+m2*lc2^2+m2*l1*lc2*cos(T2))*(g*m2*lc2*sin(T1+T2)+m2*l1*lc2*sin(T2)*Tp1^2+b2*Tp2)+(I2+m2*lc2^2)*(g*(m2*l1+m1*lc1)*sin(T1)+g*m2*lc2*sin(T1+T2)+b1*Tp1-m2*l1*lc2*sin(T2)*Tp2*(2*Tp1+Tp2)-Par1))/((I1+m2*l1^2+m1*lc1^2)*(I2+m2*lc2^2)-m2^2*l1^2*lc2^2*cos(T2)^2));
Tpp2=(g*(2*I2*(m2*l1+m1*lc1)+m2*(m2*l1+2*m1*lc1)*lc2^2+m2*lc2*(-2*(I1+m1*lc1*(-l1+lc1))*cos(T2)-m2*l1*lc2*cos(2*T2)))*sin(T1)-2*g*m2*lc2*cos(T1)*(I1+m2*l1^2+m1*lc1^2+m2*l1*lc2*cos(T2))*sin(T2)-2*m2*l1*lc2*(I1+I2+m1*lc1^2+m2*(l1^2+lc2^2)+2*m2*l1*lc2*cos(T2))*sin(T2)*Tp1^2-2*b2*(I1+I2+m1*lc1^2+m2*(l1^2+lc2^2)+2*m2*l1*lc2*cos(T2))*Tp2-2*m2*l1*lc2*(I2+m2*lc2^2+m2*l1*lc2*cos(T2))*sin(T2)*Tp2^2+2*(I2+m2*lc2^2+m2*l1*lc2*cos(T2))*Tp1*(b1-2*m2*l1*lc2*sin(T2)*Tp2)-2*(I2+m2*lc2^2+m2*l1*lc2*cos(T2))*Par1)/(2*(I1+m2*l1^2+m1*lc1^2)*(I2+m2*lc2^2)-2*m2^2*l1^2*lc2^2*cos(T2)^2);

salida(1) = Tpp1;
salida(2) = Tpp2;