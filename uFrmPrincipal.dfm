object FrmLogin: TFrmLogin
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'RX 2.0.7 VERSION 8.5'
  ClientHeight = 562
  ClientWidth = 878
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Pnl_Principal: TPanel
    Left = 0
    Top = 0
    Width = 844
    Height = 545
    BevelOuter = bvNone
    BiDiMode = bdLeftToRight
    Color = clWindow
    ParentBiDiMode = False
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      844
      545)
    object Shape1: TShape
      Left = 0
      Top = 0
      Width = 844
      Height = 545
      Align = alClient
      Pen.Color = clSilver
      ExplicitWidth = 836
    end
    object BtnFechar: TSpeedButton
      Left = 803
      Top = 8
      Width = 33
      Height = 33
      Anchors = [akTop, akRight]
      Caption = 'X'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInactiveCaption
      Font.Height = -16
      Font.Name = 'Franklin Gothic Medium'
      Font.Style = []
      ParentFont = False
      OnClick = BtnFecharClick
    end
    object Lbl_User: TLabel
      Left = 453
      Top = 189
      Width = 34
      Height = 13
      Caption = 'EMAIL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Lbl_Senha: TLabel
      Left = 453
      Top = 282
      Width = 104
      Height = 13
      Caption = 'NOME DO USU'#193'RIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblCadastrar: TLabel
      Left = 512
      Top = 443
      Width = 172
      Height = 13
      Caption = 'N'#227'o possui uma conta? Cadastre-se'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMedGray
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = LblCadastrarClick
    end
    object Label1: TLabel
      Left = 469
      Top = 79
      Width = 254
      Height = 30
      Caption = 'Digite seu Usu'#225'rio e Senha:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMedGray
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Pnl_Imagem: TPanel
      Left = 0
      Top = 0
      Width = 353
      Height = 545
      Anchors = [akLeft, akTop, akBottom]
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      object LblBemVindos: TLabel
        Left = 24
        Top = 65
        Width = 305
        Height = 30
        Caption = 'Bem-Vindos ao VIGAN Agenda'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object LblGHT: TLabel
        Left = 94
        Top = 257
        Width = 135
        Height = 25
        Caption = 'VIGAN Agenda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblVersion: TLabel
        Left = 130
        Top = 281
        Width = 70
        Height = 14
        Caption = 'Vers'#227'o 1.0.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LblDesenvolvido: TLabel
        Left = 48
        Top = 477
        Width = 239
        Height = 17
        Caption = 'DESENVOLVIDO POR VIGAN SISTEMAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMedGray
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object LblDireitos: TLabel
        Left = 61
        Top = 493
        Width = 217
        Height = 17
        Caption = 'TODOS OS DIREITOS RESERVADOS.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMedGray
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Pnl_User: TPanel
      Left = 453
      Top = 208
      Width = 281
      Height = 41
      BevelOuter = bvNone
      TabOrder = 1
      object EdEmail: TEdit
        Tag = 7
        Left = 7
        Top = 12
        Width = 366
        Height = 22
        Hint = 'Email'
        TabStop = False
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TextHint = 'Digite seu Email'
      end
      object Pnl_BarraUser: TPanel
        Left = 0
        Top = 40
        Width = 281
        Height = 1
        Align = alBottom
        BevelOuter = bvNone
        Color = clSilver
        ParentBackground = False
        TabOrder = 1
      end
    end
    object Pnl_Senha: TPanel
      Left = 453
      Top = 301
      Width = 281
      Height = 41
      BevelOuter = bvNone
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      TabOrder = 2
      object EdApelido: TEdit
        Tag = 7
        Left = 7
        Top = 13
        Width = 366
        Height = 21
        Hint = 'Nome de Usu'#225'rio'
        TabStop = False
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TextHint = 'Digite seu nome de Usu'#225'rio'
      end
      object Pnl_BarraSenha: TPanel
        Left = 0
        Top = 40
        Width = 281
        Height = 1
        Align = alBottom
        BevelOuter = bvNone
        Color = clSilver
        ParentBackground = False
        TabOrder = 1
      end
    end
    object PnlConfirmar: TPanel
      Left = 512
      Top = 396
      Width = 172
      Height = 41
      BevelOuter = bvNone
      Color = clMenuHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
      object SpeedButton1: TSpeedButton
        Left = 0
        Top = 0
        Width = 172
        Height = 41
        Align = alClient
        Caption = 'Confirmar'
        Flat = True
        OnClick = SpeedButton1Click
        ExplicitLeft = -40
        ExplicitTop = 5
      end
    end
  end
end
