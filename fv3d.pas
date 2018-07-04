unit fv3d;

interface

uses
  Windows, Messages, Forms, OpenGL, Controls, StdCtrls, Classes, ExtCtrls,
  Menus, Dialogs, Graphics, Buttons, Mask, Spin;

type
  Tf_main = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    help1: TMenuItem;
    About1: TMenuItem;
    Options1: TMenuItem;
    N1: TMenuItem;
    procedure FormCreate(Sender : TObject);
    procedure FormResize(Sender : TObject);
    procedure FormDestroy(Sender : TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormKey(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Options1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);

  private
    DC : HDC;
    hrc : HGLRC;
    timer1 : uint;
    procedure SetDCPixelFormat();
    procedure Form_create_text();
  protected
    procedure WMPaint(var Msg: TWMPaint); message WM_PAINT;
  end;
var
  f_main : Tf_main;

implementation
uses mmSystem, about,GLunit,tools,dialog,rotate;

{$R *.DFM}
//------------------------------------------------------------------------------
procedure FTimerCallBack(uTimerID,uMessage : UINT; dwUser,dw1,dw2: DWORD) stdcall;
begin
InvalidateRect(f_main.Handle, nil, False); // перерисовка региона
end;
//------------------------------------------------------------------------------
procedure Tf_main.WMPaint(var Msg: TWMPaint);
var
  ps : TPaintStruct;
begin
  BeginPaint(Handle,ps);
//==========
start_draw();
if (need_rotate<>0) then f_rotate.rotate;
//==========
  SwapBuffers(DC);
  EndPaint(Handle,ps);
end;
//------------------------------------------------------------------------------
procedure Tf_main.SetDCPixelFormat();
var
  pfd : TPIXELFORMATDESCRIPTOR; // данные формата пикселей
  nPixelFormat : Integer;
  nPixelSet : Bool;
begin
FillChar(pfd,SizeOf(pfd),0);
  With pfd do begin
    nSize:=sizeof(pfd);
    nVersion:=1;
    dwFlags:=PFD_DRAW_TO_WINDOW or PFD_SUPPORT_OPENGL or PFD_DOUBLEBUFFER;
    iPixelType:=PFD_TYPE_RGBA;  // режим для изображения цветов
    cColorBits:=24;             // число битовых плоскостей в каждом буфере цвета
    cDepthBits:=32;             // размер буфера глубины (ось z)
    cStencilBits:=8;            // размер буфера трафарета
    iLayerType:=PFD_MAIN_PLANE; // тип плоскости
  end;
nPixelFormat:=ChoosePixelFormat(f_main.DC,@pfd); // поддерживается ли выбранный формат пикселей
if (nPixelFormat=0) then begin MessageDlg('Error 01: Can`t execute ChoosePixelFormat()',mtError,[mbAbort],0); halt; end;
nPixelSet:=SetPixelFormat(f_main.DC,nPixelFormat,@pfd); // устанавливаем формат пикселей в контексте устройства
if (nPixelSet=false) then begin MessageDlg('Error 02: Can`t execute SetPixelFormat()',mtError,[mbAbort],0); halt; end;
DescribePixelFormat(f_main.DC,nPixelFormat,sizeof(TPixelFormatDescriptor),pfd);
end;
//------------------------------------------------------------------------------
procedure Tf_main.Form_create_text();
var
  hFontNew, hOldFont : HFONT;
  agmf : Array [0..255] of TGLYPHMETRICSFLOAT;
begin
hFontNew:=CreateFont(-14,0,0,0,FW_NORMAL,0,0,0,ANSI_CHARSET,OUT_TT_PRECIS,
                     CLIP_DEFAULT_PRECIS,ANTIALIASED_QUALITY,
                     FF_DONTCARE or DEFAULT_PITCH,'Courier New');
hOldFont:=SelectObject(DC,hFontNew);
wglUseFontOutlines(DC,0,255,l_text,0.0,0.15,WGL_FONT_POLYGONS,@agmf);
DeleteObject(SelectObject(DC,hOldFont));
DeleteObject(SelectObject(DC,hFontNew));
end;
//------------------------------------------------------------------------------
procedure Tf_main.FormCreate(Sender : TObject);
begin
DC:=GetDC(Handle);
SetDCPixelFormat();
hrc:=wglCreateContext(DC);
wglMakeCurrent(DC,hrc);
Form_create_text();
timer1:=timeSetEvent(2,0,@FTimerCallBack,0,TIME_PERIODIC);
gl_create_form();
end;
//------------------------------------------------------------------------------
procedure Tf_main.FormResize(Sender : TObject); begin start_form_resize(width,height); end;
//------------------------------------------------------------------------------
procedure Tf_main.FormDestroy(Sender : TObject);
begin
gl_destroy_form();
delete_vf();
timeKillEvent(Timer1);
wglMakeCurrent(0,0);
wglDeleteContext(hrc);
ReleaseDC(Handle,DC);
end;
//------------------------------------------------------------------------------
procedure Tf_main.FormKey(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case (Key) of
    VK_ESCAPE : Application.Terminate;
    VK_UP     : coord_rotate(1,0,0);  // up
    VK_DOWN   : coord_rotate(-1,0,0); // down
    VK_LEFT   : coord_rotate(0,-1,0); // left
    VK_RIGHT  : coord_rotate(0,1,0);  // right
    VK_NEXT   : coord_rotate(0,0,-1); // page_up
    VK_DELETE : coord_rotate(0,0,1);  // page_down
  end;
end;
//------------------------------------------------------------------------------
procedure Tf_main.FormKeyPress(Sender: TObject; var Key: Char);
begin
{  case (Key) of
  end;}
end;
//------------------------------------------------------------------------------
procedure Tf_main.Exit1Click(Sender: TObject); begin Application.Terminate; end;
//------------------------------------------------------------------------------
procedure Tf_main.About1Click(Sender: TObject); begin f_about.ShowModal(); end;
//------------------------------------------------------------------------------
procedure Tf_main.Options1Click(Sender: TObject); begin f_dialog.ShowModal(); end;
//------------------------------------------------------------------------------
procedure Tf_main.N1Click(Sender: TObject); begin f_rotate.ShowModal(); end;
//------------------------------------------------------------------------------


end.

