function varargout = lola(varargin)
% LOLA M-file for lola.fig

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lola_OpeningFcn, ...
                   'gui_OutputFcn',  @lola_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before lola is made visible.
function lola_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to lola (see VARARGIN)
i=imread('fondo3.jpg');
image(i)
axis off


% Choose default command line output for lola
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes lola wait for user response (see UIRESUME)
% uiwait(handles.figure1);



% --- Outputs from this function are returned to the command line.
function varargout = lola_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close lola2;
% Get default command line output from handles structure
varargout{2} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% aparecen etiquetas 
set (handles.text4,'Visible','off');
set (handles.text5,'Visible','off');
set (handles.pushbutton4,'enable','on');
%set (handles.pushbutton4,'Visible','on');

% INICIA EL VERDADERO PROGRAMA 
%clear all;                                  %Limpiar
%set(handles.pushbutton1,'string','runb','enable','off');
h= msgbox('Escuchando...');
%set(handles.pushbutton1,'String', 'Grabando');
fs=8000;                                    %8000 muestras por segundo Hz
duracion = 2;                               %t segundos

y=wavrecord(duracion*fs,fs,'double');       %Grabar #'double'(valor predeterminado), 16 bits / muestra 

disp('Stop');                               %Despliegue "stop"
fr=8000;                                    %Muestra 8000
x=y;                                        %igualar x a y 
%x2 es la señal normalvcizada%
mwad=max(x);                                %Devuele los más grandes elementos de x
mwid=min(x);                                %Devuele los más pequeños elementos de x
x3=x/(max(mwad,mwid));                      %C = max( A , B ) devuelve una matriz con los elementos más importantes tomadas de A o B .
%Calculo de potencia%
x2=x3;                                      %Señal normalizada
gamma=1000/(fr*.2);
E(1)=0.0;
for i=2:length(x2)
    E(i)=(1-gamma)*E(i-1)+gamma*x2(i)*x2(i)/0.00000000052998;
end

%Calculo de inicio y final de la señal de voz%
maxp=max(E);
M=(maxp*.2);
N=(maxp*.9);
er=0;
for i=1:length(E)
    if E(i)>=M
        Id2=i;
        break;
    end
end

for j=Id2:-1:1
    if E(j)<=N
        Id1=j;
er=er+1;
    break;
    end
        if er==0
            Id1=Id2;
        end
end

elz=0;
for i=length(E):-1:1
    if E(i)>=M
        Id22=i;
        break;
    end
end

for j=Id22:1:length(E)
    if E(j)<=N
        Id11=j;
elz=elz+1;
        break;
    end
    
        if elz==0
        id11=id22; 
        end
end 

%PX inicio y final de la potencia%
PX=x2(Id1:Id11);

%Señal acotada%
xiyf=x(Id1:Id11);
set (handles.text1,'Visible','off');
delete(h);
wavwrite(xiyf,8000,'abrirA1.wav');
sound(y,fs);
set (handles.text6,'Visible','on');
set (handles.edit1,'Visible','on');
subplot(2,1,1);plot(x);
subplot(2,1,2);plot(PX);

%--------NUEVO CODIGO --------
N=10;
c1=xiyf;
[lpcc1,ga2]=lpc(c1,N);
t=2:11;
c11=(abs(lpcc1(:,t)));

N=11; %neuronas de entrada (incluido el BIAS)
L=7; %neuronas de la capa oculta (incluido el BIAS)
M=3; %neuronas de salida
NT=1; %patrones de entrenamiento
epsilon=0.005; %error cuadrático medio requerido

% llamando archivos de entrenamiento 
PE=[c11];
fidfun=fopen('Wij.dat','r');
Ws=fscanf(fidfun,'%f',[L-1,inf]);
Ws=Ws';
fclose(fidfun);
fidfun=fopen('Vij.dat','r');
Vs=fscanf(fidfun,'%f',[M,inf]);
Vs=Vs';
fclose(fidfun);
for i=1:1
X=[1.0,PE(i,:)];
U_hat=X*Ws;
U=[1.0,f_nl(1,U_hat)];
Y_hat=U*Vs;
Y=hardlims(f_nl(1,Y_hat));
fprintf(1,'Salida de la Red: %d %d %d \n\n',Y(1),Y(2),Y(3));
end

% Respuestas a la evaluación %
%if (Y~=[1 -1 -1])|(Y~=[-1 1 -1]);
%    fprintf('error acceso denegado'); % abrir ventana lola-error %
%    lolaNO;
%end
if (Y==[-1 1 -1]);
    fprintf('abrir persona BBBB'); % abrir ventana lolaJuan %
    lolaJuan;
elseif (Y==[1 -1 -1]);
    fprintf('abrir persona AAAA'); % abrir ventana lolaAlex %
    %pause(0.5);
    lolaAlex;
else
    %(Y==[1 1 -1]);
    fprintf('error acceso denegado'); % abrir ventana lola-error %
    lolaNO;
end




% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close lola;
lola2;


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a= wavread('Ralex.wav');
wavplay(a,44000);
