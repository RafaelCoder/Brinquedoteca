unit fPsqPessoas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fPsqPadrao, DB, DBClient, Grids, DBGrids, StdCtrls, ExtCtrls,
  Mask, ToolEdit, CurrEdit, dmMySQL, uGeral;

type
  TovF_PsqPessoas = class(TovF_PsqPadrao)
    ovCE_Codigo: TRxCalcEdit;
    Label1: TLabel;
    ovE_Nome: TEdit;
    Label2: TLabel;
    oCDS_PesquisaPes_Codigo: TIntegerField;
    oCDS_PesquisaPes_Nome: TStringField;
    oCDS_PesquisaPes_CPFCNPJ: TStringField;
    oCDS_PesquisaCli_Codigo: TIntegerField;
    procedure ovB_AtualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    function fConsulta(arrVal : array of string):boolean; override;
  end;

var
  ovF_PsqPessoas: TovF_PsqPessoas;

implementation

{$R *.dfm}

//******************************************************************************
procedure TovF_PsqPessoas.ovB_AtualizarClick(Sender: TObject);
begin
  vsWHERE := '1=1';
  if ovCE_Codigo.Text <> '' then
    vsWHERE := vsWHERE + ' AND C.Cli_Codigo = '+ovCE_Codigo.Text;

  if ovCE_Codigo.Text <> '' then
    vsWHERE := vsWHERE + ' AND P.Pes_Nome LIKE "%'+Trim(ovCE_Codigo.Text)+'%"';
  inherited;
end;

//******************************************************************************
procedure TovF_PsqPessoas.FormCreate(Sender: TObject);
begin
  inherited;
  vsSELECT := ' SELECT P.Pes_Codigo, C.Cli_Codigo, Pes_Nome, Pes_CPFCNPJ, Pes_DDDCel, Pes_Celular, Pes_DDDFone,'+
              '  Pes_Fone, Pes_DataNascimento,Pes_NumEndereco, Pes_Endereco'+
              ' FROM Pessoas P'+
              ' INNER JOIN Clientes C ON C.Pes_Codigo = P.Pes_Codigo';
  vsORDERBY := ' ORDER BY C.Cli_Codigo';
end;

//******************************************************************************
function TovF_PsqPessoas.fConsulta(arrVal: array of string): boolean;
begin
  Result := false;
  if length(arrVal) <= 0 then
    Exit;
  if arrVal[0] = '' then
    Exit;
  ExecSQL(vsSELECT+' WHERE C.Cli_Codigo = '+arrVal[0], oCDS_Pesquisa);
  Result := not oCDS_Pesquisa.IsEmpty;
end;

//******************************************************************************
end.
