function varargout = lolaJuan(varargin)
% LOLAJUAN M-file for lolaJuan.fig
%      LOLAJUAN, by itself, creates a new LOLAJUAN or raises the existing
%      singleton*.
%
%      H = LOLAJUAN returns the handle to a new LOLAJUAN or the handle to
%      the existing singleton*.
%
%      LOLAJUAN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LOLAJUAN.M with the given input arguments.
%
%      LOLAJUAN('Property','Value',...) creates a new LOLAJUAN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before lolaJuan_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to lolaJuan_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help lolaJuan

% Last Modified by GUIDE v2.5 27-Apr-2016 00:11:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lolaJuan_OpeningFcn, ...
                   'gui_OutputFcn',  @lolaJuan_OutputFcn, ...
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


% --- Executes just before lolaJuan is made visible.
function lolaJuan_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to lolaJuan (see VARARGIN)
i=imread('fondo1.jpg');
image(i)
axis off
a= wavread('Rjuancho.wav');
wavplay(a,44000);
% Choose default command line output for lolaJuan
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes lolaJuan wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = lolaJuan_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close lolaJuan;



% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
i=imread('fondoJ.jpg');
image(i)
axis off
% Hint: place code in OpeningFcn to populate axes1
