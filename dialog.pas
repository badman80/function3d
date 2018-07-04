unit dialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Spin;

type
  Tf_dialog = class(TForm)
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    SpinEdit1: TSpinEdit;
    Label_el_n: TLabel;
    ListBox1: TListBox;
    Label_f: TLabel;
    BitBtn2: TBitBtn;
    Edit_a: TEdit;
    Edit_b: TEdit;
    Edit_c: TEdit;
    Label_k: TLabel;
    Label_a: TLabel;
    Label_b: TLabel;
    Label_c: TLabel;
    Label_i: TLabel;
    Label_x2: TLabel;
    Label_x1: TLabel;
    Edit_x1: TEdit;
    Edit_x2: TEdit;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Button1: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_dialog: Tf_dialog;

implementation
uses tools, math;

{$R *.dfm}
//------------------------------------------------------------------------------
procedure Tf_dialog.BitBtn1Click(Sender: TObject);
var
  x1,x2,i,a,b,c : real;
  m : integer;
begin
//=========
if (ListBox1.ItemIndex<0) then begin ShowMessage('Error 04: Нужно выбрать функцию!'); Exit; end;
a:=1; b:=1; c:=1;
try a:=StrToFloat(Edit_a.Text); except on  E : EConvertError do
  begin ShowMessage('Error 03: Неверное значение коэффициента A'); Exit; end; end;
try b:=StrToFloat(Edit_b.Text); except on  E : EConvertError do
  begin ShowMessage('Error 03: Неверное значение коэффициента B'); Exit; end; end;
try c:=StrToFloat(Edit_c.Text); except on  E : EConvertError do
  begin ShowMessage('Error 03: Неверное значение коэффициента C'); Exit; end; end;
try x1:=StrToFloat(Edit_x1.Text); except on  E : EConvertError do
  begin ShowMessage('Error 03: Неверное значение коэффициента X1'); Exit; end; end;
try x2:=StrToFloat(Edit_x2.Text); except on  E : EConvertError do
  begin ShowMessage('Error 03: Неверное значение коэффициента X2'); Exit; end; end;
//=========
delete_vf(); // delete old vectors
v_size:=SpinEdit1.Value;
make_vf(v_size); m:=0;
i:=(Abs(x1)+Abs(x2))/v_size;
while (m<v_size) do
  begin
    vx[m]:=x1;
    case (ListBox1.ItemIndex) of
      0 : vy[m]:=a*x1;
      1 : vy[m]:=a*(x1*x1);
      2 : vy[m]:=a*(x1*x1*x1);
      3 : vy[m]:=a/(b*x1);
      4 : vy[m]:=a*sin(b*x1);
      5 : vy[m]:=a*cos(b*x1);
      6 : vy[m]:=a*tan(b*x1);
      7 : vy[m]:=a*(1/tan(b*x1));
      8 : vy[m]:=a*Exp(b*x1);
      9 : vy[m]:=a*Power(b,c*x1);
     10 : vy[m]:=a*ln(b*x1);
     11 : vy[m]:=a*log10(b*x1);
     12 : vy[m]:=c*logN(a,b*x1);
    end;
    x1:=x1+i; m:=m+1;
  end;
surface_type:=f_dialog.ComboBox1.ItemIndex;
end;
//------------------------------------------------------------------------------
procedure Tf_dialog.Button1Click(Sender: TObject);
begin
f_dialog.Edit_x1.Text:='-5,5';
f_dialog.Edit_x2.Text:='5,5';
end;
//------------------------------------------------------------------------------


end.
