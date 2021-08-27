unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  uFrmCadastrar, uFrmLogin, uCommom;

type
  TFrmPrincipal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    procedure Panel2Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    Global : TGlobal;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses uDM;

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with Dm.TableUsuario do
  begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE chatusuario SET Online = 0 WHERE EmailUsu =:pnom');
    ParamByName('pnom').AsString := Global.Email;
    ExecSQL;
  end;
end;

procedure TFrmPrincipal.Panel1Click(Sender: TObject);
begin
  FrmLogin.Show;
end;

procedure TFrmPrincipal.Panel2Click(Sender: TObject);
begin
  FrmCadastrar.Show;
end;

end.
