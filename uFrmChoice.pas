unit uFrmChoice;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Data.DB, uDm,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, uFrmGroupChat, uFrmSingleChat, uCommom;

type
  TFrmChoice = class(TForm)
    Label1: TLabel;
    Timer1: TTimer;
    DSUser: TDataSource;
    DBGListUser: TDBGrid;
    PnlBtnGeral: TPanel;
    PnlBtnIndividual: TPanel;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PnlBtnGeralClick(Sender: TObject);
    procedure PnlBtnIndividualClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Global : TGlobal;
  end;

var
  FrmChoice: TFrmChoice;

implementation

{$R *.dfm}

procedure TFrmChoice.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Timer1.Enabled := False;
end;

procedure TFrmChoice.FormShow(Sender: TObject);
begin
  Timer1.Enabled := True;
end;

procedure TFrmChoice.Timer1Timer(Sender: TObject);
begin
  with Dm.QueryUsuOnline do
  begin
    Open('SELECT NomeUsu as Online, EmailUsu as email FROM chatusuario WHERE Online = 1');
  end;
end;

procedure TFrmChoice.PnlBtnGeralClick(Sender: TObject);
begin
  FrmChat.UpdateMemo;
  FrmChat.Show;
  FrmChoice.Close;
end;

procedure TFrmChoice.PnlBtnIndividualClick(Sender: TObject);
var
  EmailDestinatario, EmailRemetente, ApelidoRecipiente: String;
begin
  EmailDestinatario := DBGListUser.Columns.Items[1].Field.Text;
  ApelidoRecipiente := DBGListUser.Columns.Items[0].Field.Text;
  Global.EmailDestinatario := EmailDestinatario;
  Global.ApelidoDestinatario := ApelidoRecipiente;
  EmailRemetente := FrmSingleChat.Email;
  if EmailRemetente = EmailDestinatario then
    ShowMessage('Você não pode enviar mensagem para você mesmo!')
  else
    begin
      FrmSingleChat.EmailRecipiente := EmailDestinatario;
      FrmSingleChat.ApelidoRecipiente := ApelidoRecipiente;
      FrmSingleChat.UpdateMemo;
      FrmSingleChat.Show;
      FrmChoice.Close;
    end;
end;

end.
