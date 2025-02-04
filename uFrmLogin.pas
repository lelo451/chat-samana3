﻿unit uFrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uFrmGroupChat, uFrmChoice, uFrmSingleChat,
  Data.DB, System.UITypes, FireDAC.Stan.Param;

type
  TFrmLogin = class(TForm)
    Label1: TLabel;
    EdEmail: TEdit;
    EdApelido: TEdit;
    BtEntrar: TButton;
    procedure BtEntrarClick(Sender: TObject);
    procedure EdApelidoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses uDm;

procedure TFrmLogin.BtEntrarClick(Sender: TObject);
begin
                  
  if (EdEmail.Text) <> '' then  //VALIDA SE O USUARIO TEM CONTA CADASTRADA NO BANCO
  begin
    with Dm do
    begin
      QueryUsuario.SQL.Clear;
      QueryUsuario.SQL.Add('SELECT EmailUsu FROM chatusuario');
      QueryUsuario.SQL.Add('WHERE EmailUsu = '+QuotedStr(Trim(EdEmail.Text)) );
      QueryUsuario.Open;
    end;

    if not Dm.QueryUsuario.IsEmpty then
    begin
      FrmChat.Apelido := EdApelido.Text;
      FrmChat.Email := EdEmail.Text;

      FrmSingleChat.Apelido := EdApelido.Text;
      FrmSingleChat.Email := EdEmail.Text;

      //FrmChat.Show;
      FrmChoice.Show;
      FrmLogin.Close;
    end
  end
  else
  begin
    MessageDlg('Usuario inválido.', MtError, [MbOK], 0);
  end;

  if (EdEmail.Text = '') AND (EdApelido.Text = '') then
  begin
    MessageDlg('Campos vazios.', MtError, [MbOK], 0);
  end;

  with Dm.TableUsuario do
  begin //AQUI É ONDE O UPDATE ONLINE = 0 PARA ONLINE 1 OCORRE
    Close;
    SQL.Clear;
    SQL.Add('UPDATE chatusuario SET Online = 1 WHERE EmailUsu =:pnom ');
    ParamByName('pnom').AsString := EdEmail.Text;
    ExecSQL;
  end;

end;

procedure TFrmLogin.EdApelidoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    BtEntrar.Click;
  end;
end;

end.
