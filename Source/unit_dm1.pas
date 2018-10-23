{
  OpenRecibo is software for issuing simple commercial receipts.

  Copyright (C) 2018 Mauro Redmer da Fonseca - mauro_mrf@yahoo.com.br

  This source is free software; you can redistribute it and/or modify it under
  the terms of the GNU General Public License as published by the Free
  Software Foundation; either version 2 of the License, or (at your option)
  any later version.

  This code is distributed in the hope that it will be useful, but WITHOUT ANY
  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
  details.

  A copy of the GNU General Public License is available on the World Wide Web
  at <http://www.gnu.org/copyleft/gpl.html>. You can also obtain it by writing
  to the Free Software Foundation, Inc., 51 Franklin Street - Fifth Floor,
  Boston, MA 02110-1335, USA.
}

unit unit_dm1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, IBConnection, FBAdmin, sqldb, sqldblib, db, FileUtil,
  XMLPropStorage, Dialogs, sqlscript;

type

  { TDataModule1 }

  TDataModule1 = class(TDataModule)
    DS_pessoa: TDataSource;
    DS_referente: TDataSource;
    DS_recibo: TDataSource;
    FBAdmin: TFBAdmin;
    IBConnection: TIBConnection;
    SQLDBLibraryLoader: TSQLDBLibraryLoader;
    SQLQuery: TSQLQuery;
    SQLQ_pessoaATIVO: TLongintField;
    SQLQ_pessoaBAIRRO: TStringField;
    SQLQ_pessoaCEP: TStringField;
    SQLQ_pessoaCIDADE: TStringField;
    SQLQ_pessoaCNPJ: TStringField;
    SQLQ_pessoaCOMPLEMENTO: TStringField;
    SQLQ_pessoaCPF: TStringField;
    SQLQ_pessoaEMAIL: TStringField;
    SQLQ_pessoaENDERECO: TStringField;
    SQLQ_pessoaESTADO: TStringField;
    SQLQ_pessoaID: TLongintField;
    SQLQ_pessoaIE: TStringField;
    SQLQ_pessoaNOME: TStringField;
    SQLQ_pessoaRG: TStringField;
    SQLQ_pessoaTAGFISICA: TLongintField;
    SQLQ_pessoaTELEFONE: TStringField;
    SQLQ_pessoaTSINSERT: TDateTimeField;
    SQLQ_pessoaTSUPDATE: TDateTimeField;
    SQLQ_pessoaWEB: TStringField;
    SQLQ_recibo: TSQLQuery;
    SQLQ_reciboATIVO: TLongintField;
    SQLQ_reciboDATA: TDateField;
    SQLQ_reciboEMITENTE: TStringField;
    SQLQ_reciboID: TLongintField;
    SQLQ_reciboLKEMITENTE: TLongintField;
    SQLQ_reciboLKPAGADOR: TLongintField;
    SQLQ_reciboNUMERO: TStringField;
    SQLQ_reciboOBS: TStringField;
    SQLQ_reciboPAGADOR: TStringField;
    SQLQ_reciboREFERENTE: TStringField;
    SQLQ_reciboTSINSERT: TDateTimeField;
    SQLQ_reciboTSUPDATE: TDateTimeField;
    SQLQ_reciboVALOR: TBCDField;
    SQLQ_reciboVIAS: TLongintField;
    SQLQ_referente: TSQLQuery;
    SQLQ_pessoa: TSQLQuery;
    SQLQ_referenteATIVO: TLongintField;
    SQLQ_referenteID: TLongintField;
    SQLQ_referenteREFERENTE: TStringField;
    SQLQ_referenteTSINSERT: TDateTimeField;
    SQLQ_referenteTSUPDATE: TDateTimeField;
    SQLQ_rep_referenteATIVO: TLongintField;
    SQLQ_rep_referenteID: TLongintField;
    SQLQ_rep_referenteREFERENTE: TStringField;
    SQLScript: TSQLScript;
    SQLS_droptable: TSQLScript;
    SQLS_createtable: TSQLScript;
    SQLTransaction: TSQLTransaction;
    XMLPropStorage: TXMLPropStorage;
    procedure DataModuleCreate(Sender: TObject);
    procedure SaveConfig();
    procedure LoadConfig();
    procedure ConnectDb();
    procedure DisConnectDb();
    procedure CreateDb();
    procedure CreateTable();
    procedure DropDb();
    procedure DropTable();
    procedure SQL_referentePost(DataSet: TDataSet);
    procedure SQL_pessoaPost(DataSet: TDataSet);
    procedure SQL_reciboPost(DataSet: TDataSet);
    function checkpessoainrecibo(id_pessoa: integer):integer;
  private

  public
    status: string;
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.lfm}

{ TDataModule1 }

function TDataModule1.checkpessoainrecibo(id_pessoa: integer):integer;
begin
  SQLQuery.close;
  SQLQuery.SQL.Clear;
  SQLQuery.SQL.Add('select count(id) from RECIBO where (lkpagador = :id) or (lkemitente = :id);');
  SQLQuery.ParamByName('id').AsInteger:= id_pessoa;

  try
    SQLQuery.open;
    result:= SQLQuery.FieldByName('count').asinteger;
  except
    result:= -1;
  end;
  SQLQuery.Close;
end;


procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  SQLDBLibraryLoader.Enabled:=false;
  IBConnection.Connected:= false;
  LoadConfig();
  ConnectDb();
end;

procedure TDataModule1.SaveConfig();
begin
  //save firebird connection to xml file
  XMLPropStorage.RootNodePath:= 'Firebird';
  XMLPropStorage.WriteString('libraryname', SQLDBLibraryLoader.LibraryName);
  XMLPropStorage.WriteString('hostname', IBConnection.HostName);
  XMLPropStorage.WriteString('username', IBConnection.UserName);
  XMLPropStorage.WriteString('database', IBConnection.DatabaseName);

  //XMLPropStorage.WriteString('password', IBConnection.Password);
  XMLPropStorage.StoredValues.Clear;
  XMLPropStorage.StoredValues.Add;
  XMLPropStorage.StoredValues[0].Name:= 'password';
  XMLPropStorage.StoredValues[0].KeyString:= 'password';
  XMLPropStorage.StoredValues[0].Value:= IBConnection.Password;
  XMLPropStorage.StoredValues[0].Save;

end;

procedure TDataModule1.LoadConfig();
begin
  //load firebird connection from xml file
  XMLPropStorage.RootNodePath:= 'Firebird';

  {$IFDEF UNIX}
    SQLDBLibraryLoader.LibraryName:= XMLPropStorage.ReadString('libraryname', 'libfbclient.so');
  {$ELSE}
    SQLDBLibraryLoader.LibraryName:= XMLPropStorage.ReadString('libraryname', 'fbclient.dll');
  {$ENDIF}

  SQLDBLibraryLoader.ConnectionType:='Firebird';
  IBConnection.HostName:= XMLPropStorage.ReadString('hostname', 'localhost');
  IBConnection.UserName:= XMLPropStorage.ReadString('username', 'sysdba');
  IBConnection.DatabaseName:= XMLPropStorage.ReadString('database', 'openrecibo.fdb');

  //IBConnection.Password:= XMLPropStorage.ReadString('password', 'masterkey');
  XMLPropStorage.StoredValues.Clear;
  XMLPropStorage.StoredValues.Add;
  XMLPropStorage.StoredValues[0].Name:= 'password';
  XMLPropStorage.StoredValues[0].KeyString:= 'password';
  XMLPropStorage.StoredValues[0].Value:= 'masterkey';//default value
  XMLPropStorage.StoredValues[0].Restore;
  IBConnection.Password:= XMLPropStorage.StoredValues[0].Value;


  //config firebird connection
  IBConnection.Role:= 'OpenRecibo';
  IBConnection.CharSet:= 'UTF-8';
  IBConnection.Dialect:= 3;
end;

procedure TDataModule1.ConnectDb();
begin
  status:= '';

  if SQLDBLibraryLoader.LibraryName <> '' then
  begin
    try
      SQLDBLibraryLoader.Enabled:= True;
      //status:= status + SQLDBLibraryLoader.LibraryName + '; ';
    except
      SQLDBLibraryLoader.Enabled:= False;
      ShowMessage('Não foi possivel encontrar a biblioteca para acesso ao banco de dados.');
      status:= 'Firebird: Desconectado; Biblioteca não encontrada;';
    end;
  end else status:= 'Firebird: Desconectado; Biblioteca não configurada;';;

  if SQLDBLibraryLoader.Enabled = True then
  begin

    try
      IBConnection.Open;
      status:= status +''+ IBConnection.GetConnectionInfo(citServerType);
      status:= status +'  '+ IBConnection.GetConnectionInfo(citServerVersionString);
      status:= status +'; '+ IBConnection.GetConnectionInfo(citClientName);

      status:= status + ';  ' + IBConnection.UserName + '@' + IBConnection.HostName + ':' +IBConnection.DatabaseName + ' ('+ IBConnection.CharSet + '); ';
    except
      IBConnection.Connected:= False;
      ShowMessage('Não foi possivel conectar ao bando de dados.');
      status:= 'Firebird: Desconectado; Não foi possivel conectar ao bando de dados.';
    end;
  end;

  if IBConnection.Connected = true then
  begin
    try
      SQLTransaction.Active:= true;

    except
      ShowMessage('Não foi possivel realizar a transação com o banco de dados.');
      status:= 'Firebird: Desconectado; erro na transação;';
    end;
  end;

  if SQLTransaction.Active = true then
  begin
    try
      SQLQ_pessoa.Open;
      SQLQ_referente.open;
      SQLQ_recibo.open;

      status:= status + 'Conectado; ';
    except
      ShowMessage('Não foi possivel acessar as tabelas do banco de dados.');
      status:= 'Firebird: Desconectado; sem acesso as tabelas;';
    end;
  end;

end;

procedure TDataModule1.DropTable();
begin

  if IBConnection.Connected = true then
  begin
    SQLTransaction.Rollback;
    try
      SQLS_droptable.Execute;
      SQLTransaction.CommitRetaining;
      ShowMessage('Tabelas Deletadas!');
    except
      SQLTransaction.RollbackRetaining;
      ShowMessage('Erro ao deletar as tabelas!');
    end;
  end;

  IBConnection.Connected:= True;
end;

procedure TDataModule1.SQL_referentePost(DataSet: TDataSet);
begin
  if DataSet.Modified = true then
  begin
    SQLQuery.close;
    SQLQuery.SQL.Clear;

    if dataset.State = dsInsert then
    begin
      SQLQuery.SQL.Add('insert into recibo_referente');
      SQLQuery.SQL.Add('(ativo, referente)');
      SQLQuery.SQL.Add('values(:ativo, :referente)');
      SQLQuery.SQL.Add('returning id;');
    end;

    if DataSet.State = dsEdit then
    begin
      SQLQuery.SQL.Add('update recibo_referente');
      SQLQuery.SQL.Add('set ativo = :ativo, referente = :referente');
      SQLQuery.SQL.Add('where id = :id');
      SQLQuery.SQL.Add('returning id;');
      SQLQuery.ParamByName('id').AsInteger:= DataSet.FieldByName('id').AsInteger;
    end;

    SQLQuery.ParamByName('ativo').AsInteger:= DataSet.FieldByName('ativo').AsInteger;
    SQLQuery.ParamByName('referente').Asstring:= DataSet.FieldByName('referente').Asstring;
    SQLQuery.open;
    SQLTransaction.CommitRetaining;

    DataSet.Cancel;
    DataSet.Close;
    DataSet.Open;
    DataSet.Locate('id', SQLQuery.FieldByName('id').asinteger, []);
    SQLQuery.Close;

  end else DataSet.Cancel;


end;

procedure TDataModule1.SQL_pessoaPost(DataSet: TDataSet);
begin
  if DataSet.Modified = true then
  begin
    SQLQuery.close;
    SQLQuery.SQL.Clear;

    if dataset.State = dsInsert then
    begin
      SQLQuery.SQL.Add('insert into recibo_pessoa');
      SQLQuery.SQL.Add('(ativo, nome, tagfisica, cpf, rg, cnpj, ie, endereco, complemento, bairro, cidade, estado, cep, telefone, email, web)');
      SQLQuery.SQL.Add('values(:ativo, :nome, :tagfisica, :cpf, :rg, :cnpj, :ie, :endereco, :complemento, :bairro, :cidade, :estado, :cep, :telefone, :email, :web)');
      SQLQuery.SQL.Add('returning id;');
    end;

    if DataSet.State = dsEdit then
    begin
      SQLQuery.SQL.Add('update recibo_pessoa');
      SQLQuery.SQL.Add('set ativo = :ativo, nome = :nome, tagfisica = :tagfisica, cpf = :cpf, rg = :rg, cnpj = :cnpj, ie = :ie, endereco = :endereco, complemento = :complemento, bairro = :bairro, cidade = :cidade, estado = :estado, cep = :cep, telefone = :telefone, email = :email, web = :web');
      SQLQuery.SQL.Add('where id = :id');
      SQLQuery.SQL.Add('returning id;');
      SQLQuery.ParamByName('id').AsInteger:= DataSet.FieldByName('id').AsInteger;
    end;

    SQLQuery.ParamByName('ativo').AsInteger:= DataSet.FieldByName('ativo').AsInteger;
    SQLQuery.ParamByName('nome').Asstring:= DataSet.FieldByName('nome').Asstring;
    SQLQuery.ParamByName('tagfisica').Asinteger:= DataSet.FieldByName('tagfisica').Asinteger;
    SQLQuery.ParamByName('cpf').Asstring:= DataSet.FieldByName('cpf').Asstring;
    SQLQuery.ParamByName('rg').Asstring:= DataSet.FieldByName('rg').Asstring;
    SQLQuery.ParamByName('cnpj').Asstring:= DataSet.FieldByName('cnpj').Asstring;
    SQLQuery.ParamByName('ie').Asstring:= DataSet.FieldByName('ie').Asstring;
    SQLQuery.ParamByName('endereco').Asstring:= DataSet.FieldByName('endereco').Asstring;
    SQLQuery.ParamByName('complemento').Asstring:= DataSet.FieldByName('complemento').Asstring;
    SQLQuery.ParamByName('bairro').Asstring:= DataSet.FieldByName('bairro').Asstring;
    SQLQuery.ParamByName('cidade').Asstring:= DataSet.FieldByName('cidade').Asstring;
    SQLQuery.ParamByName('estado').Asstring:= DataSet.FieldByName('estado').Asstring;
    SQLQuery.ParamByName('cep').Asstring:= DataSet.FieldByName('cep').Asstring;
    SQLQuery.ParamByName('telefone').Asstring:= DataSet.FieldByName('telefone').Asstring;
    SQLQuery.ParamByName('email').Asstring:= DataSet.FieldByName('email').Asstring;
    SQLQuery.ParamByName('web').Asstring:= DataSet.FieldByName('web').Asstring;
    SQLQuery.open;
    SQLTransaction.CommitRetaining;

    DataSet.Cancel;
    DataSet.Close;
    DataSet.Open;
    DataSet.Locate('id', SQLQuery.FieldByName('id').asinteger, []);
    SQLQuery.close;

  end else DataSet.Cancel;


end;

procedure TDataModule1.SQL_reciboPost(DataSet: TDataSet);
begin
  if DataSet.Modified = true then
  begin
    SQLQuery.close;
    SQLQuery.SQL.Clear;

    if dataset.State = dsInsert then
    begin
      SQLQuery.SQL.Add('insert into recibo');
      SQLQuery.SQL.Add('(ativo, numero, data, valor, vias, lkpagador, lkemitente, referente, obs)');
      SQLQuery.SQL.Add('values(:ativo, :numero, :data, :valor, :vias, :lkpagador, :lkemitente, :referente, :obs)');
      SQLQuery.SQL.Add('returning id;');
    end;

    if DataSet.State = dsEdit then
    begin
      SQLQuery.SQL.Add('update recibo');
      SQLQuery.SQL.Add('set ativo = :ativo, numero = :numero, data = :data, valor = :valor, vias = :vias, lkpagador = :lkpagador, lkemitente = :lkemitente, referente = :referente, obs = :obs');
      SQLQuery.SQL.Add('where id = :id');
      SQLQuery.SQL.Add('returning id;');
      SQLQuery.ParamByName('id').AsInteger:= DataSet.FieldByName('id').AsInteger;
    end;

    SQLQuery.ParamByName('ativo').AsInteger:= DataSet.FieldByName('ativo').AsInteger;
    SQLQuery.ParamByName('numero').Asstring:= DataSet.FieldByName('numero').Asstring;
    SQLQuery.ParamByName('data').Asstring:= DataSet.FieldByName('data').Asstring;
    SQLQuery.ParamByName('valor').AsFloat:= DataSet.FieldByName('valor').Asfloat;
    SQLQuery.ParamByName('vias').AsInteger:= DataSet.FieldByName('vias').AsInteger;
    SQLQuery.ParamByName('lkpagador').Asinteger:= DataSet.FieldByName('lkpagador').Asinteger;
    SQLQuery.ParamByName('lkemitente').Asinteger:= DataSet.FieldByName('lkemitente').Asinteger;
    SQLQuery.ParamByName('referente').Asstring:= DataSet.FieldByName('referente').Asstring;
    SQLQuery.ParamByName('obs').Asstring:= DataSet.FieldByName('obs').Asstring;
    SQLQuery.open;
    SQLTransaction.CommitRetaining;

    DataSet.Cancel;
    DataSet.Close;
    DataSet.Open;
    DataSet.Locate('id', SQLQuery.FieldByName('id').asinteger, []);
    SQLQuery.close;

  end else DataSet.Cancel;


end;


procedure TDataModule1.CreateTable();
begin

  IBConnection.Connected:= true;
  if IBConnection.Connected = true then
  begin
    SQLTransaction.Rollback;

    try
      SQLS_createtable.ExecuteScript;
      SQLTransaction.CommitRetaining;
      ShowMessage('Tabelas criadas!');
    except
      SQLTransaction.RollbackRetaining;
      ShowMessage('Erro ao criar as tabelas!');
    end;

  end;

  IBConnection.Connected:= True;
end;

procedure TDataModule1.DisConnectDb();
begin
  if IBConnection.Connected = true then
  begin
    SQLTransaction.Rollback;
  end;

  SQLQ_referente.Active:= False;
  SQLQ_pessoa.Active:= False;
  SQLQ_recibo.Active:= False;

  SQLTransaction.Active:= False;
  IBConnection.Connected:= False;
  SQLDBLibraryLoader.Enabled:= False;
  status:= 'Firebird: Desconectado; ';
end;

procedure TDataModule1.CreateDb();
begin
  //cria o banco de dados no servidor
  DisConnectDb();
  IBConnection.CreateDB;
  ConnectDb();
end;

procedure TDataModule1.DropDb();
begin
  //Delete o banco de dados no servidor
  DisConnectDb();
  IBConnection.DropDB;
  //ConnectDb();
end;


end.

