object Dm: TDm
  OldCreateOrder = False
  Height = 344
  Width = 567
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database= /opt/firebird/data/ARQUIVO.FDB'
      'User_Name=SYSDBA'
      'Password=lAJdzUzulns9BJrN0nz4'
      'Server=env-0276048.jelastic.saveincloud.net'
      'Port=12690'
      'Protocol=TCPIP'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 24
  end
  object QueryUsuario: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM chatusuario;')
    Left = 216
    Top = 24
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    VendorLib = 'C:\Program Files\Firebird\Firebird_2_5\WOW64\fbclient.dll'
    Left = 128
    Top = 24
  end
  object QueryTimeGlobal: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select count(*) from mensagem m'
      'where'
      'm.destinatario = '#39'ALL'#39
      'and'
      'm.dataenvio > :horaglobal')
    Left = 296
    Top = 24
    ParamData = <
      item
        Name = 'HORAGLOBAL'
        DataType = ftDateTime
        ParamType = ptInput
        Value = 44439.8405092593d
      end>
  end
  object QueryTimePrivado: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select count(*) from mensagem m'
      'where'
      'm.destinatario = :dest'
      'and'
      'm.dataenvio > :horaglobal')
    Left = 384
    Top = 24
    ParamData = <
      item
        Name = 'DEST'
        DataType = ftString
        ParamType = ptInput
        Value = 'leonardo.c.a.p2@gmail.com'
      end
      item
        Name = 'HORAGLOBAL'
        DataType = ftDateTime
        ParamType = ptInput
        Value = 44439.5071759259d
      end>
  end
  object QueryRemetentePrivado: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select distinct m.remetente from mensagem m'
      'where'
      'm.destinatario = :dest'
      'and'
      'm.dataenvio > :horaglobal')
    Left = 384
    Top = 96
    ParamData = <
      item
        Name = 'DEST'
        DataType = ftString
        ParamType = ptInput
        Value = 'leonardo.c.a.p2@gmail.com'
      end
      item
        Name = 'HORAGLOBAL'
        DataType = ftDateTime
        ParamType = ptInput
        Value = 44439.5071759259d
      end>
  end
  object QueryRemetenteCount: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select count(*) from mensagem m'
      'where'
      'm.destinatario = :dest'
      'and'
      'm.remetente = :rem'
      'and'
      'm.dataenvio > :horaglobal')
    Left = 392
    Top = 192
    ParamData = <
      item
        Name = 'DEST'
        DataType = ftString
        ParamType = ptInput
        Value = 'leonardo.c.a.p2@gmail.com'
      end
      item
        Name = 'REM'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'HORAGLOBAL'
        DataType = ftDateTime
        ParamType = ptInput
        Value = 44439.5071759259d
      end>
  end
  object QueryRemetentePrivadoCount: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select count(distinct m.remetente) from mensagem m'
      'where'
      'm.destinatario = :dest'
      'and'
      'm.dataenvio > :horaglobal')
    Left = 224
    Top = 96
    ParamData = <
      item
        Name = 'DEST'
        DataType = ftString
        ParamType = ptInput
        Value = 'leonardo.c.a.p2@gmail.com'
      end
      item
        Name = 'HORAGLOBAL'
        DataType = ftDateTime
        ParamType = ptInput
        Value = 44439.5071759259d
      end>
  end
end
