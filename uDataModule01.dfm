object DataModule01: TDataModule01
  OldCreateOrder = False
  Height = 344
  Width = 567
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\Users\w\Documents\DELPHI\banco\ARQUIVO.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=127.0.0.1'
      'Port=3050'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 40
  end
  object QueryUsuario: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM chatusuario;')
    Left = 32
    Top = 128
  end
  object TableUsuario: TFDTable
    Active = True
    IndexFieldNames = 'EMAILUSU'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'CHATUSUARIO'
    TableName = 'CHATUSUARIO'
    Left = 32
    Top = 192
    object TableUsuarioEMAILUSU: TStringField
      FieldName = 'EMAILUSU'
      Origin = 'EMAILUSU'
      Required = True
      Size = 100
    end
    object TableUsuarioNOMEUSU: TStringField
      FieldName = 'NOMEUSU'
      Origin = 'NOMEUSU'
      Required = True
    end
    object TableUsuarioONLINE: TIntegerField
      FieldName = 'ONLINE'
      Origin = 'ONLINE'
    end
  end
  object QueryUsuOnline: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT NomeUsu FROM chatusuario WHERE Online = 1; ')
    Left = 112
    Top = 128
  end
end
