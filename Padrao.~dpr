program Padrao;

uses
  Forms,
  fPrincipal in 'fPrincipal.pas' {ovF_Principal},
  dmMySQL in 'dmMySQL.pas' {odm_MySQL: TDataModule},
  fCadPadrao in 'fCadPadrao.pas' {ovF_CadPadrao},
  fCadPessoas in 'fCadPessoas.pas' {ovF_CadPessoas},
  uGeral in 'uGeral.pas',
  fPsqPadrao in 'fPsqPadrao.pas' {ovF_PsqPadrao},
  fPsqPessoas in 'fPsqPessoas.pas' {ovF_PsqPessoas},
  fLanEntradaAluno in 'fLanEntradaAluno.pas' {ovF_LanEntradaAluno},
  fListaAlunosPresentes in 'fListaAlunosPresentes.pas' {ovF_ListaAlunosPresentes},
  fra_Dependentes in 'fra_Dependentes.pas' {ovFra_Dependentes: TFrame},
  fPsqDependentes in 'fPsqDependentes.pas' {ovF_PsqDependentes},
  fLanSaidaAluno in 'fLanSaidaAluno.pas' {ovF_LanSaidaAluno},
  fLanFechamento in 'fLanFechamento.pas' {ovF_LanFechamento};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TovF_Principal, ovF_Principal);
  Application.CreateForm(Todm_MySQL, odm_MySQL);
  Application.Run;
end.
