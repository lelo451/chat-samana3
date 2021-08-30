program Aplicação;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {FrmPrincipal},
  uFrmCadastrar in 'uFrmCadastrar.pas' {FrmCadastrar},
  uDm in 'uDm.pas' {Dm: TDataModule},
  uFrmLogin in 'uFrmLogin.pas' {FrmLogin},
  uFrmGroupChat in 'uFrmGroupChat.pas' {FrmChat},
  uFrmSingleChat in 'uFrmSingleChat.pas' {FrmSingleChat},
  uFrmChoice in 'uFrmChoice.pas' {FrmChoice},
  uCommom in 'uCommom.pas';

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
  FrmLogin.Global := FrmPrincipal.Global;
  FrmChat.Global := FrmPrincipal.Global;
  FrmSingleChat.Global := FrmPrincipal.Global;
  FrmChoice.Global := FrmPrincipal.Global;
  Application.Run;
end.
