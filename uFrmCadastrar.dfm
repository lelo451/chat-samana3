object FrmCadastrar: TFrmCadastrar
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Registrar'
  ClientHeight = 630
  ClientWidth = 942
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Pnl_Principal: TPanel
    Left = 56
    Top = 64
    Width = 844
    Height = 545
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    object ShPrincipal: TShape
      Left = 1
      Top = 42
      Width = 842
      Height = 502
      Align = alClient
      Pen.Color = clSilver
      ExplicitLeft = 40
      ExplicitTop = 216
      ExplicitWidth = 65
      ExplicitHeight = 65
    end
    object Label1: TLabel
      Left = 232
      Top = 131
      Width = 137
      Height = 21
      Caption = 'Endere'#231'o de Email:*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 232
      Top = 281
      Width = 132
      Height = 21
      Caption = 'Nome de Usu'#225'rio:*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 842
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Digite seu Email e Nome de Usu'#225'rio'
      Color = clMenu
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMedGray
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
      object BtnFechar: TSpeedButton
        Left = 803
        Top = 3
        Width = 33
        Height = 33
        Caption = 'X'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = BtnFecharClick
      end
    end
    object Pnl_Email: TPanel
      Left = 232
      Top = 158
      Width = 337
      Height = 49
      BevelOuter = bvNone
      Color = clWindow
      ParentBackground = False
      TabOrder = 0
      object EdEmail: TEdit
        Left = 10
        Top = 14
        Width = 343
        Height = 28
        TabStop = False
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TextHint = 'Digite seu endere'#231'o de Email'
      end
      object Pnl_BarrinhaEmail: TPanel
        Left = 0
        Top = 48
        Width = 337
        Height = 1
        Align = alBottom
        Color = clGray
        ParentBackground = False
        TabOrder = 1
      end
    end
    object Panel3: TPanel
      Left = 232
      Top = 308
      Width = 337
      Height = 49
      BevelOuter = bvNone
      Color = clWindow
      ParentBackground = False
      TabOrder = 1
      object EdNome: TEdit
        Left = 10
        Top = 15
        Width = 343
        Height = 27
        TabStop = False
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TextHint = 'Digite seu Nome de Usu'#225'rio'
        OnKeyPress = EdNomeKeyPress
      end
      object Pnl_BarrinhaApelido: TPanel
        Left = 0
        Top = 48
        Width = 337
        Height = 1
        Align = alBottom
        Color = clGray
        ParentBackground = False
        TabOrder = 1
      end
    end
    object Pnl_Cadastrar: TPanel
      Left = 313
      Top = 432
      Width = 185
      Height = 41
      BevelOuter = bvNone
      Color = clMenuHighlight
      ParentBackground = False
      TabOrder = 2
      object BtnCadastrar: TSpeedButton
        Left = 0
        Top = 0
        Width = 185
        Height = 41
        Align = alClient
        Caption = 'Cadastrar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = BtnCadastrarClick
        ExplicitLeft = 16
      end
    end
  end
end
