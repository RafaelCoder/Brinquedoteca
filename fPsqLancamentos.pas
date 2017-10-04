unit fPsqLancamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fPsqPadrao, DB, DBClient, Grids, DBGrids, StdCtrls, ExtCtrls,
  fra_Dependentes, Mask, ToolEdit, dmMySQL, uGeral;

type
  TovF_PsqLancamentos = class(TovF_PsqPadrao)
    ovFra_Dependentes1: TovFra_Dependentes;
    ovDE_De: TDateEdit;
    Label1: TLabel;
    ovDE_Ate: TDateEdit;
    Label2: TLabel;
    ovCB_Fechados: TCheckBox;
    oCDS_PesquisaLan_Codigo: TIntegerField;
    oCDS_PesquisaDep_Codigo: TIntegerField;
    oCDS_PesquisaCli_Codigo: TIntegerField;
    oCDS_PesquisaDependente: TStringField;
    oCDS_PesquisaResponsavel: TStringField;
    oCDS_PesquisaLan_DataHoraEnt: TDateTimeField;
    oCDS_PesquisaLan_DataHoraSai: TDateTimeField;
    oCDS_PesquisaLan_Fechado: TStringField;
    oCDS_PesquisaLan_VlrHora: TFloatField;
    oCDS_PesquisaLan_VlrTotal: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure ovB_AtualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    function fConsulta(arrVal : array of string):boolean; override;
  end;

var
  ovF_PsqLancamentos: TovF_PsqLancamentos;

implementation

{$R *.dfm}

//******************************************************************************
function TovF_PsqLancamentos.fConsulta(arrVal: array of string): boolean;
begin
  Result := false;
  if length(arrVal) <= 0 then
    Exit;
  if (arrVal[0] = '') then
    Exit;
  ExecSQL(vsSELECT+' WHERE L.Lan_Codigo = '+arrVal[0], oCDS_Pesquisa);
  Result := not oCDS_Pesquisa.IsEmpty;
end;

//******************************************************************************
procedure TovF_PsqLancamentos.FormCreate(Sender: TObject);
begin
  inherited;
  vsSELECT := ' SELECT L.Lan_Codigo, D.Dep_Codigo, D.Cli_Codigo, PD.Pes_Nome AS Dependente, PC.Pes_Nome AS Responsavel,'+
              '     TIME(Lan_DataHoraEnt) AS Lan_DataHoraEnt, TIME(Lan_DataHoraSai) AS Lan_DataHoraSai, Lan_Fechado, Lan_VlrHora, Lan_VlrTotal'+
              ' FROM Lancamentos L'+
              ' INNER JOIN Dependentes D ON D.Dep_Codigo = L.Dep_Codigo'+
              '     AND D.Cli_Codigo = L.Cli_Codigo'+
              ' INNER JOIN Pessoas PD ON PD.Pes_Codigo = D.Pes_Codigo'+
              ' INNER JOIN Clientes C ON C.Cli_Codigo = D.Cli_Codigo'+
              ' INNER JOIN Pessoas PC ON PC.Pes_Codigo = C.Pes_Codigo';
  vsORDERBY := ' ORDER BY Lan_Codigo';
end;

//******************************************************************************
procedure TovF_PsqLancamentos.ovB_AtualizarClick(Sender: TObject);
begin
  inherited;

end;

//******************************************************************************
end.
