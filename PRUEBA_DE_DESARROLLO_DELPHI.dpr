program PRUEBA_DE_DESARROLLO_DELPHI;

uses
  Vcl.Forms,
  formpresentacion in 'formpresentacion.pas' {fpresentacion},
  formprincipal in 'formprincipal.pas' {Form1},
  formdatamodulo in 'formdatamodulo.pas' {DataModulo: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfpresentacion, fpresentacion);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModulo, DataModulo);
  Application.Run;
end.
