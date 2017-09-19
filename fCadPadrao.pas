unit fCadPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TovF_CadPadrao = class(TForm)
    pnl1: TPanel;
    ovP_Container: TPanel;
    ovB_Confirmar: TButton;
    ovB_Cancelar: TButton;
    ovB_Pesquisar: TButton;
    ovB_Sair: TButton;
    ovB_Excluir: TButton;
    procedure ovB_SairClick(Sender: TObject);
    procedure ovB_ConfirmarClick(Sender: TObject);
    procedure ovB_CancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ovB_ExcluirClick(Sender: TObject);
  private
    { Private declarations }
  protected
    function fValidaCampos:Boolean; virtual; abstract;
    procedure pGravar; virtual; abstract;
    procedure pNovo; virtual; abstract;
    procedure pLimparCampos; virtual; abstract;
    procedure pCarregaDados; virtual; abstract;
    procedure pExcluir; virtual; abstract;
  public

  end;

var
  ovF_CadPadrao: TovF_CadPadrao;

implementation

{$R *.dfm}

//******************************************************************************
procedure TovF_CadPadrao.ovB_SairClick(Sender: TObject);
begin
  Close;
end;

//******************************************************************************
procedure TovF_CadPadrao.ovB_ConfirmarClick(Sender: TObject);
begin
  if fValidaCampos then
  begin
    pGravar;
    pLimparCampos;
    pNovo;
  end;
end;

//******************************************************************************
procedure TovF_CadPadrao.ovB_CancelarClick(Sender: TObject);
begin
  pLimparCampos;
  pNovo;
end;

//******************************************************************************
procedure TovF_CadPadrao.FormShow(Sender: TObject);
begin
  pNovo;
end;

//******************************************************************************
procedure TovF_CadPadrao.ovB_ExcluirClick(Sender: TObject);
begin
  pExcluir;
  pLimparCampos;
  pNovo;
end;

//******************************************************************************
end.
