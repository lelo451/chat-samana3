object FrmChat: TFrmChat
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Chat Geral'
  ClientHeight = 475
  ClientWidth = 768
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 768
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'CHAT'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object LbApelido: TLabel
      Left = 10
      Top = 18
      Width = 65
      Height = 19
      Caption = 'An'#244'nimo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LbStatus: TLabel
      Left = 680
      Top = 18
      Width = 60
      Height = 19
      Caption = 'STATUS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 5
    Top = 46
    Width = 185
    Height = 424
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object DBUserOnline: TDBGrid
      Left = 0
      Top = 13
      Width = 185
      Height = 411
      Align = alBottom
      DataSource = DataSourceUsuarioOnline
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NOMEUSU'
          Title.Caption = 'Online'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMAILUSU'
          Title.Caption = 'Email'
          Visible = False
        end>
    end
  end
  object PanelChat: TPanel
    Left = 196
    Top = 59
    Width = 564
    Height = 358
    BevelOuter = bvNone
    TabOrder = 2
    object MChatConteudo: TMemo
      Left = 0
      Top = 0
      Width = 564
      Height = 358
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        '')
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object EdTexto: TEdit
    Left = 198
    Top = 429
    Width = 427
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    TextHint = 'digite aqui...'
    OnKeyPress = EdTextoKeyPress
  end
  object BtnChatOk: TButton
    Left = 640
    Top = 429
    Width = 58
    Height = 31
    Caption = 'ENVIAR'
    TabOrder = 4
    OnClick = BtnChatOkClick
  end
  object BtnChatClear: TButton
    Left = 702
    Top = 429
    Width = 58
    Height = 31
    Caption = 'LIMPAR'
    TabOrder = 5
    OnClick = BtnChatClearClick
  end
  object DataSourceUsuarioOnline: TDataSource
    DataSet = Dm.QueryUsuOnline
    Left = 168
  end
  object Timer01: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = Timer01Timer
    Left = 264
    Top = 8
  end
end
