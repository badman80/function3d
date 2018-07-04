unit rotate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Spin;

type
  Tf_rotate = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RadioGroup1: TRadioGroup;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure rotate(); // rotate vx & vy around selected r_axis
  end;

var
  f_rotate: Tf_rotate;

implementation
uses tools,OpenGL;

{$R *.dfm}
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure Tf_rotate.rotate();
var
  a,xi,yi,zi,r : real;
  x,y,z,r1 : real;
  m : integer;
begin
xi:=0; yi:=0; zi:=0; a:=0; r:=0;
x:=0; y:=0; z:=0; r1:=0;
glColor3d(1,1,1);
//=================== start recalculate vx & vy for rotate
if (surface_type=2) then glEnable(GL_LIGHTING);
case (surface_type) of // select what type of drawing needed
  0 : glPolygonMode(GL_FRONT_AND_BACK,GL_POINTS); // drawing points
  1 : glPolygonMode(GL_FRONT_AND_BACK,GL_LINE);   // drawing wire surface
  2 : glPolygonMode(GL_FRONT_AND_BACK,GL_FILL);   // drawing surface
end;
// start drawing surface
if (surface_type=0) then glBegin(GL_POINTS) else glBegin(GL_TRIANGLE_STRIP);
for m:=0 to v_size-2 do
  begin
    while (a<(2*PI)) do
      begin
        case r_axis of
          0 : // rotate around x
            begin
              xi:=vx[m];
              zi:=vy[m]*sin(a);
              yi:=vy[m]*cos(a);
              // next point for drawing surfaces
              x:=vx[m+1];
              z:=vy[m+1]*sin(a);
              y:=vy[m+1]*cos(a);
            end;
          1 : // rotate around y
            begin
              yi:= vy[m];
              zi:= vx[m]*cos(a);
              xi:=-vx[m]*sin(a);
              // next point for drawing surfaces
              y:= vy[m+1];
              z:= vx[m+1]*cos(a);
              x:=-vx[m+1]*sin(a);
            end;
          2 : // rotate around z
            begin
              xi:= vx[m]*cos(a)+vy[m]*sin(a);
              yi:=-vx[m]*sin(a)+vy[m]*cos(a);
              // next point for drawing surfaces
              x:= vx[m+1]*cos(a)+vy[m+1]*sin(a);
              y:=-vx[m+1]*sin(a)+vy[m+1]*cos(a);
            end;
        end;
        r:=sqrt(sqr(xi)+sqr(yi)+sqr(zi)); // calculate if point coordinates...
        r1:=sqrt(sqr(x)+sqr(y)+sqr(z));   // ...out of draw area
        if (r>5.5) or (r<-5.5) or (r1>5.5) or (r1<-5.5) then // don't draw, out of screen
          begin
            a:=a+PI/r_angle;
            continue;
          end;
        glVertex3d(xi,yi,zi);
        glVertex3d(x,y,z);
        a:=a+PI/r_angle;
      end;
    a:=0;
  end;
glEnd();
glPolygonMode(GL_FRONT_AND_BACK,GL_FILL); // this is default value
glDisable(GL_LIGHTING);
//===================
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure Tf_rotate.BitBtn1Click(Sender: TObject);
begin
if (v_size=0) then
  begin ShowMessage('Error 05: Нечего вращать! Выберите функцию!'); Exit; end;
if (RadioGroup1.ItemIndex=3) then begin need_rotate:=0; Exit; end else need_rotate:=1;
r_angle:=f_rotate.SpinEdit1.Value;      // every step function rotate on PI/r_angle
r_axis:=f_rotate.RadioGroup1.ItemIndex; // rotate around axis: 0 - x; 1 - y; 2 - z 
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

end.
