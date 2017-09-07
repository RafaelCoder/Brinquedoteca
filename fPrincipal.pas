unit fPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, fCadPessoas, DB, DBClient, dmMySQL, uGeral;

type
  TovF_Principal = class(TForm)
    oMM_Menu: TMainMenu;
    Cadastros1: TMenuItem;
    Lanamentos1: TMenuItem;
    Alunos1: TMenuItem;
    procedure Alunos1Click(Sender: TObject);
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
end.
