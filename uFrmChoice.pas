unit uFrmChoice;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Data.DB, uDm,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, uFrmGroupChat, uFrmSingleChat;

type
  TFrmChoice = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Button2: TButton;
    Timer1: TTimer;
    DSUser: TDataSource;
    DBGListUser: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChoice: TFrmChoice;

implementation

{$R *.dfm}

procedure TFrmChoice.Button1Click(Sender: TObject);
begin
  FrmChat.UpdateMemo;
  FrmChat.Show;
  FrmChoice.Close;
end;

procedure TFrmChoice.Button2Click(Sender: TObject);
var
  EmailDestinatario, EmailRemetente, ApelidoRecipiente: String;
begin
  EmailDestinatario := DBGListUser.Columns.Items[1].Field.Text;
  ApelidoRecipiente := DBGListUser.Columns.Items[0].Field.Text;
  EmailRemetente := FrmSingleChat.Email;
  if EmailRemetente = EmailDestinatario then
    ShowMessage('Voc� n�o pode enviar mensagem para voc� mesmo!')
  else
    begin
      FrmSingleChat.EmailRecipiente := EmailDestinatario;
      FrmSingleChat.ApelidoRecipiente := ApelidoRecipiente;
      FrmSingleChat.UpdateMemo;
      FrmSingleChat.Show;
      FrmChoice.Close;
    end;
end;

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
  Dm.QueryUsuOnline.Open('SELECT NomeUsu as Online, EmailUsu as email FROM chatusuario WHERE Online = 1;');
end;

end.
