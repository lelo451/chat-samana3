unit uUsuario;

interface
  uses
    FireDAC.Comp.Client, FireDAC.Stan.Intf, System.SysUtils, Winapi.Messages,FireDAC.Phys.IBWrapper,
    Vcl.Dialogs, FireDAC.Comp.DataSet, Data.DB;
  type
    TUsuario = class
      private
        FEmail        : String;
        FLogin        : String;
        FTexto        : String;
        FDataHora     : TDateTime;
        FDestinatario : String;
        FOnline       : Integer;
        FNomeDes      : String;
        FRemetente    : String;
        HoraGlobal    : TDateTime;
        HoraPrivado   : TDateTime;
      protected
      public
        constructor Create;
        function    LigarBancoDados                  : Boolean;
        function    Login(AEmail : String)           : Boolean;
        function    Mensagens (ATexto: String)       : Boolean;
        function    MensagensHistorico               : String;
        function    Cadastro(AEmail,ALogin : String) : Boolean;
        function    UpdateOnline                     : Boolean;
        function    UpdateChat                       : Integer;
        function    UpdateOffline                    : Boolean;
        function    AlertaNovaMensagem               : Boolean;
        function    ConversaGlobal                   : Boolean;
        function    ConversaPrivada                  : Boolean;
        function    NovasMensagens                   : Integer;

      published
        property Email        : String     read FEmail;
        property Apelido      : String     read FLogin;
        property Texto        : String     read FTexto;
        property DataHora     : TDateTime  read FDataHora;
        property Destinatario : String     read FDestinatario write FDestinatario;
        property Remetente    : String     read FRemetente;
        property Online       : Integer    read FOnline;
        property NomeDes      : String     read FNomeDes      write FNomeDes;
    end;
  var
    Usuario  : TUsuario;
    DBCon    : TFDConnection;
    Command  : TFDCommand;
    Query    : TFDQuery;
    Global   : Boolean;
    Nome     : String;
    RecebeuMensagem : String;

implementation

uses
  uFrmChat,uFrmSingleChat, uDm;

//tentativa de alert
function TUsuario.AlertaNovaMensagem: Boolean;
begin
end;

//Cadastra o usuario
function TUsuario.Cadastro(AEmail,ALogin :String): Boolean;
begin
  Command.CommandText.Text := ('insert into chatusuario(emailusu, nomeusu) values(' + QuotedStr(AEmail) + ',' + QuotedStr(ALogin) + ')');
  Query.SQL.Text := Command.CommandText.GetText;
  Query.ExecSQL;
  result := true;
end;

//Comando para chat global
function TUsuario.ConversaGlobal: Boolean;
begin
  Command.CommandText.Text := ('SELECT C.NOMEUSU, M.TEXTO, M.REMETENTE, M.DATAENVIO FROM CHATUSUARIO C, MENSAGEM M ' +
    'WHERE M.REMETENTE = C.EMAILUSU AND M.DESTINATARIO = ' + QuotedStr(FDestinatario)) + 'order by M.DATAENVIO';
  Global := True;
end;

//Comando para chat privado
function TUsuario.ConversaPrivada: Boolean;
begin
  Command.CommandText.Text := ('SELECT C.NOMEUSU, M.TEXTO, M.REMETENTE, M.DATAENVIO ' +
    'FROM CHATUSUARIO C, MENSAGEM M ' +
    'WHERE M.REMETENTE = C.EMAILUSU AND ' +
    'M.DESTINATARIO in (' + QuotedStr(FEmail) + ', ' + QuotedStr(FDestinatario) + ') ' +
    'AND M.REMETENTE in (' + QuotedStr(FEmail) + ', ' + QuotedStr(FDestinatario) + ') ' +
    'order by M.DATAENVIO');
  Global := False;
end;

//Inicializa as variaveis
constructor TUsuario.Create;
begin
  DBCon   := TFDConnection.Create(NIL);
  Command := TFDCommand.Create(NIL);
  Query   := TFDQuery.Create(NIL);
  Self.FEmail := '';
  Self.FLogin := '';
  Self.FTexto := '';
  Self.FDestinatario := '';
  Self.FDataHora := now;
  Query.Connection := DBCon;
end;

//Liga para o serviço do banco
function TUsuario.LigarBancoDados: Boolean;
begin
  try
    with DBCon do
    begin
      Params.Values['Database']  := '/opt/firebird/data/ARQUIVO.FDB';
      Params.Values['User_Name'] := 'SYSDBA';
      Params.Values['Password']  := 'lAJdzUzulns9BJrN0nz4';
      Params.Values['Server']    := 'env-0276048.jelastic.saveincloud.net';//'env-5157229.jelastic.saveincloud.net';
      Params.Values['Port']      := '12690';
      Params.Values['Protocol']  := 'TCPIP';
      Params.Values['DriverID']  := 'FB';
      result := true;
    end;
  finally
  end;
end;

//Verifica se exite no banco
function TUsuario.Login(AEmail: String): Boolean;

begin
  Command.CommandText.Text := ('select * from chatusuario where EmailUsu = ' + QuotedStr(Trim(AEmail)));
  Query.SQL.Text := Command.CommandText.GetText;
  Query.Open;
  while not Query.Eof do
  begin
    Self.FEmail  := Query.FieldByName('EmailUsu').AsString;
    Self.FLogin  := Query.FieldByName('NomeUsu').AsString;
    Self.FOnline := Query.FieldByName('Online').AsInteger;
    Query.Next;
    result:= true;
  end;
  Query.Close;
end;

//Salva as Mensagens no banco
function TUsuario.Mensagens (ATexto: String) : Boolean;
begin
  Command.CommandText.Text := ('insert into mensagem(texto, remetente, destinatario) values(' +
  QuotedStr(ATexto) + ',' + QuotedStr(Trim(FEmail)) + ',' + QuotedStr(Trim(FDestinatario)) + ')');
  Query.SQL.Text := Command.CommandText.GetText;
  Query.ExecSQL;
end;

//Historico de mensagens
function TUsuario.MensagensHistorico : String;
begin
  if (FDestinatario = '') or (FDestinatario = 'ALL') then
     ConversaGlobal
  else
    ConversaPrivada;

  Query.SQL.Clear;
  Query.SQL.Text := Command.CommandText.GetText;
  Query.Open;

  while not Query.Eof do
  begin
    Nome          := Query.FieldByName('NOMEUSU').AsString;
    FTexto        := Query.FieldByName('TEXTO').AsString;
    FDataHora     := Query.FieldByName('DATAENVIO').AsDateTime;
    if Global = true then
    begin
      FrmChat.MChatConteudo.Lines.Add(DateTimeToStr(FDataHora) + ' ' + Nome + ': ' +  FTexto);
      HoraGlobal := Query.FieldByName('DATAENVIO').AsDateTime;
    end
    else
    begin
      HoraPrivado := Query.FieldByName('DATAENVIO').AsDateTime;
      FrmSingleChat.MChatConteudo.Lines.Add(DateTimeToStr(FDataHora) + ' ' + Nome + ': ' +  FTexto);
    end;
    Query.Next;
  end;
end;

//Ve quantas mensagens novas o usuario possui
function TUsuario.NovasMensagens: Integer;
var
  novamensagem, i : Integer;
  Remetentes, Apelidos : array of String;
  HasMensagem : Boolean;
begin
  novamensagem := 0;
  i := 0;
  HasMensagem := False;
  RecebeuMensagem := '';
  with Dm.QueryTimeGlobal do
  begin
    Params[0].Value := FDataHora;
    Open;
    if not IsEmpty then
      novamensagem := StrToInt(Fields[0].Text);
    Close;
    if novamensagem <> 0 then
      RecebeuMensagem := IntToStr(novamensagem) + ' nova(s) mensagem(ns) no chat Global' + #13#10;
  end;

  with Dm.QueryTimePrivado do
  begin
    Params[0].Value := Destinatario;
    Params[1].Value := FDataHora;
    Open;
    if not IsEmpty then
    begin
      HasMensagem := True;
      novamensagem := novamensagem + StrToInt(Fields[0].Text);
    end;
    Close;
  end;

  with Dm.QueryRemetentePrivadoCount do
  begin
    Params[0].Value := Destinatario;
    Params[1].Value := FDataHora;
    Open;
    if not IsEmpty then
    begin
      SetLength(Remetentes, StrToInt(Fields[0].Text));
      SetLength(Apelidos, StrToInt(Fields[0].Text));
    end;
    Close;
  end;

  with Dm.QueryRemetentePrivado do
  begin
    Params[0].Value := Destinatario;
    Params[1].Value := FDataHora;
    Open;
    if not IsEmpty then
    begin
      while not Eof do
      begin
        Remetentes[i] := Fields[0].Text;
        i := i + i;
        Next;
      end;
    end;
    Close;
  end;

  for I := 0 to High(Remetentes) - 1 do
  begin
    with Query do
    begin
      SQL.Clear;
      SQL.Text := 'select nomeusu from chatusuario where EMAILUSU = ' + Remetentes[I];
      Open;
      if not IsEmpty then
        Apelidos[I] := Fields[0].Text;
      Close;
    end;

    with Dm.QueryRemetenteCount do
    begin
      Params[0].Value := Destinatario;
      Params[1].Value := Remetentes[I];
      Params[2].Value := FDataHora;
      Open;
      if not IsEmpty then
      begin
        RecebeuMensagem := RecebeuMensagem + Fields[0].Text + ' nova(s) mensagem(ns) de ' + Apelidos[I] + #13#10;
      end;
      Close;
    end;
  end;
  result :=  novamensagem;
end;

//Atualiza o chat
function TUsuario.UpdateChat: Integer;
begin
  if FDestinatario = 'ALL' then
    ConversaGlobal
  else
    ConversaPrivada;

  Query.SQL.Text := Command.CommandText.GetText;
  Query.Open;
  try
    while not Query.Eof do
    begin
      FDataHora     := Query.FieldByName('DATAENVIO').AsDateTime;
      FTexto        := Query.FieldByName('TEXTO').AsString;
      Nome          := Query.FieldByName('NOMEUSU').AsString;
      FRemetente    := Query.FieldByName('REMETENTE').AsString;

      if (FDataHora > HoraGlobal) and (Global = True) then
      begin
        HoraGlobal := FDataHora;
        FrmChat.MChatConteudo.Lines.Add(DateTimeToStr(FDataHora) + ' ' + Nome + ': ' +  FTexto);
      end
      else if (DataHora > HoraPrivado) and (Global = False) then
      begin
        HoraPrivado := FDataHora;
        FrmSingleChat.MChatConteudo.Lines.Add(DateTimeToStr(FDataHora) + ' ' + Nome + ': ' +  FTexto);
      end;
      Query.Next;
    end;
  finally
    Query.Close;
  end;
end;

//Coloca o usuario para offline
function TUsuario.UpdateOffline: Boolean;
begin
  Command.CommandText.Text := ('UPDATE chatusuario SET Online = 0 WHERE EmailUsu = '+ QuotedStr(FEmail));
  Query.SQL.Text := Command.CommandText.GetText;
  Query.ExecSQL;
  result := true;
end;

//Coloca o usuario para online
function TUsuario.UpdateOnline: Boolean;
begin
  Command.CommandText.Text := ('UPDATE chatusuario SET Online = 1 WHERE EmailUsu = '+ QuotedStr(FEmail));
  Query.SQL.Text := Command.CommandText.GetText;
  Query.ExecSQL;
  result := true;
end;

end.
