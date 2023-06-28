clear all; clc; close all;
syms s k1 k2 k3 k4
global g m1 m2 l1 l2 lc1 lc2 I1 I2 b1 b2
%********parametros de tiempo*******
ts = 10;	%tiempo para la simulación
tm = 0.01;  %tiempo de muestreo
%***********************************
        %parámetros del sistema
%***********************************
c1=0.3; c2=0.2; c3=0.065; c4=0.025; c5=0.07; c6=0.03; c7=3; c8=0.01; c9=3; %Constantes que pueden cambiar
%***********************************
g=9.78 ;%gravedad
l1=c1; %longitud del eslabón 1
l2=c2; %longitud del eslabón 2
m1=c3; %masa 1
m2=c4; %masa 2
lc1=0.25; %longitud al centro de masa del eslabón 1
lc2=0.11; %longitud al centro de masa del eslabón 2
a1=c5; %ancho barra 1
d1=c6; %grosor barra 1
a2=c5; %ancho barra 2
d2=c6; %grosor barra 2
I1=1/12*m1*(a1^2+d1^2); %módulo de inercia 1
I2=1/12*m2*(a2^2+d2^2); %módulo de inercia 2
b1=c8; %constante de fricción 1
b2=c8; %constante de fricción 2

%*********************************
% punto para linealizar (punto de operación)
Tt1g = 180;      Tt1  = Tt1g*pi/180; %posición 1 [radianes]
Tt2g = 0;      Tt2  = Tt2g*pi/180; %posición 2 [radianes]
Tpt1g = 0;     Tpt1 = Tpt1g*pi/180; %velocidad 1
Tpt2g = 0;     Tpt2 = Tpt2g*pi/180; %velocidad 2
Tppt1g = 0;    Tppt1 = Tppt1g*pi/180; %aceleración 1
Tppt2g = 0;    Tppt2 = Tppt2g*pi/180; %aceleración 2

Tau1 = g*m2*l1*sin(Tt1)+g*m1*lc1*sin(Tt1)+g*m2*lc2*sin(Tt1+Tt2)-2*m2*l1*lc2*sin(Tt2)*Tpt1*Tpt2- m2*l1*lc2*sin(Tt2)*Tpt2^2+I1*Tppt1+I2*Tppt1+m2*l1^2*Tppt1+m1*lc1^2*Tppt1+m2*lc2^2*Tppt1+2*m2*l1*lc2*cos(Tt2)*Tppt1+ I2*Tppt2+m2*lc2^2*Tppt2+m2*l1*lc2*cos(Tt2)*Tppt2 + b1*Tpt1; % par de entrada 1

X0=[Tt1;Tpt1;Tt2;Tpt2]; %Punto de operación
U0=[Tau1];
XI=[0;0;0;0]; %Condiciones iniciales
              %Al linealizar en el punto superior, las condiciones
              %iniciales son cero en el sistema lineal

Ref=0.2; %Referencia deseada

%***********************************
        %Linealización
%***********************************
[Al,Bl,Cl,Dl]=linmod('Pendulo2GDL',X0,U0); %Matrices Linealizadas
C=[1 0 0 0]; %Salidas deseadas, posiciones angulares
D=[0];
%***********************************
        %Discretización
%***********************************
Planta=ss(Al,Bl,C,D);
PlantaD=c2d(Planta,tm);
[AD,BD,CD,DD]=ssdata(PlantaD);
%***********************************
         %datos del usuario
%***********************************
Ttran = 1;      %[s] Controlador
freccon = 0;	%[Hz]
%***********************************
polosSistema = eig(Al)
SysL=(s-polosSistema(1))*(s-polosSistema(2))*(s-polosSistema(3))*(s-polosSistema(4));
SysLrhc=sym2poly(SysL);
rhc(SysLrhc)    %Estabilidad del sistema linealizado con Routh-Hurtwitz
%***********************************
        %Control Lineal
%***********************************
MC=ctrb(Al,Bl);
if rank(MC) == 4 %controlabilidad del sistema
    disp('Sistema Controlable.')
  if freccon == 0
  	Pd1 = -5/Ttran;
    Pd2 = -5/Ttran-1;
    Pd3 = 5*Pd1;
    Pd4 = 5*Pd2;
  else
    Pd1 = -5/Ttran+freccon*2*pi*j;
    Pd2 = -5/Ttran-freccon*2*pi*j;
    Pd3 = -5*5/Ttran+freccon*2*pi*j;
    Pd4 = -5*5/Ttran-freccon*2*pi*j;
  end
else
    disp('Sistema No Controlable.')
end
MO=obsv(Al,C);
if rank(MO) == 4 %observabilidad del sistema
    fprintf('Sistema Observable\n')
else
    fprintf('Sistema No Observable\n')
end

K=place(Al,Bl,[Pd1 Pd2 Pd3 Pd4]);
KD=place(AD,BD,exp([Pd1 Pd2 Pd3 Pd4]*tm));
K0=inv(C*(inv(-Al+Bl*K))*Bl);
K0D=inv(CD*inv(eye(4)-AD+BD*KD)*BD);
L=place(Al',C',[5*Pd1 5*Pd2 5*Pd3 5*Pd4])'; %Polos del observador alejados 5 veces más del controlador
LD=place(AD',CD',exp([5*Pd1 5*Pd2 5*Pd3 5*Pd4]*tm))';

PLCON = eig(Al-Bl*K);
LyapL=(s-PLCON(1))*(s-PLCON(2))*(s-PLCON(3))*(s-PLCON(4));
LyapLrhc=sym2poly(LyapL);
rhc(LyapLrhc)       %Estabilidad lineal con controlador lineal por Routh-Hurtwitz

run Pendulo2GDL_LazoAbierto
run ControlPendulo2GDL_PL
run ControlPendulo2GDL_PNL
