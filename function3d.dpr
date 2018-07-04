program function3d;

uses
  Forms,
  fv3d in 'fv3d.pas' {f_main},
  about in 'about.pas' {f_about},
  GLunit in 'GLunit.pas',
  tools in 'tools.pas',
  dialog in 'dialog.pas' {f_dialog},
  rotate in 'rotate.pas' {f_rotate};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(Tf_main, f_main);
  Application.CreateForm(Tf_about, f_about);
  Application.CreateForm(Tf_dialog, f_dialog);
  Application.CreateForm(Tf_rotate, f_rotate);
  Application.Run;
end.

