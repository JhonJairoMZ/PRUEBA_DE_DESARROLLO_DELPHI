object DataModulo: TDataModulo
  OldCreateOrder = False
  Height = 142
  Width = 361
  object Conexion: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=CRUD;' +
      'Initial Catalog=CRUD'
    LoginPrompt = False
    Left = 64
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 144
    Top = 24
  end
  object Query1: TADOQuery
    Connection = Conexion
    Parameters = <>
    Left = 232
    Top = 24
  end
end
