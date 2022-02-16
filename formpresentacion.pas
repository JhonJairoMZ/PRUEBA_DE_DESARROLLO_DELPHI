unit formpresentacion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  Tfpresentacion = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fpresentacion: Tfpresentacion;

implementation

{$R *.dfm}

uses formdatamodulo, formprincipal;

procedure Tfpresentacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Application.Terminate;
end;

procedure Tfpresentacion.Timer1Timer(Sender: TObject);
begin
 datamodulo.Conexion.Connected:=true;
 fpresentacion.hide;
 form1.Show;
 timer1.Enabled:=false;
end;

end.
