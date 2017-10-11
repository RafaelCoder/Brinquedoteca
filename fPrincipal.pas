unit fPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, DBClient, dmMySQL, uGeral, fCadPessoas, fLanEntradaAluno,
  fLanSaidaAluno, fLanFechamento, fPsqLancamentos, fRelFiltrosFaixaEtaria;

type
  TovF_Principal = class(TForm)
    oMM_Menu: TMainMenu;
    Cadastros1: TMenuItem;
    Lanamentos1: TMenuItem;
    Alunos1: TMenuItem;
    Pesquisa1: TMenuItem;
    Entradadealuno1: TMenuItem;
    Saidadealuno1: TMenuItem;
    Alunospresentes1: TMenuItem;
    Relatrios1: TMenuItem;
    Fechamento1: TMenuItem;
    Lanamentos2: TMenuItem;
    Faixaetria1: TMenuItem;
    procedure Alunos1Click(Sender: TObject);
    procedure Entradadealuno1Click(Sender: TObject);
    procedure Alunospresentes1Click(Sender: TObject);
    procedure Saidadealuno1Click(Sender: TObject);
    procedure Fechamento1Click(Sender: TObject);
    procedure Lanamentos2Click(Sender: TObject);
    procedure Faixaetria1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ovF_Principal: TovF_Principal;
implementation

uses fListaAlunosPresentes;

{$R *.dfm}

//******************************************************************************
procedure TovF_Principal.Alunos1Click(Sender: TObject);
begin
  if ovF_CadPessoas = nil then
    ovF_CadPessoas := TovF_CadPessoas.Create(Self);
  ovF_CadPessoas.Show;
end;

//******************************************************************************
procedure TovF_Principal.Entradadealuno1Click(Sender: TObject);
begin
  if ovF_LanEntradaAluno = nil then
    ovF_LanEntradaAluno := TovF_LanEntradaAluno.Create(Self);
  ovF_LanEntradaAluno.Show;
end;

//******************************************************************************
procedure TovF_Principal.Alunospresentes1Click(Sender: TObject);
begin
  if ovF_ListaAlunosPresentes = nil then
    ovF_ListaAlunosPresentes := TovF_ListaAlunosPresentes.Create(Self);
  ovF_ListaAlunosPresentes.Show;
end;

//******************************************************************************
procedure TovF_Principal.Saidadealuno1Click(Sender: TObject);
begin
  if ovF_LanSaidaAluno = nil then
    ovF_LanSaidaAluno := TovF_LanSaidaAluno.Create(Self);
  ovF_LanSaidaAluno.Show;
end;

//******************************************************************************
procedure TovF_Principal.Fechamento1Click(Sender: TObject);
begin
  if ovF_LanFechamento = nil then
    ovF_LanFechamento := TovF_LanFechamento.Create(Self);
  ovF_LanFechamento.Show;
end;

//******************************************************************************
procedure TovF_Principal.Lanamentos2Click(Sender: TObject);
begin
  try
    if ovF_PsqLancamentos = nil then
      ovF_PsqLancamentos := TovF_PsqLancamentos.Create(Self);
    ovF_PsqLancamentos.ShowModal;
  finally
    FreeAndNil(ovF_PsqLancamentos);
  end;
end;

//******************************************************************************
procedure TovF_Principal.Faixaetria1Click(Sender: TObject);
begin
  if ovF_RelFiltrosFaixaEtaria = nil then
    ovF_RelFiltrosFaixaEtaria := TovF_RelFiltrosFaixaEtaria.Create(Self);
  ovF_RelFiltrosFaixaEtaria.Show;
end;

//******************************************************************************
end.
