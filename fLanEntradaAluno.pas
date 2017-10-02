unit fLanEntradaAluno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fCadPadrao, StdCtrls, ExtCtrls, fra_Dependentes, ComCtrls;

type
  TovF_LanEntradaAluno = class(TovF_CadPadrao)
    ovFra_Dependentes1: TovFra_Dependentes;
    DateTimePicker1: TDateTimePicker;
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
