unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, uFrmInfo, uDm, uFrmCadastrar, uUsuario, uFrmChat;

type
  TFrmLogin = class(TForm)
    Pnl_Principal: TPanel;
    BtnFechar: TSpeedButton;
    Shape1: TShape;
    Pnl_Imagem: TPanel;
    Pnl_User: TPanel;
    Lbl_User: TLabel;
    EdEmail: TEdit;
    Lbl_Senha: TLabel;
    Pnl_Senha: TPanel;
    EdApelido: TEdit;
    Pnl_BarraUser: TPanel;
    Pnl_BarraSenha: TPanel;
    PnlConfirmar: TPanel;
    LblCadastrar: TLabel;
    SpeedButton1: TSpeedButton;
    LblBemVindos: TLabel;
    LblGHT: TLabel;
    LblVersion: TLabel;
    LblDesenvolvido: TLabel;
    LblDireitos: TLabel;
    Label1: TLabel;
    procedure BtnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure LblCadastrarClick(Sender: TObject);
    var
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

// SpeedButtom para fechar aplicação (X)
procedure TFrmLogin.BtnFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

// Limpeza do formulário da memória
procedure TFrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

// Centralização do formulário no meio da tela
procedure TFrmLogin.FormResize(Sender: TObject);
begin
  Pnl_Principal.Top  := Round ( FrmLogin.Height / 2 - Pnl_Principal.Height / 2 );
  Pnl_Principal.Left := Round ( FrmLogin.Width / 2 - Pnl_Principal.Width / 2 )
end;

//Leva para tela de cadastro
procedure TFrmLogin.LblCadastrarClick(Sender: TObject);
begin
  FrmCadastrar := tFrmCadastrar.Create (nil);
  FrmCadastrar.ShowModal;
end;

// Botão de confirmar da tela de Login
procedure TFrmLogin.SpeedButton1Click(Sender: TObject);
begin
  uUsuario.Usuario := TUsuario.Create;
  uUsuario.Usuario.LigarBancoDados;
  if (EdEmail.Text <> '') then  //Verifica se já existe no banco!
  begin

    if uUsuario.Usuario.Login(EdEmail.Text) then //Se existir entra leva para Chat!
    begin
      uUsuario.Usuario.UpdateOnline;

      Frm_Agenda := tFrm_Agenda.Create (nil);// Criação do Form Agenda
      Frm_Agenda.ShowModal;

      FrmLogin.Hide; // Retira a tela de login
      Application.Run;  // Inicialização da aplicação
    end
    else
    begin //Se não pergunta se quer cadastar!
      if MessageDlg('Cadastro não existente, quer se cadastar?',
      TMsgDlgType.mtConfirmation,[TMsgDlgBtn.mbYes,TMsgDlgBtn.mbNo], 0) = mrYes then
      begin
        FrmCadastrar := TFrmCadastrar.Create(NIL);
        FrmCadastrar.ShowModal
      end;
    end;
  end
  else
  begin //Campos vazies
    if (EdEmail.Text = '') and (EdApelido.Text = '') then
      MessageDlg('A campos vazies!', MtError, [MbOK], 0)
    else if EdEmail.Text = '' then
      MessageDlg('Email Vazio!', MtError, [MbOK], 0)
    else if EdApelido.Text = '' then
      MessageDlg('Login Vazio!', MtError, [MbOK], 0)
    else
      ShowMessage('Erro');
  end;

end;

end.
