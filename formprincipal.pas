unit formprincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Menus;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Bevel1: TBevel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edlimite: TEdit;
    btejecutar1: TButton;
    Memo1: TMemo;
    btejecutar2: TButton;
    ednom: TEdit;
    edhoras: TEdit;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBGrid1: TDBGrid;
    btguardar: TButton;
    edcliente: TEdit;
    cbdcu: TComboBox;
    eddcu: TEdit;
    edrepre: TEdit;
    edtel: TEdit;
    edmail: TEdit;
    edcontact: TEdit;
    edtelcontact: TEdit;
    edact: TEdit;
    edpas: TEdit;
    edpat: TEdit;
    PopupMenu1: TPopupMenu;
    Modificartipodedocumento1: TMenuItem;
    ModificarNumerodedocumento1: TMenuItem;
    ModificarMail1: TMenuItem;
    ModificarMail2: TMenuItem;
    ModificarContacto1: TMenuItem;
    edval: TEdit;
    procedure abrirtabla;
    procedure btguardarClick(Sender: TObject);
    procedure btejecutar1Click(Sender: TObject);
    procedure btejecutar2Click(Sender: TObject);
    procedure separadormiles (sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Modificartipodedocumento1Click(Sender: TObject);
    procedure ModificarNumerodedocumento1Click(Sender: TObject);
    procedure ModificarMail1Click(Sender: TObject);
    procedure ModificarContacto1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses formdatamodulo, formpresentacion;


procedure Tform1.abrirtabla;
begin
  with datamodulo.query1 do
   begin
     sql.clear;
     sql.add('select * from crud_clientes');
     open;
   end;
end;


procedure clearEdit(formulario: TForm);
  var i, tamano:integer;
begin
  tamano := formulario.ComponentCount;
  for i:=1 to tamano -1 do
    if (formulario.Components[i] is TEdit) then
       TEdit(formulario.Components[i]).Clear;
end;

procedure Tform1.separadormiles(sender: TObject);
var
i : integer;
num1,num2,serie : string;
begin
      serie:='0123456789';
        num2:='';
        with (Sender as TEdit) do
        begin
            num1:=text;
            if num1[1]='0' then delete(num1,1,1);
            for i:=1 to length(num1) do
            begin
                    if pos(num1[i],serie)>0 then num2:=num2+num1[i];
            end;
            i:=1;
            repeat
                    if (i mod 4=0) then Insert(',',num2,length(num2)-i+2);
                    inc(i);
            until (i>length(num2));
            text:=num2;
            SelStart:=length(num2);
        end;
end;

procedure TForm1.btejecutar1Click(Sender: TObject);
var
 i,n:integer;
 l,t,m,r,r2:integer;
begin
  memo1.Clear;
  if length(edlimite.Text)>0 then
  begin
    n:=strtoint(edlimite.Text);
    l := 1;
    t:= 1;
    m:=0;
    for i := 1 to n do
     begin
        l := t;
        t := m;
        m := l+t;
        memo1.Lines.Add(inttostr(m));
    end;
  end;

end;

procedure TForm1.btejecutar2Click(Sender: TObject);
var
 sl,h,vl1,vl2,n1,n2,hx,hn:integer; nom,val1,val2,val3:string;
begin
  if ((length(ednom.Text)>0)and(length(edhoras.Text)>0)) then
  begin
    h:=strtoint(edhoras.Text);
    vl1:=15000;
    vl2:=19000;
     if h>35 then
     begin
       n1:=h-35; //extras
       hx:=n1*vl2;
       hn:=35*vl1;
        sl:=hn+hx;

        edval.text:=inttostr(sl);
        separadormiles(edval);
        val1:=edval.Text;

        edval.Text:=inttostr(hn);
        separadormiles(edval);
        val2:=edval.Text;

        edval.Text:=inttostr(hx);
        separadormiles(edval);
        val3:=edval.Text;

        application.MessageBox(pwidechar('El empleado: '+ednom.text+'sele debe pagar la suma de: $'+val1+' pesos'+
                               #13+#13+'Valor horas laborales: $'+val2+#13+'Valor extras: $'+val3),'PRUEBA DE DESARROLLO',mb_ok+MB_ICONINFORMATION);
     end;
  end;

end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 fpresentacion.close;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  clearedit(self);
  memo1.Clear;
  pagecontrol1.ActivePageIndex:=0;
end;

procedure TForm1.ModificarContacto1Click(Sender: TObject);
var
 codcliente,cliente:string;
begin

 codcliente:=dbgrid1.Fields[0].AsString;
 cliente:=dbgrid1.Fields[1].AsString;
  if Application.MessageBox(pchar('Desea eliminar el registro del cliente: '+cliente),pchar('CRUD [PRUEBA DE INGRESO]'),mb_iconinformation+MB_YESNO + MB_DEFBUTTON1)= mryes then
   begin
     with datamodulo.query1 do
     begin
       sql.clear;
       sql.add('delete crud_clientes where codigo = '+quotedstr(trim(codcliente)));
       execsql;
      end;
    end;
      Application.MessageBox(pchar('Se modifico el el n?mero telefonico para el cliente: '+cliente),pchar('CRUD [PRUEBA DE INGRESO]'),mb_iconinformation);
  abrirtabla;
end;

procedure TForm1.ModificarMail1Click(Sender: TObject);
var
 valor:string;
 codcliente,cliente:string;
begin

 codcliente:=dbgrid1.Fields[0].AsString;
 cliente:=dbgrid1.Fields[1].AsString;
  if Application.MessageBox(pchar('Desea modificar el n?mero telefonico para el cliente: '+cliente),pchar('CRUD [PRUEBA DE INGRESO]'),mb_iconinformation+MB_YESNO + MB_DEFBUTTON1)= mryes then
   begin
        valor := InputBox('Ingrese tipo', 'telefono : ', '');

     with datamodulo.Query1 do
     begin
       close;
       sql.clear;
       sql.add('update crud_clientes set telefono = '+quotedstr(valor)+' where codigo = '+quotedstr(trim(codcliente)));
       execsql;
      end;

      end;

      Application.MessageBox(pchar('Se modifico el el n?mero telefonico para el cliente: '+cliente),pchar('CRUD [PRUEBA DE INGRESO]'),mb_iconinformation);

  abrirtabla;
end;

procedure TForm1.ModificarNumerodedocumento1Click(Sender: TObject);
var
 valor:string;
 codcliente,cliente:string;
begin

 codcliente:=dbgrid1.Fields[0].AsString;
 cliente:=dbgrid1.Fields[1].AsString;
  if Application.MessageBox(pchar('Desea modificar el n?mero de documento para el cliente: '+cliente),pchar('CRUD [PRUEBA DE INGRESO]'),mb_iconinformation+MB_YESNO + MB_DEFBUTTON1)= mryes then
   begin
        valor := InputBox('Ingrese n?umero de documento', 'ndcu : ', '');

     with datamodulo.Query1 do
     begin
       close;
       sql.clear;
       sql.add('update crud_clientes set ndcu = '+quotedstr(valor)+' where codigo = '+quotedstr(trim(codcliente)));
       execsql;
      end;

      end;

      Application.MessageBox(pchar('Se modifico el n?mero de documento para el cliente: '+cliente),pchar('CRUD [PRUEBA DE INGRESO]'),mb_iconinformation);

  abrirtabla;
end;

procedure TForm1.Modificartipodedocumento1Click(Sender: TObject);
var
 valor:string;
 codcliente,cliente:string;
begin

 codcliente:=dbgrid1.Fields[0].AsString;
 cliente:=dbgrid1.Fields[1].AsString;
  if Application.MessageBox(pchar('Desea modificar el tipo de documento para el cliente: '+cliente),pchar('CRUD [PRUEBA DE INGRESO]'),mb_iconinformation+MB_YESNO + MB_DEFBUTTON1)= mryes then
   begin
        valor := InputBox('Ingrese tipo', 'tpdcu : ', '');

     with datamodulo.Query1 do
     begin
       close;
       sql.clear;
       sql.add('update crud_clientes set tdcu = '+quotedstr(valor)+' where codigo = '+quotedstr(trim(codcliente)));
       execsql;
      end;

      end;

      Application.MessageBox(pchar('Se modifico el tipo de documento para el cliente: '+cliente),pchar('CRUD [PRUEBA DE INGRESO]'),mb_iconinformation);

  abrirtabla;
end;

procedure TForm1.PageControl1Change(Sender: TObject);
begin
  case PageControl1.tabindex of
   0:clearedit(self);
   1:abrirtabla;
  end;
end;


procedure TForm1.btguardarClick(Sender: TObject);
begin
   datamodulo.Conexion.Connected:=true;
   if ((length(edcliente.Text)>0)and(length(eddcu.Text)>0)and(length(edtel.Text)>0)and(length(edmail.Text)>0)) then
   begin
     with datamodulo.query1 do
     begin
       close;
       sql.Clear;
        sql.Add('INSERT INTO crud_clientes (nombre,tdcu,ndcu,nrepresenta,telefono,email,nomcontacto,telcontacto,vlact,vlpas,vlpat,fecha_creado) values( ');
        sql.Add( quotedstr(trim(edcliente.Text))+','+quotedstr(cbdcu.Items[cbdcu.ItemIndex])+','+quotedstr(trim(eddcu.Text))+','+quotedstr(trim(edrepre.Text))+',');
        sql.Add( quotedstr(trim(edtel.Text))+','+quotedstr(trim(edmail.Text))+','+quotedstr(trim(edcontact.Text))+',');
        sql.Add( quotedstr(trim(edtelcontact.Text))+','+quotedstr(trim(edact.Text))+','+quotedstr(trim(edpas.Text))+',');
        sql.Add( quotedstr(trim(edpat.Text))+','+quotedstr(formatdatetime('yyyy-mm-dd',date))+')');
       execSql;
        application.MessageBox(pwidechar('Se registro un nuevo cliente'+#13+''),'CRUD',mb_ok+MB_ICONINFORMATION);
       clearedit(self);
       end;
     abrirtabla;
   end
     else
      begin
        application.MessageBox(pwidechar('Faltan datos de cliente.'+#13+#13+'Verifique "Nombre, Identificaci?n, Telefono y Correo electronico"'),'CRUD',mb_ok+MB_ICONINFORMATION);
     end;
end;
end.
