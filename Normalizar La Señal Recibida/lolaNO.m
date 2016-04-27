function varargout = lolaNO(varargin)
% LOLANO M-file for lolaNO.fig
%      LOLANO, by itself, creates a new LOLANO or raises the existing
%      singleton*.
%
%      H = LOLANO returns the handle to a new LOLANO or the handle to
%      the existing singleton*.
%
%      LOLANO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LOLANO.M with the given input arguments.
%
%      LOLANO('Property','Value',...) creates a new LOLANO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before lolaNO_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to lolaNO_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help lolaNO

% Last Modified by GUIDE v2.5 27-Apr-2016 00:49:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lolaNO_OpeningFcn, ...
                   'gui_OutputFcn',  @lolaNO_OutputFcn, ...
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


% --- Executes just before lolaNO is made visible.
function lolaNO_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to lolaNO (see VARARGIN)
i=imread('fondo2.jpg');
image(i)
axis off

% Choose default command line output for lolaNO
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes lolaNO wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = lolaNO_OutputFcn(hObject, eventdata, handles) 
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
close lolaNO;
