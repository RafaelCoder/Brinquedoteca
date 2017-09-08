program Padrao;

uses
  Forms,
  fPrincipal in 'fPrincipal.pas' {ovF_Principal},
  dmMySQL in 'dmMySQL.pas' {odm_MySQL: TDataModule},
  fCadPadrao in 'fCadPadrao.pas' {ovF_CadPadrao},
  fCadPessoas in 'fCadPessoas.pas' {ovF_CadPessoas},
  uGeral in 'uGeral.pas',
  uControllerPessoas in 'uControllerPessoas.pas' {ControllerPessoas: TDataModule},
  uDAOPessoas in 'uDAOPessoas.pas' {DAOPessoas: TDataModule},
  fPsqPadrao in 'fPsqPadrao.pas' {ovF_PsqPadrao};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TovF_Principal, ovF_Principal);
  Application.CreateForm(Todm_MySQL, odm_MySQL);
  Application.Run;
end.
