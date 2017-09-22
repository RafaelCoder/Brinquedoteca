unit fPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, DBClient, dmMySQL, uGeral, fCadPessoas, fLanEntradaAluno;

type
  TovF_Principal = class(TForm)
    oMM_Menu: TMainMenu;
    Cadastros1: TMenuItem;
    Lanamentos1: TMenuItem;
    Alunos1: TMenuItem;
    Pesquisa1: TMenuItem;
    Entradadealuno1: TMenuItem;
    Saidadealuno1: TMenuItem;
    procedure Alunos1Click(Sender: TObject);
    procedure Entradadealuno1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ovF_Principal: TovF_Principal;
implementation

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
end.
