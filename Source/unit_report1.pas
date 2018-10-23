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

unit unit_report1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  RLReport, ACBrExtenso;

type

  { TReport1 }

  TReport1 = class(TForm)
    ACBrExtenso1: TACBrExtenso;
    PageControl1: TPageControl;
    RLBand10: TRLBand;
    RLBand12: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLBand6: TRLBand;
    RLBand7: TRLBand;
    RLBand8: TRLBand;
    RLBand9: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    RLDBText15: TRLDBText;
    RLDBText16: TRLDBText;
    RLDBText17: TRLDBText;
    RLDBText18: TRLDBText;
    RLDBText19: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText20: TRLDBText;
    RLDBText21: TRLDBText;
    RLDBText22: TRLDBText;
    RLDBText23: TRLDBText;
    RLDBText24: TRLDBText;
    RLDBText25: TRLDBText;
    RLDBText26: TRLDBText;
    RLDBText27: TRLDBText;
    RLDBText28: TRLDBText;
    RLDBText29: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText30: TRLDBText;
    RLDBText31: TRLDBText;
    RLDBText32: TRLDBText;
    RLDBText33: TRLDBText;
    RLDBText34: TRLDBText;
    RLDBText35: TRLDBText;
    RLDBText36: TRLDBText;
    RLDBText37: TRLDBText;
    RLDBText38: TRLDBText;
    RLDBText39: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText40: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDraw1: TRLDraw;
    RLDraw10: TRLDraw;
    RLDraw11: TRLDraw;
    RLDraw12: TRLDraw;
    RLDraw13: TRLDraw;
    RLDraw14: TRLDraw;
    RLDraw15: TRLDraw;
    RLDraw16: TRLDraw;
    RLDraw17: TRLDraw;
    RLDraw2: TRLDraw;
    RLDraw3: TRLDraw;
    RLDraw4: TRLDraw;
    RLDraw5: TRLDraw;
    RLDraw6: TRLDraw;
    RLDraw7: TRLDraw;
    RLDraw8: TRLDraw;
    RLDraw9: TRLDraw;
    RLLabel1: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel25: TRLLabel;
    RLLabel26: TRLLabel;
    RLLabel27: TRLLabel;
    RLLabel28: TRLLabel;
    RLLabel29: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel30: TRLLabel;
    RLLabel31: TRLLabel;
    RLLabel32: TRLLabel;
    RLLabel33: TRLLabel;
    RLLabel34: TRLLabel;
    RLLabel35: TRLLabel;
    RLLabel36: TRLLabel;
    RLLabel37: TRLLabel;
    RLLabel38: TRLLabel;
    RLLabel39: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel40: TRLLabel;
    RLLabel41: TRLLabel;
    RLLabel42: TRLLabel;
    RLLabel43: TRLLabel;
    RLLabel44: TRLLabel;
    RLLabel45: TRLLabel;
    RLLabel46: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLReport_recibos: TRLReport;
    RLReport_recibo: TRLReport;
    RLReport_referente: TRLReport;
    RLReport_pessoa: TRLReport;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLSystemInfo4: TRLSystemInfo;
    RLSystemInfo5: TRLSystemInfo;
    RLSystemInfo6: TRLSystemInfo;
    RLSystemInfo7: TRLSystemInfo;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    procedure RLDBText30BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLDBTextBeforePrint_ativo(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLDBText28BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLDBTextdocBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLDBText34BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLDBText38BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLDBTextaddrBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLReport_reciboBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLSystemInfo2BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLSystemInfo7BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
  private

  public

  end;

var
  Report1: TReport1;

implementation

uses unit_dm1;

{$R *.lfm}

{ TReport1 }

procedure TReport1.RLDBTextBeforePrint_ativo(Sender: TObject; var AText: string;
  var PrintIt: Boolean);
begin
  if (sender as TRLDBText).DataSource.DataSet.FieldByName('ativo').asinteger = 1 then
     (sender as TRLDBText).Font.Color:= clblack else
       (sender as TRLDBText).Font.Color:= clgray;
end;

procedure TReport1.RLDBText30BeforePrint(Sender: TObject; var AText: string;
  var PrintIt: Boolean);
begin
  AText:= ACBrExtenso1.ValorToTexto(StrToFloatDef(Atext, 0.0)) + '.';
end;

procedure TReport1.RLDBText28BeforePrint(Sender: TObject; var AText: string;
  var PrintIt: Boolean);
begin
  AText:= FormatDateTime('dddd, dd "de" mmmm "de" yyyy.' , StrToDateDef(Atext, date) );
end;

procedure TReport1.RLDBTextdocBeforePrint(Sender: TObject; var AText: string;
  var PrintIt: Boolean);
var
  id: integer;
  hold: integer;
  temp: string;
begin
  id:= strtointdef(Atext, 0);

  hold:= DataModule1.DS_pessoa.DataSet.FieldByName('id').asinteger;

  AText:= '';

  DataModule1.DS_pessoa.DataSet.DisableControls;

  if DataModule1.DS_pessoa.DataSet.Locate('id', id, []) then
  begin
    temp:= DataModule1.DS_pessoa.DataSet.FieldByName('cnpj').asstring;
    if trim(temp) <> '' then AText:= Atext + 'CNPJ:' + temp + '     ';

    temp:= DataModule1.DS_pessoa.DataSet.FieldByName('ie').asstring;
    if trim(temp) <> '' then AText:= Atext + 'I.E.:' + temp + '     ';

    temp:= DataModule1.DS_pessoa.DataSet.FieldByName('cpf').asstring;
    if trim(temp) <> '' then AText:= Atext + 'CPF:' + temp + '     ';

    temp:= DataModule1.DS_pessoa.DataSet.FieldByName('rg').asstring;
    if trim(temp) <> '' then AText:= Atext + 'RG:' + temp + '     ';
  end;

  DataModule1.DS_pessoa.DataSet.Locate('id', hold, []);

  DataModule1.DS_pessoa.DataSet.EnableControls;
end;

procedure TReport1.RLDBText34BeforePrint(Sender: TObject; var AText: string;
  var PrintIt: Boolean);
begin
  Atext:= CurrToStrF(StrToCurrDef(Atext, 0.0), ffcurrency, CurrencyDecimals);
end;

procedure TReport1.RLDBText38BeforePrint(Sender: TObject; var AText: string;
  var PrintIt: Boolean);
begin
  Atext:= CurrToStrF(StrToCurrDef(Atext, 0.0), ffcurrency, CurrencyDecimals);
end;

procedure TReport1.RLDBTextaddrBeforePrint(Sender: TObject; var AText: string;
  var PrintIt: Boolean);
var
  id: integer;
  hold: integer;
  temp: string;
begin
  id:= strtointdef(Atext, 0);

  hold:= DataModule1.DS_pessoa.DataSet.FieldByName('id').asinteger;

  AText:= '';

  DataModule1.DS_pessoa.DataSet.DisableControls;

  if DataModule1.DS_pessoa.DataSet.Locate('id', id, []) then
  begin
    temp:= DataModule1.DS_pessoa.DataSet.FieldByName('endereco').asstring;
    if trim(temp) <> '' then AText:= Atext + '' + temp + ' ';

    temp:= DataModule1.DS_pessoa.DataSet.FieldByName('cidade').asstring;
    if trim(temp) <> '' then AText:= Atext + '- ' + temp + ' ';

    temp:= DataModule1.DS_pessoa.DataSet.FieldByName('estado').asstring;
    if trim(temp) <> '' then AText:= Atext + '/ ' + temp + ' ';

    temp:= DataModule1.DS_pessoa.DataSet.FieldByName('cep').asstring;
    if trim(temp) <> '' then AText:= Atext + 'CEP: ' + temp + ' ';
  end;

  DataModule1.DS_pessoa.DataSet.Locate('id', hold, []);

  DataModule1.DS_pessoa.DataSet.EnableControls;
end;

procedure TReport1.RLReport_reciboBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLband12.CarbonCopies:= DataModule1.DS_recibo.DataSet.FieldByName('vias').AsInteger
end;

procedure TReport1.RLSystemInfo2BeforePrint(Sender: TObject; var AText: string;
  var PrintIt: Boolean);
begin
  atext:= 'Pagina: ' + atext;
end;

procedure TReport1.RLSystemInfo7BeforePrint(Sender: TObject; var AText: string;
  var PrintIt: Boolean);
begin
  Atext:= Atext+'°. via';
end;

end.

