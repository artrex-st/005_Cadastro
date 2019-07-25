program Cadastro;

uses
  Vcl.Forms,
  ufrmCadastro in 'ufrmCadastro.pas' {Form1},
  uClasses in '..\004_Classes\uClasses.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
