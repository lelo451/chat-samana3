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
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
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
  Global.DesativarDataModule;
  Global.SetEmailOffline;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  Global := TGlobal.Create;
end;

procedure TFrmPrincipal.FormDestroy(Sender: TObject);
begin
  Global.Free;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  Global.AtivarDataModule;
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
