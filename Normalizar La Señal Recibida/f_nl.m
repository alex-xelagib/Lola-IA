% programa adicional 

function Y=f_nl(F,X)
%Funci�n no lineal
% F: tipo de funci�n 0--> logsig
% 1--> tansig
% X: datos de entrada
% Y: salida de la funci�n


if F== 0
Y=logsig(X);
elseif F==1
Y=tansig(X);
else
Y=[];
end