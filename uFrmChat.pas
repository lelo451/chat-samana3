unit uFrmChat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TFrmChat = class(TForm)
    PanelTop: TPanel;
    LbApelido: TLabel;
    LbStatus: TLabel;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DataSourceUsuarioOnline: TDataSource;
    EdPesquisar: TEdit;
    BtOK: TButton;
    PanelChat: TPanel;
    Memo1: TMemo;
    EdTexto: TEdit;
    Button1: TButton;
    Button2: TButton;
    Timer01: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Timer01Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtOKClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    FApelido: String;
    FEmail: String;
    { Private declarations }
  public
    { Public declarations }

    property Apelido : String read FApelido write FApelido;
    property Email : String read FEmail write FEmail;
  end;

var
  FrmChat: TFrmChat;

implementation

{$R *.dfm}

uses uDataModule01;


procedure TFrmChat.BtOKClick(Sender: TObject);
begin

  with DataModule01.TableUsuario do
  begin
    try
    Close;
    SQL.Clear;
    SQl.Add('SELECT NomeUsu FROM chatusuarioa WHERE Online = 1 AND NomeUsu  =:pnom');
    ParamByName('pnom').AsString := EdPesquisar.Text;
    ExecSQL;
    except
      ShowMessage('Usuario OFFLINE.');
    end;

  end;

end;

procedure TFrmChat.Button2Click(Sender: TObject);
begin
  Memo1.Clear;
end;

procedure TFrmChat.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  with DataModule01.TableUsuario do
  begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE chatusuario SET Online = 0 WHERE EmailUsu =:pnom');
    ParamByName('pnom').AsString := Email;
    ExecSQL;
  end;

  Timer01.Enabled := False;
end;

procedure TFrmChat.FormShow(Sender: TObject);
begin

  Timer01.Enabled := True;

  if Apelido <> '' then
    LbApelido.Caption := Apelido
  else
  LbApelido.Caption := 'Anõnimo';



  LbStatus.Caption := 'ONLINE';

end;

procedure TFrmChat.Timer01Timer(Sender: TObject);
begin
  DataModule01.QueryUsuOnline.Open('SELECT NomeUsu FROM chatusuario WHERE Online = 1;');
end;

end.
