unit fLanEntradaAluno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fCadPadrao, StdCtrls, ExtCtrls, fra_Dependentes, ComCtrls,
  RXClock, dmMySQL, uGeral;

type
  TovF_LanEntradaAluno = class(TovF_CadPadrao)
    ovFra_Dependentes1: TovFra_Dependentes;
    ovC_Hora: TRxClock;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  protected
    function fValidaCampos:Boolean; override;
    procedure pGravar; override;
    procedure pNovo; override;
    procedure pLimparCampos; override;
    procedure pCarregaDados; override;
    procedure pExcluir; override;
  public
    { Public declarations }
  end;

var
  ovF_LanEntradaAluno: TovF_LanEntradaAluno;

implementation

{$R *.dfm}

{ TovF_LanEntradaAluno }

//******************************************************************************
function TovF_LanEntradaAluno.fValidaCampos: Boolean;
begin
  Result := True;
  if Trim(ovFra_Dependentes1.ovCE_DepCodigo.Text) = '' then
  begin
    p_MsgAviso('Necessário informar um aluno');
    Result :=False
  end;
end;

//******************************************************************************
procedure TovF_LanEntradaAluno.pCarregaDados;
begin

end;

//******************************************************************************
procedure TovF_LanEntradaAluno.pExcluir;
begin

end;

//******************************************************************************
procedure TovF_LanEntradaAluno.pGravar;
begin
  try
    DBBeginTrans;
    DBCommit;
  except
    on E : Exception do
    begin
      DBRollBack;
      p_MsgAviso(E.Message);
    end;
  end;
end;

//******************************************************************************
procedure TovF_LanEntradaAluno.pLimparCampos;
begin

end;

//******************************************************************************
procedure TovF_LanEntradaAluno.pNovo;
begin

end;

//******************************************************************************
procedure TovF_LanEntradaAluno.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  Release;
  ovF_LanEntradaAluno := nil;
end;

//******************************************************************************
end.
