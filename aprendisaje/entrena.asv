% parte en la que entrena la red 
% la idea es crear la red neuronal y cada vez que de un resultado 
% guardarlo en un archivo
% asi la segunda interacion lee el archivo y lo vuelve a corregir 
% asi hasta que llegue al error minimo 0.0005
% o bien que haga cierto numero de interaciones
%(que nosotros se los damos)

% si resulta para un archivo ...
%lo podemodes hacer para que ejecute todos los archivos a la vez 

clear all;
clc
N=10;

% abrir los grabaciones 
[a1,fr1]=wavread ('abrirA1');
[b1,fr1]=wavread ('abrirB1');
[a2,fr2]=wavread ('abrirA2');
[b2,fr2]=wavread ('abrirB2');
[a3,fr3]=wavread ('abrirA3');
[b3,fr3]=wavread ('abrirB3');

[a4,fr4]=wavread ('abrirA4');
[b4,fr4]=wavread ('abrirB4');
[a5,fr5]=wavread ('abrirA5');
[b5,fr5]=wavread ('abrirB5');


% Coeficientes en frecuencia de comandos %
% del primer archivo hay que obtener la frecuencia 
% aca comienza el analisis 
[lpca1,ga1]=lpc(a1,N);
[lpcb1,gb1]=lpc(b1,N);
[lpca2,ga2]=lpc(a2,N);
[lpcb2,gb2]=lpc(b2,N);
[lpca3,ga3]=lpc(a3,N);
[lpcb3,gb3]=lpc(b3,N);
[lpca4,ga4]=lpc(a4,N);
[lpcb4,gb4]=lpc(b4,N);
[lpca5,ga5]=lpc(a5,N);
[lpcb5,gb5]=lpc(b5,N);

t=2:11;
pa1=(abs(lpca1(:,t)));
pb1=(abs(lpcb1(:,t)));
pa2=(abs(lpca2(:,t)));
pb2=(abs(lpcb2(:,t)));
pa3=(abs(lpca3(:,t)));
pb3=(abs(lpcb3(:,t)));
pa4=(abs(lpca4(:,t)));
pb4=(abs(lpcb4(:,t)));
pa5=(abs(lpca5(:,t)));
pb5=(abs(lpcb5(:,t)));

% DATOS IMPORTANTES %
N=11; % neuronas de entrada (incluido el BIAS) %
L=7; % neuronas de la capa oculta (incluido el BIAS) %
M=3; % neuronas de salida %
NT=10; % patrones de entrenamiento %
NI=100000; % # maximo de iteraciones (epochs) %
epsilon=0.005; % error cuadratico medio requerido %

Ws=(2*rand(N,L-1))-1;
Vs=(2*rand(L,M))-1;
% Datos de entrenamiento %
PE=[pa1;pb1;
pa2;pb2;
pa3;pb3;
pa4;pb4;
pa5;pb5];
% Salida deseada de cada uno %
D=[ 1 -1 -1;
-1 1 -1;
-1 -1 1;
1 -1 -1;
-1 1 -1;
-1 -1 1;
1 -1 -1;
-1 1 -1;
-1 -1 1;
1 -1 -1;
-1 1 -1;
-1 -1 1;
1 -1 -1;
-1 1 -1;
-1 -1 1];

% for principal no. de iteraciones para entrenamiento %
for k=1:NI
Err=0;
for i=1:NT;
if k<=70
miu=0.3;
end
if k>70&k<=200 % Factor de convergencia %
miu=0.1;
end
if k>200
miu=0.05;
end
X=[1.0,PE(i,:)]; %BIAS y patrones de entrenamiento %


%Calculo de salida de la red %
U_hat=X*Ws;
U=[1.0,f_nl(1,U_hat)]; %agrega BIAS %
Y_hat=U*Vs;
Y=f_nl(1,Y_hat); % LLAMA A COMPLEMENTO !!!!
E=D(i,:)-Y;

% Adaptación %
delta1=E.*f_prime(1,Y_hat);
Vs=Vs+miu*U'*delta1;
S=Vs*delta1';
delta2=S(2:L)'.*f_prime(1,U_hat);
Ws=Ws+miu*X'*delta2;
Err=Err+E*E';
end % i
Err=Err/(NT*M);
vec_err(1,k)=Err;  
fprintf(1,'Err=%4.9f ==> %d\n',Err,k);
if Err<epsilon
break;
end
end % k


for i=1:NT
X=[1.0,PE(i,:)];
U_hat=X*Ws;
U=[1.0,f_nl(1,U_hat)];
Y_hat=U*Vs;
Y=hardlims(f_nl(1,Y_hat));
fprintf(1,'Salida de la Red: %d %d %d \n\n',Y(1),Y(2),Y(3));
end

fidfun=fopen('Wij.dat','w');
fprintf(fidfun,'%6.4f %6.4f %6.4f %6.4f %6.4f %6.4f\n',Ws');
fclose(fidfun);
fidfun=fopen('Vij.dat','w');
fprintf(fidfun,'%6.4f %6.4f %6.4f %6.4f %6.4f %6.4f\n',Vs');
fclose(fidfun);
