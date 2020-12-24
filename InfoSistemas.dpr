program InfoSistemas;

uses
  Vcl.Forms,
  Cadastro in 'Cadastro.pas' {FrCadastro},
  Rotinas in 'Rotinas.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrCadastro, FrCadastro);
  Application.Run;
end.
