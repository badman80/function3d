unit about;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  Tf_about = class(TForm)
    Bevel1: TBevel;
    Image1: TImage;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    BitBtn1: TBitBtn;
    StaticText4: TStaticText;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_about: Tf_about;

implementation

{$R *.dfm}
//------------------------------------------------------------------------------
procedure Tf_about.BitBtn1Click(Sender: TObject); begin f_about.Close; end;
//------------------------------------------------------------------------------

end.
