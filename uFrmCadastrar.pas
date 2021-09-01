unit uFrmCadastrar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, uUsuario;

type
  TFrmCadastrar = class(TForm)
    EdEmail: TEdit;
    EdNome: TEdit;
    Pnl_Principal: TPanel;
    Pnl_Email: TPanel;
    Panel3: TPanel;
    Pnl_BarrinhaEmail: TPanel;
    Pnl_BarrinhaApelido: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Pnl_Cadastrar: TPanel;
    BtnCadastrar: TSpeedButton;
    BtnFechar: TSpeedButton;
    Panel2: TPanel;
    ShPrincipal: TShape;
    procedure EdNomeKeyPress(Sender: TObject; var Key: Char);
    procedure BtnCadastrarClick(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastrar: TFrmCadastrar;

implementation

{$R *.dfm}

//Cadastra pessoa no banco.
procedure TFrmCadastrar.BtnCadastrarClick(Sender: TObject);
begin
  if (EdNome.Text <> '') and (EdEmail.Text <> '') then
  begin
    try
      uUsuario.Usuario.Cadastro(EdEmail.Text,EdNome.Text);
      ShowMessage('Conta Cadastrada.');
      EdEmail.Clear; EdNome.Clear;
      FrmCadastrar.Close;
    except
      ShowMessage('Conta invalida ou já cadastrada');
    end;
  end
  else
  begin //Campos vazies
    if (EdEmail.Text = '') and (EdNome.Text = '') then
      MessageDlg('A campos vazies!', MtError, [MbOK], 0)
    else if EdEmail.Text = '' then
      MessageDlg('Email Vazio!', MtError, [MbOK], 0)
    else if EdNome.Text = '' then
      MessageDlg('Login Vazio!', MtError, [MbOK], 0)
    else
      ShowMessage('Erro');
  end;
end;

//Botão (x) de fechar
procedure TFrmCadastrar.BtnFecharClick(Sender: TObject);
begin
  close;
end;

//Aperta o botão enter
procedure TFrmCadastrar.EdNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    BtnCadastrar.Click;
  end;
end;

procedure TFrmCadastrar.FormResize(Sender: TObject);
begin
  Pnl_Principal.Top  := Round ( FrmCadastrar.Height / 2 - Pnl_Principal.Height / 2 );
  Pnl_Principal.Left := Round ( FrmCadastrar.Width / 2 - Pnl_Principal.Width / 2 )
end;

end.
