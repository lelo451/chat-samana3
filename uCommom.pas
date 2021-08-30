unit uCommom;

interface

uses uDm, Vcl.Dialogs, System.Classes;

type
  TGlobal = class
  Email : String;
  Apelido : String;
  EmailDestinatario : String;
  ApelidoDestinatario : String;

  procedure AtivarDataModule;
  procedure DesativarDataModule;
  procedure SetEmailOnline;
  procedure SetEmailOffline;
end;

implementation

{ TGlobal }

procedure TGlobal.AtivarDataModule;
begin
  with Dm do
  begin
    FDConnection.Connected := True;

    QueryUsuario.Active := True;
    QueryUsuOnline.Active := True;
    Query.Active := True;
    QueryIndividual.Active := True;

    TableUsuario.Active := True;
    TableMensagem.Active := True;
  end;
end;

procedure TGlobal.DesativarDataModule;
begin
    with Dm do
    begin
      QueryUsuario.Active := False;
      QueryUsuOnline.Active := False;
      Query.Active := False;
      QueryIndividual.Active := False;

      TableUsuario.Active := False;
      TableMensagem.Active := False;
    end;
end;

procedure TGlobal.SetEmailOffline;
begin
  Tthread.CreateAnonymousThread(
    procedure
    begin
      with Dm.QuerySetOffline do
      begin
        Params[0].Value := Email;
        Execute;
      end;
    end
  ).Start;
end;

procedure TGlobal.SetEmailOnline;
begin
  Tthread.CreateAnonymousThread(
    procedure
    begin
          with Dm.QuerySetOnline do
          begin
            Params[0].Value := Email;
            Execute;
          end;
    end
  ).Start;
end;

end.
