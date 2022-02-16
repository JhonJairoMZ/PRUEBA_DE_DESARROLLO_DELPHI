unit formdatamodulo;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TDataModulo = class(TDataModule)
    Conexion: TADOConnection;
    DataSource1: TDataSource;
    Query1: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModulo: TDataModulo;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
