%f_prime complemento del software 

function y=f_prime(F,x)
% C�lculo de derivada de la funci�n no lineal
% y: derivada de la funci�n con x
% F: tipo de de la funci�n
% 0 --> logsig
% 1 --> tansig


if F==0
y=logsig(x).*(1-logsig(x));
elseif F==1
y=(tansig(x)+1).*(1-tansig(x));
else
y=[];
end