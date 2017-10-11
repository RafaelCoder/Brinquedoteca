unit fRelFaixaEtaria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, DB, DBClient, QRCtrls;

type
  TovRel_FaixaEtaria = class(TForm)
    oQR_Relatorio: TQuickRep;
    PageHeaderBand1: TQRBand;
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    oCDS_Relatorio: TClientDataSet;
    PageFooterBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    oCDS_RelatorioPes_Nome: TStringField;
    oCDS_RelatorioIdade: TIntegerField;
    ovQRDBT_Nome: TQRDBText;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ovRel_FaixaEtaria: TovRel_FaixaEtaria;

implementation

{$R *.dfm}

//******************************************************************************
procedure TovRel_FaixaEtaria.FormCreate(Sender: TObject);
begin
  oCDS_Relatorio.CreateDataSet;
end;

//******************************************************************************
end.
