unit fPsqDependentes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fPsqPadrao, DB, DBClient, Grids, DBGrids, StdCtrls, ExtCtrls, dmMySQL, uGeral;

type
  TovF_PsqDependentes = class(TovF_PsqPadrao)
    Label1: TLabel;
    ovE_DepNome: TEdit;
    oCDS_PesquisaCli_Codigo: TIntegerField;
    oCDS_PesquisaResponsavel: TStringField;
    oCDS_PesquisaDep_Codigo: TIntegerField;
    oCDS_PesquisaDependente: TStringField;
    procedure ovB_AtualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    function fConsulta(arrVal : array of string):boolean; override;
  end;

var
  ovF_PsqDependentes: TovF_PsqDependentes;

implementation

{$R *.dfm}

{ TovF_PsqDependentes }

//******************************************************************************
function TovF_PsqDependentes.fConsulta(arrVal: array of string): boolean;
begin
  Result := false;
  if length(arrVal) <= 0 then
    Exit;
  if (arrVal[0] = '') or (arrVal[1] = '') then
    Exit;
  ExecSQL(vsSELECT+' WHERE D.Cli_Codigo = '+arrVal[0]+' AND D.Dep_Codigo = '+arrVal[1], oCDS_Pesquisa);
  Result := not oCDS_Pesquisa.IsEmpty;
end;

//******************************************************************************
procedure TovF_PsqDependentes.ovB_AtualizarClick(Sender: TObject);
begin
  vsWHERE := '1=1';
  if ovE_DepNome.Text <> '' then
    vsWHERE := vsWHERE + ' AND PD.Pes_Nome LIKE "%'+Trim(ovE_DepNome.Text)+'%"';
  if Trim(vsFILTER) <> '' then
    vsWHERE := vsWHERE+' '+vsFILTER; 
  inherited;
end;

//******************************************************************************
procedure TovF_PsqDependentes.FormCreate(Sender: TObject);
begin
  inherited;
  vsSELECT := ' SELECT D.Dep_Codigo, D.Cli_Codigo, PD.Pes_Nome AS Dependente, PC.Pes_Nome AS Responsavel'+
              ' FROM Dependentes D'+
              ' INNER JOIN Pessoas PD ON PD.Pes_Codigo = D.Pes_Codigo'+
              ' INNER JOIN Clientes C ON C.Cli_Codigo = D.Cli_Codigo'+
              ' INNER JOIN Pessoas PC ON PC.Pes_Codigo = C.Pes_Codigo';
  vsORDERBY := ' ORDER BY Dependente, Responsavel';
end;

//******************************************************************************
end.
