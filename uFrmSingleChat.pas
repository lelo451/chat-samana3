unit uFrmSingleChat;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, uDm, System.Notification, uCommom;
type
  TFrmSingleChat = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    MChatConteudo: TMemo;
    BtnChatClear: TButton;
    BtnChatOk: TButton;
    EdTexto: TEdit;
    LbApelido: TLabel;
    LbStatus: TLabel;
    LbApelidoRecipiente: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Timer1: TTimer;
    NotificationCenter1: TNotificationCenter;
    procedure FormShow(Sender: TObject);
    procedure BtnChatClearClick(Sender: TObject);
    procedure EdTextoKeyPress(Sender: TObject; var Key: Char);
    procedure BtnChatOkClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    FApelido: String;
    FEmail: String;
    FEmailRecipiente: String;
    FApelidoRecipiente: String;
    LastIdMensage : String;
    { Private declarations }
  public
    { Public declarations }
    Global : TGlobal;
    property Apelido : String read FApelido write FApelido;
    property Email : String read FEmail write FEmail;
    property EmailRecipiente : String read FEmailRecipiente write FEmailRecipiente;
    property ApelidoRecipiente : String read FApelidoRecipiente write FApelidoRecipiente;
    procedure UpdateMemo();
    procedure updateChatIndividual();
  end;
var
  FrmSingleChat: TFrmSingleChat;
implementation
{$R *.dfm}
procedure TFrmSingleChat.BtnChatClearClick(Sender: TObject);
begin
  EdTexto.Text := '';
end;

procedure TFrmSingleChat.BtnChatOkClick(Sender: TObject);
var
  Mensagem, From, Destinario: String;
begin
  Mensagem := EdTexto.Text;
  From := FEmail;
  Destinario := FEmailRecipiente;
  if EdTexto.Text <> '' then
  begin
    with Dm do
    begin
      TableMensagem.Open;
      TableMensagem.Insert;
      TableMensagemTEXTO.Value := Mensagem;
      TableMensagemREMETENTE.Value := From;
      TableMensagemDESTINATARIO.Value := Destinario;
      TableMensagem.Post;
      TableMensagem.Close;
    end;
    MChatConteudo.Lines.Add(FApelido + ': ' + EdTexto.Text);
    EdTexto.Text := '';
    EdTexto.SetFocus;
  end;
end;

procedure TFrmSingleChat.EdTextoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      BtnChatOk.Click;
    end;
end;

procedure TFrmSingleChat.FormShow(Sender: TObject);
begin
  if Apelido <> '' then
    LbApelido.Caption := Apelido
  else
    LbApelido.Caption := 'Anônimo';
  if ApelidoRecipiente <> '' then
    LbApelidoRecipiente.Caption := ApelidoRecipiente
  else
    LbApelidoRecipiente.Caption := 'Anônimo';
  LbStatus.Caption := 'ONLINE';
end;

procedure TFrmSingleChat.Timer1Timer(Sender: TObject);
begin
  FrmSingleChat.UpdateMemo();
end;


procedure TFrmSingleChat.updateChatIndividual();
var
  MyNotification : TNotification;
begin
  MyNotification := NotificationCenter1.CreateNotification;
  with Dm.QueryIndividual do
  begin
    Params[0].Value := Global.EmailDestinatario;
    Params[1].Value := Global.Email;
    Params[2].Value := LastIdMensage;
    Open;
    if not IsEmpty then
    begin
      try
        while not EoF do
        begin
          FrmSingleChat.MChatConteudo.Lines.Add(Fields[0].Text + ': ' + Fields[1].Text);
          FrmSingleChat.LastIdMensage := Fields[2].Text;
          if Fields[0].Text <> Apelido then
          begin
            MyNotification.Name := 'Windows10Notification';
            MyNotification.Title := 'Mensagem Chat ' + ApelidoRecipiente;
            MyNotification.AlertBody := 'VIP SISTEMAS';
            NotificationCenter1.PresentNotification(MyNotification);
          end;
          Next;
        end;
      finally
        Close;
        MyNotification.Free;
      end;
    end;
    Close;
  end;
end;

procedure TFrmSingleChat.UpdateMemo();
begin
  FrmSingleChat.MChatConteudo.Clear;
  with Dm.QueryIndividual do
  begin
    Params[0].Value := Global.EmailDestinatario;
    Params[1].Value := Global.Email;
    Open;
    try
      while not EoF do
      begin
        FrmSingleChat.MChatConteudo.Lines.Add(Fields[0].Text + ': ' + Fields[1].Text);
        FrmSingleChat.LastIdMensage := Fields[2].Text;
        Next;
      end;
    finally
      Close;
    end;
    Close;
  end;
end;
end.
