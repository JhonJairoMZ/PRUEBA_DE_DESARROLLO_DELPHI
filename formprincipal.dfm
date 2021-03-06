object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'PRUEBA DE DESARROLLO DELPHI'
  ClientHeight = 437
  ClientWidth = 707
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object edval: TEdit
    Left = 392
    Top = 8
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 1
    Text = 'edval'
    Visible = False
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 707
    Height = 437
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    ExplicitWidth = 705
    ExplicitHeight = 488
    object TabSheet1: TTabSheet
      Caption = 'Manejo de recursividad)'
      object Bevel1: TBevel
        Left = 352
        Top = 16
        Width = 25
        Height = 370
        Shape = bsLeftLine
      end
      object Label4: TLabel
        Left = 24
        Top = 24
        Width = 115
        Height = 18
        Caption = 'Serie Fibonacci'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 400
        Top = 24
        Width = 113
        Height = 18
        Caption = 'Calculo Salario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 400
        Top = 82
        Width = 98
        Height = 13
        Caption = 'NOMBRE EMPLEADO'
      end
      object Label7: TLabel
        Left = 582
        Top = 123
        Width = 35
        Height = 13
        Caption = 'HORAS'
      end
      object edlimite: TEdit
        Left = 24
        Top = 67
        Width = 121
        Height = 21
        TabOrder = 0
        Text = '5'
      end
      object btejecutar1: TButton
        Left = 238
        Top = 65
        Width = 75
        Height = 25
        Caption = 'EJECUTAR'
        TabOrder = 1
        OnClick = btejecutar1Click
      end
      object Memo1: TMemo
        Left = 24
        Top = 96
        Width = 289
        Height = 289
        Lines.Strings = (
          'Memo1')
        ReadOnly = True
        TabOrder = 2
      end
      object btejecutar2: TButton
        Left = 582
        Top = 180
        Width = 75
        Height = 25
        Caption = 'EJECUTAR'
        TabOrder = 5
        OnClick = btejecutar2Click
      end
      object ednom: TEdit
        Left = 400
        Top = 96
        Width = 257
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 3
        Text = 'EDNOM'
      end
      object edhoras: TEdit
        Left = 582
        Top = 139
        Width = 75
        Height = 21
        MaxLength = 3
        NumbersOnly = True
        TabOrder = 4
        Text = 'edhoras'
      end
    end
    object TabSheet2: TTabSheet
      Caption = ' CRUD Clientes. Manejo de base de datos'
      ImageIndex = 1
      object Label1: TLabel
        Left = 24
        Top = 217
        Width = 535
        Height = 13
        Caption = 
          'NOMBRE CLIENTE                                            TP/DCU' +
          '         NUMERO DOCUMENTO     NOMBRE REPRESENTANTE'
      end
      object Label2: TLabel
        Left = 24
        Top = 265
        Width = 526
        Height = 13
        Caption = 
          'NUMERO TELEFONICO                         MAIL                  ' +
          '                                                 NOMBRE DE CONTA' +
          'CTO'
      end
      object Label3: TLabel
        Left = 24
        Top = 317
        Width = 526
        Height = 13
        Caption = 
          'TELEFONO CONTACTO                         VLR/ACTIVOS           ' +
          '         VLR PASIVOS                     VLR/PATRIMONIO'
      end
      object DBGrid1: TDBGrid
        Left = 24
        Top = 32
        Width = 633
        Height = 169
        DataSource = DataModulo.DataSource1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        PopupMenu = PopupMenu1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'codigo'
            Title.Caption = 'CODIGO'
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nombre'
            Title.Caption = 'NOMBRE'
            Width = 185
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tdcu'
            Title.Caption = 'T/DCU'
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ndcu'
            Title.Caption = 'NUMERO DOCUMENTO'
            Width = 133
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nrepresenta'
            Title.Caption = 'REPRESENTANTE'
            Width = 163
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'telefono'
            Title.Caption = 'TELEFONO'
            Width = 98
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'email'
            Title.Caption = 'CORREO ELECTRONICO'
            Width = 221
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nomcontacto'
            Title.Caption = 'NOMBRE CONTACTO'
            Width = 176
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'telcontacto'
            Title.Caption = 'TELEFONO CONTACTO'
            Width = 125
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vlact'
            Title.Caption = 'VL. ACTIVOS'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vlpas'
            Title.Caption = 'VL. PASIVOS'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vlpat'
            Title.Caption = 'VL.PATRIMONIO'
            Width = 86
            Visible = True
          end>
      end
      object btguardar: TButton
        Left = 600
        Top = 329
        Width = 75
        Height = 25
        Caption = 'GUARDAR'
        TabOrder = 12
        OnClick = btguardarClick
      end
      object edcliente: TEdit
        Left = 24
        Top = 232
        Width = 210
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 1
        Text = 'EDNOM'
      end
      object cbdcu: TComboBox
        Left = 240
        Top = 232
        Width = 57
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 2
        Text = 'NIT'
        Items.Strings = (
          'NIT'
          'C.C'
          'T.I'
          'PASS')
      end
      object eddcu: TEdit
        Left = 304
        Top = 232
        Width = 121
        Height = 21
        TabOrder = 3
        Text = 'eddcu'
      end
      object edrepre: TEdit
        Left = 431
        Top = 232
        Width = 226
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 4
        Text = 'EDREPRE'
      end
      object edtel: TEdit
        Left = 24
        Top = 280
        Width = 177
        Height = 21
        NumbersOnly = True
        TabOrder = 5
        Text = 'edtel'
      end
      object edmail: TEdit
        Left = 207
        Top = 280
        Width = 220
        Height = 21
        TabOrder = 6
        Text = 'edmail'
      end
      object edcontact: TEdit
        Left = 433
        Top = 280
        Width = 224
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 7
        Text = 'EDCONTACT'
      end
      object edtelcontact: TEdit
        Left = 24
        Top = 331
        Width = 177
        Height = 21
        TabOrder = 8
        Text = 'edtelcontact'
      end
      object edact: TEdit
        Left = 207
        Top = 331
        Width = 121
        Height = 21
        TabOrder = 9
        Text = 'edact'
      end
      object edpas: TEdit
        Left = 334
        Top = 331
        Width = 121
        Height = 21
        TabOrder = 10
        Text = 'edpas'
      end
      object edpat: TEdit
        Left = 461
        Top = 331
        Width = 121
        Height = 21
        TabOrder = 11
        Text = 'edpat'
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 252
    Top = 120
    object Modificartipodedocumento1: TMenuItem
      Caption = 'Modificar tipo de documento'
      OnClick = Modificartipodedocumento1Click
    end
    object ModificarNumerodedocumento1: TMenuItem
      Caption = 'Modificar Numero de documento'
      OnClick = ModificarNumerodedocumento1Click
    end
    object ModificarMail1: TMenuItem
      Caption = 'Modificar Telefono del Cliente'
      OnClick = ModificarMail1Click
    end
    object ModificarMail2: TMenuItem
      Caption = '-'
    end
    object ModificarContacto1: TMenuItem
      Caption = 'Eliminar registro del Cliente'
      OnClick = ModificarContacto1Click
    end
  end
end
