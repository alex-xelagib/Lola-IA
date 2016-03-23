function varargout = lola(varargin)
% LOLA M-file for lola.fig
%      LOLA, by itself, creates a new LOLA or raises the existing
%      singleton*.
%
%      H = LOLA returns the handle to a new LOLA or the handle to
%      the existing singleton*.
%
%      LOLA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LOLA.M with the given input arguments.
%
%      LOLA('Property','Value',...) creates a new LOLA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before lola_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to lola_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help lola

% Last Modified by GUIDE v2.5 22-Mar-2016 14:35:27

% Begin initialization code - DO NOT EDIT
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

% Get default command line output from handles structure
varargout{2} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


clear all;                                  %Limpiar
%set(handles.pushbutton1,'String', 'Grabando');
fs=8000;                                    %8000 muestras por segundo Hz
duracion = 2;                               %t segundos

y=wavrecord(duracion*fs,fs,'double');       %Grabar #'double'(valor predeterminado), 16 bits / muestra 

disp('Stop');                               %Despliegue "stop"
fr=8000;                                    %Muestra 8000
x=y;                                        %igualar x a y 
%x2 es la se�al normalvcizada%
mwad=max(x);                                %Devuele los m�s grandes elementos de x
mwid=min(x);                                %Devuele los m�s peque�os elementos de x
x3=x/(max(mwad,mwid));                      %C = max( A , B ) devuelve una matriz con los elementos m�s importantes tomadas de A o B .
%Calculo de potencia%
x2=x3;                                      %Se�al normalizada
gamma=1000/(fr*.2);
E(1)=0.0;
for i=2:length(x2)
    E(i)=(1-gamma)*E(i-1)+gamma*x2(i)*x2(i)/0.00000000052998;
end

%Calculo de inicio y final de la se�al de voz%
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

%Se�al acotada%
xiyf=x(Id1:Id11);

wavwrite(xiyf,8000,'abrirA1.wav');

sound(y,fs);
subplot(2,1,1);plot(x);
subplot(2,1,2);plot(PX);



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


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


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton1.
function pushbutton1_ButtonDownFcn(hObject, eventdata, handles)

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on pushbutton1 and none of its controls.
function pushbutton1_KeyPressFcn(hObject, eventdata, handles)

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
