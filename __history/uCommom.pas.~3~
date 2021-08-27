unit uCommom;

interface

uses uDm;

type
  TGlobal = class
  Email : String;
  Apelido : String;

  procedure AtivarDataModule;
  procedure DesativarDataModule;
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

end.
