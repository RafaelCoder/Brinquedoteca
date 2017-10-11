unit fRelFiltrosPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, uGeral;

type
  TovF_RelFiltrosPadrao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ovP_Imprimir: TButton;
    ovB_Cancelar: TButton;
    ovB_Sair: TButton;
    procedure ovP_ImprimirClick(Sender: TObject);
    procedure ovB_CancelarClick(Sender: TObject);
  private
    { Private declarations }
  protected
    function fGetDados:Boolean; virtual; abstract;
    function fValidaCampos:Boolean; virtual; abstract;
    procedure pChamaImpressao; virtual; abstract;
    procedure pLimpaCampos; virtual; abstract;
  public
    { Public declarations }
  end;

var
  ovF_RelFiltrosPadrao: TovF_RelFiltrosPadrao;

implementation

{$R *.dfm}

//******************************************************************************
procedure TovF_RelFiltrosPadrao.ovP_ImprimirClick(Sender: TObject);
begin
  if not fValidaCampos then
    Exit;

  if fGetDados then
    pChamaImpressao
  else
    p_MsgAviso('Não há dados para gerar o relatório.');
end;

//******************************************************************************
procedure TovF_RelFiltrosPadrao.ovB_CancelarClick(Sender: TObject);
begin
  pLimpaCampos;
end;

//******************************************************************************
end.
