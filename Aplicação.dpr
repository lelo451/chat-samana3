program Aplica��o;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {FrmPrincipal},
  uFrmCadastrar in 'uFrmCadastrar.pas' {FrmCadastrar},
  uDm in 'uDm.pas' {Dm: TDataModule},
  uFrmLogin in 'uFrmLogin.pas' {FrmLogin},
  uFrmGroupChat in 'uFrmGroupChat.pas' {FrmChat},
  uFrmSingleChat in 'uFrmSingleChat.pas' {FrmSingleChat},
  uFrmChoice in 'uFrmChoice.pas' {FrmChoice};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDm, Dm);
  Application.CreateForm(TFrmCadastrar, FrmCadastrar);
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TFrmChat, FrmChat);
  Application.CreateForm(TFrmSingleChat, FrmSingleChat);
  Application.CreateForm(TFrmChoice, FrmChoice);
  Application.Run;
end.
