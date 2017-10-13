unit fListaAlunosPresentes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXDBCtrl, ExtCtrls, DB, DBClient, StdCtrls, dmMySQL, uGeral;

type
  TovF_ListaAlunosPresentes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    RxDBGrid1: TRxDBGrid;
    oCDS_Alunos: TClientDataSet;
    oDS_Alunos: TDataSource;
    oCDS_AlunosLan_Codigo: TIntegerField;
    oCDS_AlunosDep_Codigo: TIntegerField;
    oCDS_AlunosCli_Codigo: TIntegerField;
    oCDS_AlunosDependente: TStringField;
    oCDS_AlunosResponsavel: TStringField;
    oCDS_AlunosLan_DataHoraEnt: TDateTimeField;
    ovB_Atualizar: TButton;
    ovB_Sair: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ovB_AtualizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ovB_SairClick(Sender: TObject);
  private
    procedure pAtualiza;
  public
    { Public declarations }
  end;

var
  ovF_ListaAlunosPresentes: TovF_ListaAlunosPresentes;

implementation

{$R *.dfm}

//******************************************************************************
procedure TovF_ListaAlunosPresentes.FormCreate(Sender: TObject);
begin
  oCDS_Alunos.CreateDataSet;
  pAtualiza;
end;

//******************************************************************************
procedure TovF_ListaAlunosPresentes.pAtualiza;
begin
  vsSQL := ' SELECT L.Lan_Codigo, D.Dep_Codigo, D.Cli_Codigo, PD.Pes_Nome AS Dependente, PC.Pes_Nome AS Responsavel, TIME(Lan_DataHoraEnt) as Lan_DataHoraEnt'+
           ' FROM Lancamentos L'+
           ' INNER JOIN Dependentes D ON D.Dep_Codigo = L.Dep_Codigo'+
           '     AND D.Cli_Codigo = L.Cli_Codigo'+
           ' INNER JOIN Pessoas PD ON PD.Pes_Codigo = D.Pes_Codigo'+
           ' INNER JOIN Clientes C ON C.Cli_Codigo = D.Cli_Codigo'+
           ' INNER JOIN Pessoas PC ON PC.Pes_Codigo = C.Pes_Codigo'+
           ' WHERE Lan_DataHoraSai IS NULL'+
           ' ORDER BY Dependente, Lan_DataHoraEnt';
  ExecSQL(vsSQL, oCDS_Alunos);
  oCDS_Alunos.First;
end;

//******************************************************************************
procedure TovF_ListaAlunosPresentes.ovB_AtualizarClick(Sender: TObject);
begin
  pAtualiza;
end;

//******************************************************************************
procedure TovF_ListaAlunosPresentes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Release;
  ovF_ListaAlunosPresentes := nil;
end;

//******************************************************************************
procedure TovF_ListaAlunosPresentes.ovB_SairClick(Sender: TObject);
begin
  Close;
end;

//******************************************************************************
end.
