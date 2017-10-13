unit fRelFiltrosFaixaEtaria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fRelFiltrosPadrao, StdCtrls, ExtCtrls, Mask, ToolEdit, dmMySQL, uGeral,
  fRelFaixaEtaria;

type
  TovF_RelFiltrosFaixaEtaria = class(TovF_RelFiltrosPadrao)
    ovDE_De: TDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    ovDE_Ate: TDateEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ovB_SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    function fGetDados:Boolean; override;
    function fValidaCampos:Boolean; override;
    procedure pChamaImpressao; override;
    procedure pLimpaCampos; override;
  public
    { Public declarations }
  end;

var
  ovF_RelFiltrosFaixaEtaria: TovF_RelFiltrosFaixaEtaria;

implementation

{$R *.dfm}

{ TovF_RelFiltrosFaixaEtaria }

//******************************************************************************
function TovF_RelFiltrosFaixaEtaria.fGetDados: Boolean;
begin
  Result := true;
  ovRel_FaixaEtaria.oCDS_Relatorio.EmptyDataSet;
  vsSQL := ' SELECT PD.Pes_Nome, YEAR(FROM_DAYS(TO_DAYS(NOW())-TO_DAYS(PD.Pes_DataNascimento))) AS idade'+
           ' FROM Dependentes D'+
           ' INNER JOIN Pessoas PD ON D.Pes_Codigo = PD.Pes_Codigo'+
           ' INNER JOIN Lancamentos L ON L.Cli_Codigo = D.Cli_Codigo'+
           '     AND L.Dep_Codigo = D.Dep_Codigo'+
           ' WHERE 1=1';
  if ovDE_De.Date <> 0 then
    vsSQL := vsSQL + ' AND DATE(Lan_DataHoraEnt) >= '+f_DateToSQL(ovDE_De.Date);
  if ovDE_Ate.Date <> 0 then
    vsSQL := vsSQL + ' AND DATE(Lan_DataHoraEnt) <= '+f_DateToSQL(ovDE_Ate.Date);
  vsSQL := vsSQL + ' GROUP BY D.Dep_Codigo, D.Cli_Codigo'+
           ' ORDER BY Idade, Pes_Nome';
  ExecSQL(vsSQL, ovRel_FaixaEtaria.oCDS_Relatorio);
  Result := not ovRel_FaixaEtaria.oCDS_Relatorio.IsEmpty;
  ovRel_FaixaEtaria.oCDS_Relatorio.First;
end;

//******************************************************************************
function TovF_RelFiltrosFaixaEtaria.fValidaCampos: Boolean;
begin
  Result := true;
end;

//******************************************************************************
procedure TovF_RelFiltrosFaixaEtaria.pChamaImpressao;
begin
  ovRel_FaixaEtaria.oQR_Relatorio.Preview;
end;

//******************************************************************************
procedure TovF_RelFiltrosFaixaEtaria.pLimpaCampos;
begin

end;

//******************************************************************************
procedure TovF_RelFiltrosFaixaEtaria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ovRel_FaixaEtaria <> nil then
    FreeAndNil(ovRel_FaixaEtaria);

  Action := caFree;
  Release;
  ovF_RelFiltrosFaixaEtaria := nil;
end;

//******************************************************************************
procedure TovF_RelFiltrosFaixaEtaria.ovB_SairClick(Sender: TObject);
begin
  Close;
end;

//******************************************************************************
procedure TovF_RelFiltrosFaixaEtaria.FormCreate(Sender: TObject);
begin
  inherited;
  if ovRel_FaixaEtaria = nil then
    ovRel_FaixaEtaria := TovRel_FaixaEtaria.Create(Self);
end;

//******************************************************************************
end.
