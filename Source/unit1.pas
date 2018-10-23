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

unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DBDateTimePicker, Forms, Controls, Graphics,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, DBGrids, DbCtrls, lclintf, ValEdit,
  Grids, Menus, Buttons, vinfo;

type

  { TForm1 }

  TForm1 = class(TForm)
    ComboBox1: TComboBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBComboBox1: TDBComboBox;
    DBDateTimePicker1: TDBDateTimePicker;
    DBEdit1: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBGrid_ref: TDBGrid;
    DBGrid_pessoas: TDBGrid;
    DBGrid_recibos: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    Image1: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    Memo_sobre: TMemo;
    PageControl_recibos: TPageControl;
    PageControl_menu: TPageControl;
    PageControl_pessoas: TPageControl;
    PageControl_ref: TPageControl;
    PageControl_sobre: TPageControl;
    ScrollBox1: TScrollBox;
    ScrollBox2: TScrollBox;
    SpeedButton1: TSpeedButton;
    StatusBar1: TStatusBar;
    TabSheet_pessoas_listar: TTabSheet;
    TabSheet_pessoas_detalhe: TTabSheet;
    TabSheet_recibos_listar: TTabSheet;
    TabSheet_recibos_detalhe: TTabSheet;
    TabSheet_recibos: TTabSheet;
    TabSheet_ref_listar: TTabSheet;
    TabSheet_ref_detalhe: TTabSheet;
    TabSheet_pessoas: TTabSheet;
    TabSheet_ref: TTabSheet;
    TabSheet_config: TTabSheet;
    TabSheet_sobre: TTabSheet;
    TabSheet_sair: TTabSheet;
    ToggleBox1: TToggleBox;
    ToolBar_pessoas_detalhe: TToolBar;
    ToolBar_recibos_detalhe: TToolBar;
    ToolBar_ref_listar: TToolBar;
    ToolBar_ref_detalhe: TToolBar;
    ToolBar_config: TToolBar;
    ToolBar_pessoas_listar: TToolBar;
    ToolBar_recibos_listar: TToolBar;
    ToolBar_sobre: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    ToolButton_recibo_print: TToolButton;
    ToolButton_recibos_recibo: TToolButton;
    ToolButton_config_cancel: TToolButton;
    ToolButton_config_save: TToolButton;
    ToolButton7: TToolButton;
    ToolButton_ref_cancel1: TToolButton;
    ToolButton_pessoas_cancel: TToolButton;
    ToolButton_recibos_cancel: TToolButton;
    ToolButton_ref_edit: TToolButton;
    ToolButton_pessoas_edit: TToolButton;
    ToolButton_recibos_edit: TToolButton;
    ToolButton_ref_excluir: TToolButton;
    ToolButton_pessoas_excluir: TToolButton;
    ToolButton_recibos_excluir: TToolButton;
    ToolButton_ref_report: TToolButton;
    ToolButton_pessoas_report: TToolButton;
    ToolButton_recibos_report: TToolButton;
    ToolButton_ref_novo: TToolButton;
    ToolButton_pessoas_novo: TToolButton;
    ToolButton_recibos_novo: TToolButton;
    ToolButton_ref_post1: TToolButton;
    ToolButton_pessoas_post: TToolButton;
    ToolButton_recibos_post: TToolButton;
    procedure DBLookupComboBox3DropDown(Sender: TObject);
    procedure DBLookupComboBox3Select(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TabSheet_pessoasShow(Sender: TObject);
    procedure TabSheet_recibosShow(Sender: TObject);
    procedure TabSheet_refShow(Sender: TObject);
    procedure TabSheet_configShow(Sender: TObject);
    procedure TabSheet_sairShow(Sender: TObject);
    procedure GetConfig(Sender: Tobject);
    procedure ToggleBox1Change(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton_pessoas_cancelClick(Sender: TObject);
    procedure ToolButton_pessoas_editClick(Sender: TObject);
    procedure ToolButton_pessoas_excluirClick(Sender: TObject);
    procedure ToolButton_pessoas_reportClick(Sender: TObject);
    procedure ToolButton_pessoas_novoClick(Sender: TObject);
    procedure ToolButton_pessoas_postClick(Sender: TObject);
    procedure ToolButton_recibos_cancelClick(Sender: TObject);
    procedure ToolButton_recibos_editClick(Sender: TObject);
    procedure ToolButton_recibos_excluirClick(Sender: TObject);
    procedure ToolButton_recibos_reportClick(Sender: TObject);
    procedure ToolButton_recibos_reciboClick(Sender: TObject);
    procedure ToolButton_recibos_novoClick(Sender: TObject);
    procedure ToolButton_recibos_postClick(Sender: TObject);
    procedure ToolButton_recibo_printClick(Sender: TObject);
    procedure ToolButton_ref_cancel1Click(Sender: TObject);
    procedure ToolButton_ref_editClick(Sender: TObject);
    procedure ToolButton_ref_excluirClick(Sender: TObject);
    procedure ToolButton_ref_reportClick(Sender: TObject);
    procedure ToolButton_config_cancelClick(Sender: TObject);
    procedure ToolButton_config_saveClick(Sender: TObject);
    procedure ToolButton_ref_novoClick(Sender: TObject);
    procedure ToolButton_ref_post1Click(Sender: TObject);

  private

  public

  end;

var
  Form1: TForm1;

implementation

uses unit_dm1, unit_report1;

{$R *.lfm}

{ TForm1 }

procedure TForm1.GetConfig(Sender: Tobject);
begin
  LabeledEdit1.Text:= DataModule1.IBConnection.HostName;
  LabeledEdit2.Text:= DataModule1.IBConnection.UserName;
  LabeledEdit3.Text:= DataModule1.IBConnection.Password;
  LabeledEdit4.Text:= DataModule1.IBConnection.DatabaseName;
  ComboBox1.Text:= DataModule1.SQLDBLibraryLoader.LibraryName;
  if ComboBox1.Text = '' then ComboBox1.ItemIndex:= 0;
end;

procedure TForm1.ToggleBox1Change(Sender: TObject);
begin
  if ToggleBox1.Checked = true then
    LabeledEdit3.PasswordChar:= #0 else
      LabeledEdit3.PasswordChar:= '*';

  LabeledEdit3.Refresh;
end;

procedure TForm1.ToolButton1Click(Sender: TObject);
begin
    if QuestionDlg ('Excluir Tabelas','ATENÇÃO! TODOS OS DADOS SERÃO EXCLUIDOS PERMANENTEMENTE. Deseja Continuar?',mtCustom,[mrYes,'Sim', mrNo, 'Não', 'IsDefault'],'') = mrYes then
      if QuestionDlg ('Excluir Tabelas','Excluir Tabelas do Banco de Dados?',mtCustom,[mrYes,'Sim', mrNo, 'Não', 'IsDefault'],'') = mrYes then
      begin
        DataModule1.DropTable();
      end;
end;

procedure TForm1.ToolButton2Click(Sender: TObject);
begin
  if QuestionDlg ('Criar Tabelas','Criar novas tabelas no banco de dados?',mtCustom,[mrYes,'Sim', mrNo, 'Não', 'IsDefault'],'') = mrYes then
    begin
      DataModule1.CreateTable();
    end;
end;

procedure TForm1.ToolButton5Click(Sender: TObject);
begin
  if QuestionDlg ('Excluir Banco de Dados','ATENÇÃO! TODOS OS DADOS E TABELAS CONTIDAS NO ARQUIVO DO BANCO DE DADOS SERÃO EXCLUIDOS PERMANENTEMENTE. Deseja Continuar?',mtCustom,[mrYes,'Sim', mrNo, 'Não', 'IsDefault'],'') = mrYes then
    if QuestionDlg ('Excluir Banco de Dados','Excluir arquivo do Banco de Dados?',mtCustom,[mrYes,'Sim', mrNo, 'Não', 'IsDefault'],'') = mrYes then
    begin
      DataModule1.DropDB();
    end;
end;

procedure TForm1.ToolButton8Click(Sender: TObject);
begin
  if QuestionDlg ('Criar Banco de Dados','Criar novo arquivo banco de dados?',mtCustom,[mrYes,'Sim', mrNo, 'Não', 'IsDefault'],'') = mrYes then
    begin
      DataModule1.CreateDb();
    end;
end;

procedure TForm1.ToolButton_pessoas_cancelClick(Sender: TObject);
begin
  DBGrid_pessoas.DataSource.DataSet.Cancel;
  TabSheet_pessoas_listar.Show;
end;

procedure TForm1.ToolButton_pessoas_editClick(Sender: TObject);
begin
  if DBGrid_pessoas.DataSource.DataSet.FieldByName('id').AsInteger > 0 then
  begin
    TabSheet_pessoas_detalhe.Show;
    DBEdit1.SetFocus;
    DBGrid_pessoas.DataSource.DataSet.Edit;
  end;
end;

procedure TForm1.ToolButton_pessoas_excluirClick(Sender: TObject);
var
  id, ref_count: integer;
begin
  id:= DBGrid_pessoas.DataSource.DataSet.FieldByName('id').AsInteger;

  if id > 0 then
  begin
    ref_count:= DataModule1.checkpessoainrecibo(id);
    if ref_count = 0 then
    begin
      if QuestionDlg ('Excluir cadastro','Excluir cadastro ID: ' + IntToStr(id) + ' ?',mtCustom,[mrYes,'Sim', mrNo, 'Não', 'IsDefault'],'') = mrYes then
      begin
        DBGrid_pessoas.DataSource.DataSet.Delete;
      end;
    end else
    begin
      if ref_count = -1 then
      begin
        ShowMessage('Não foi possivel verificar a integridade dos dados.');
      end else
      begin
        if ref_count > 0 then ShowMessage('Não foi possível excluir o cadastro, porque está sendo referenciados por ' + IntToStr(ref_count) + ' recibo(s), para excluir este cadastro é preciso primeiro excluir o(s) '+ IntToStr(ref_count) + ' recido(s) que o referencia.');
      end
    end;
  end;
end;

procedure TForm1.ToolButton_pessoas_reportClick(Sender: TObject);
var
  id: integer;
begin
  DBGrid_pessoas.DataSource.DataSet.DisableControls;
  id:= DBGrid_pessoas.DataSource.DataSet.FieldByName('id').AsInteger;
  Report1.RLReport_pessoa.Preview();
  DBGrid_pessoas.DataSource.DataSet.Locate('id', id, []);
  DBGrid_pessoas.DataSource.DataSet.EnableControls;
end;

procedure TForm1.ToolButton_pessoas_novoClick(Sender: TObject);
begin
  TabSheet_pessoas_detalhe.Show;
  DBEdit1.SetFocus;
  DBGrid_pessoas.DataSource.DataSet.Insert;
  DBGrid_pessoas.DataSource.DataSet.FieldByName('ativo').asinteger:= 1;
end;

procedure TForm1.ToolButton_pessoas_postClick(Sender: TObject);
begin
  ScrollBox1.SetFocus;
  DataModule1.SQL_pessoaPost(DBGrid_pessoas.DataSource.DataSet);
  TabSheet_pessoas_listar.Show;
end;

procedure TForm1.ToolButton_recibos_cancelClick(Sender: TObject);
begin
  DBGrid_recibos.DataSource.DataSet.Cancel;
  TabSheet_recibos_listar.Show;
end;

procedure TForm1.ToolButton_recibos_editClick(Sender: TObject);
begin
  if DBGrid_recibos.DataSource.DataSet.FieldByName('id').AsInteger > 0 then
  begin
    TabSheet_recibos_detalhe.Show;
    DBEdit16.SetFocus;
    DBGrid_recibos.DataSource.DataSet.Edit;
  end;
end;

procedure TForm1.ToolButton_recibos_excluirClick(Sender: TObject);
var
  id: integer;
begin
  id:= DBGrid_recibos.DataSource.DataSet.FieldByName('id').AsInteger;
  if id > 0 then
    if QuestionDlg ('Excluir cadastro','Excluir cadastro ID: ' + IntToStr(id) + '?',mtCustom,[mrYes,'Sim', mrNo, 'Não', 'IsDefault'],'') = mrYes then
      DBGrid_recibos.DataSource.DataSet.Delete;
end;

procedure TForm1.ToolButton_recibos_reportClick(Sender: TObject);
var
  id: integer;
begin
  DBGrid_recibos.DataSource.DataSet.DisableControls;
  id:= DBGrid_recibos.DataSource.DataSet.FieldByName('id').AsInteger;
  Report1.RLReport_recibos.Preview();
  DBGrid_recibos.DataSource.DataSet.Locate('id', id, []);
  DBGrid_recibos.DataSource.DataSet.EnableControls;
end;

procedure TForm1.ToolButton_recibos_reciboClick(Sender: TObject);
var
  id: integer;
begin
  DBGrid_recibos.DataSource.DataSet.DisableControls;
  id:= DBGrid_recibos.DataSource.DataSet.FieldByName('id').AsInteger;
  Report1.RLReport_recibo.Preview();
  DBGrid_recibos.DataSource.DataSet.Locate('id', id, []);
  DBGrid_recibos.DataSource.DataSet.EnableControls;
end;

procedure TForm1.ToolButton_recibos_novoClick(Sender: TObject);
begin
  DataModule1.DS_recibo.DataSet.Insert;
  DataModule1.DS_recibo.DataSet.FieldByName('data').asstring:= datetostr(date);
  DataModule1.DS_recibo.DataSet.FieldByName('ativo').asinteger:= 1;
  DataModule1.DS_recibo.DataSet.FieldByName('vias').asinteger:= 1;
  DataModule1.DS_recibo.DataSet.FieldByName('numero').asstring:= formatdatetime('yyyymmddhhnnss', Now);

  //DataModule1.SQLQ_pessoa.Filtered:= True; //refresh ???

  TabSheet_recibos_detalhe.Show;
  dbedit16.SetFocus;
end;

procedure TForm1.ToolButton_recibos_postClick(Sender: TObject);
begin
  ScrollBox2.SetFocus;
  DataModule1.SQL_reciboPost(DBGrid_recibos.DataSource.DataSet);
  TabSheet_recibos_listar.Show;
end;

procedure TForm1.ToolButton_recibo_printClick(Sender: TObject);
begin
  ToolButton_recibos_postClick(sender);
  ToolButton_recibos_reciboClick(sender);
end;

procedure TForm1.ToolButton_ref_cancel1Click(Sender: TObject);
begin
  DBGrid_ref.DataSource.DataSet.Cancel;
  TabSheet_ref_listar.Show;
end;

procedure TForm1.ToolButton_ref_editClick(Sender: TObject);
begin
  if DBGrid_ref.DataSource.DataSet.FieldByName('id').AsInteger > 0 then
  begin
    TabSheet_ref_detalhe.Show;
    DBMemo1.SetFocus;
    DBGrid_ref.DataSource.DataSet.Edit;
  end;
end;

procedure TForm1.ToolButton_ref_excluirClick(Sender: TObject);
var
  id: integer;
begin
  id:= DBGrid_ref.DataSource.DataSet.FieldByName('id').AsInteger;
  if  id > 0 then
    if QuestionDlg ('Excluir cadastro','Excluir cadastro ID: ' + inttostr(id)+ ' ?',mtCustom,[mrYes,'Sim', mrNo, 'Não', 'IsDefault'],'') = mrYes then
    begin
      DBGrid_ref.DataSource.DataSet.Delete;
    end;
end;

procedure TForm1.ToolButton_ref_reportClick(Sender: TObject);
var
  id: integer;
begin
  DBGrid_ref.DataSource.DataSet.DisableControls;
  id:= DBGrid_ref.DataSource.DataSet.FieldByName('id').AsInteger;
  Report1.RLReport_referente.Preview();
  DBGrid_ref.DataSource.DataSet.Locate('id', id, []);
  DBGrid_ref.DataSource.DataSet.EnableControls;
end;

procedure TForm1.ToolButton_config_cancelClick(Sender: TObject);
begin
  GetConfig(sender);
end;

procedure TForm1.ToolButton_config_saveClick(Sender: TObject);
begin
  DataModule1.DisConnectDb();
  //seta configuração do firebird
  DataModule1.IBConnection.HostName:= LabeledEdit1.Text;
  DataModule1.IBConnection.UserName:= LabeledEdit2.Text;
  DataModule1.IBConnection.Password:= LabeledEdit3.Text;
  DataModule1.IBConnection.DatabaseName:= LabeledEdit4.Text;
  DataModule1.SQLDBLibraryLoader.LibraryName:= ComboBox1.Text;

  //salva configuração de conexão com firebird
  DataModule1.SaveConfig();
  DataModule1.ConnectDb();
  StatusBar1.SimpleText:= DataModule1.status;
end;

procedure TForm1.ToolButton_ref_novoClick(Sender: TObject);
begin
  TabSheet_ref_detalhe.Show;
  DBMemo1.SetFocus;
  DBGrid_ref.DataSource.DataSet.Insert;
  DBGrid_ref.DataSource.DataSet.FieldByName('ativo').AsInteger:= 1;
end;

procedure TForm1.ToolButton_ref_post1Click(Sender: TObject);
begin
  TabSheet_ref.SetFocus;
  DataModule1.SQL_referentePost(DBGrid_ref.DataSource.DataSet);
  TabSheet_ref_listar.Show;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  Info: TVersionInfo;
begin
  // Get application compiled version#
  Info := TVersionInfo.Create;
  Info.Load(HINSTANCE);
  Memo_sobre.Lines.Strings[0] := Info.ProductName;
  Memo_sobre.Lines.Strings[1] := 'Versão: '+ info.FileVersion + '  ('+ info.ProductVersion +')';
  Info.Free;

  {$IFDEF UNIX}
    ComboBox1.Items.Add('libfbclient.so');
    ComboBox1.Items.Add('libfbclient.so.2');
    ComboBox1.Items.Add('libfbclient.so.2.5');
    ComboBox1.Items.Add('libfbembed.so');
    ComboBox1.Items.Add('libfbembed.so.2');
    ComboBox1.Items.Add('libfbembed.so.2.5');
  {$ELSE}
    ComboBox1.Items.Add('fbclient.dll');
    ComboBox1.Items.Add('fbembed.dll');
  {$ENDIF}

  //mostra aba "sobre" ao iniciar o programa
  TabSheet_sobre.Show;

  //hide tabs
  PageControl_ref.ShowTabs:= false;
  PageControl_pessoas.ShowTabs:= false;
  PageControl_recibos.ShowTabs:= false;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
   StatusBar1.SimpleText:= DataModule1.status;
end;

procedure TForm1.DBLookupComboBox3DropDown(Sender: TObject);
begin
  DBLookupComboBox3.ClearSelection;
end;

procedure TForm1.DBLookupComboBox3Select(Sender: TObject);
begin
  DBMemo3.DataSource.DataSet.FieldByName('referente').asstring:= DBLookupComboBox3.Text;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  DataModule1.DisConnectDb();
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
  //link para doação pagseguro
  OpenURL('https://pag.ae/bbDcS8k');
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  DBMemo3.Clear;
end;

procedure TForm1.TabSheet_pessoasShow(Sender: TObject);
begin
  DBGrid_pessoas.DataSource.DataSet.Cancel;
  TabSheet_pessoas_listar.Show;
  TabSheet_pessoas.Enabled:= DataModule1.IBConnection.Connected;
end;

procedure TForm1.TabSheet_recibosShow(Sender: TObject);
begin
  DBGrid_recibos.DataSource.DataSet.Cancel;
  TabSheet_recibos_listar.Show;
  TabSheet_recibos.Enabled:= DataModule1.IBConnection.Connected;
end;

procedure TForm1.TabSheet_refShow(Sender: TObject);
begin
  DBGrid_ref.DataSource.DataSet.Cancel;
  TabSheet_ref_listar.Show;
  TabSheet_ref.Enabled:= DataModule1.IBConnection.Connected;
end;

procedure TForm1.TabSheet_configShow(Sender: TObject);
begin
  GetConfig(Sender);
end;

procedure TForm1.TabSheet_sairShow(Sender: TObject);
begin
  close;
end;

end.

