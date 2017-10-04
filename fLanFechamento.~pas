unit fLanFechamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fCadPadrao, StdCtrls, ExtCtrls, fra_Lancamentos, ComCtrls, Mask,
  ToolEdit, CurrEdit;

type
  TovF_LanFechamento = class(TovF_CadPadrao)
    ovFra_Lancamentos1: TovFra_Lancamentos;
    GroupBox1: TGroupBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    RxCalcEdit1: TRxCalcEdit;
    RxCalcEdit2: TRxCalcEdit;
    CheckBox1: TCheckBox;
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
