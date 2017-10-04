unit fLanFechamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fCadPadrao, StdCtrls, ExtCtrls;

type
  TovF_LanFechamento = class(TovF_CadPadrao)
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
  ovF_LanFechamento: TovF_LanFechamento;

implementation

{$R *.dfm}

{ TovF_LanFechamento }

//******************************************************************************
function TovF_LanFechamento.fValidaCampos: Boolean;
begin
  Result := False;
end;

//******************************************************************************
procedure TovF_LanFechamento.pCarregaDados;
begin
  inherited;

end;

//******************************************************************************
procedure TovF_LanFechamento.pExcluir;
begin
  inherited;

end;

//******************************************************************************
procedure TovF_LanFechamento.pGravar;
begin
  inherited;

end;

//******************************************************************************
procedure TovF_LanFechamento.pLimparCampos;
begin
  inherited;

end;

//******************************************************************************
procedure TovF_LanFechamento.pNovo;
begin
  inherited;

end;

//******************************************************************************
procedure TovF_LanFechamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Release;
  ovF_LanFechamento := nil;
end;

//******************************************************************************
end.
