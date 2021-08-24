unit uFrmCadastrar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrmCadastrar = class(TForm)
    Label1: TLabel;
    EdEmail: TEdit;
    EdNome: TEdit;
    BtCadastrar: TButton;
    procedure BtCadastrarClick(Sender: TObject);
    procedure EdNomeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastrar: TFrmCadastrar;

implementation

{$R *.dfm}

uses uDm;

procedure TFrmCadastrar.BtCadastrarClick(Sender: TObject);
begin

  if (EdEmail.Text <> '') AND (EdNome.Text <> '') then
  begin
    with Dm do
    begin
      TableUsuario.Open;
      TableUsuario.Insert;
      TableUsuarioEmailUsu.Value := EdEmail.Text;
      TableUsuarioNomeUSu.Value := EdNome.Text;
      TableUsuario.Post;
      TableUsuario.Close;
    end;
    ShowMessage('Conta Cadastrada.');
    EdEmail.Clear; EdNome.Clear;
    FrmCadastrar.Close;
  end
  else
  begin
    MessageDlg('Campos Vazios.', MtError, [MbOK], 0);
  end;

end;

procedure TFrmCadastrar.EdNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    BtCadastrar.Click;
  end;
end;

end.
