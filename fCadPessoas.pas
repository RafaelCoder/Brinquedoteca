unit fCadPessoas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fCadPadrao, StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, uGeral,
  dmMySQL, ComCtrls, Grids, DBGrids, DB, DBClient;

type
  TovF_CadPessoas = class(TovF_CadPadrao)
    ovCE_Codigo: TRxCalcEdit;
    Label1: TLabel;
    ovE_Nome: TEdit;
    Label2: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Label4: TLabel;
    ovCE_DDDFone: TRxCalcEdit;
    ovCE_Fone: TRxCalcEdit;
    Label5: TLabel;
    ovCE_DDDCel: TRxCalcEdit;
    ovCE_Celular: TRxCalcEdit;
    Label7: TLabel;
    ovME_CPF: TMaskEdit;
    ovPC_Container: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    ovCE_DepCodigo: TRxCalcEdit;
    Label3: TLabel;
    ovE_DepNome: TEdit;
    Label6: TLabel;
    ovDE_DepDataNascimento: TDateEdit;
    Label8: TLabel;
    oCDS_Dependentes: TClientDataSet;
    oDS_Dependentes: TDataSource;
    oCDS_DependentesCodigo: TIntegerField;
    oCDS_DependentesNome: TStringField;
    oCDS_DependentesDataNascimento: TDateField;
    ovB_DepAdicionar: TButton;
    ovB_DepRemover: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    vbEditando : Boolean;
  protected
    function fValidaCampos:Boolean; override;
    procedure pGravar; override;
    procedure pNovo; override;
    procedure pLimparCampos; override;
    procedure pCarregaDados; override;
  public

  end;

var
  ovF_CadPessoas: TovF_CadPessoas;

implementation

{$R *.dfm}

//******************************************************************************
procedure TovF_CadPessoas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Release;
  ovF_CadPessoas := nil;
end;

//******************************************************************************
procedure TovF_CadPessoas.FormCreate(Sender: TObject);
begin
  inherited;
  ovPC_Container.TabIndex := 0;  
end;

//******************************************************************************
function TovF_CadPessoas.fValidaCampos: Boolean;
begin
  Result := true;
  if ovCE_Codigo.Value <= 0 then
  begin
    p_MsgAviso('Código é obrigatório.');
    ovCE_Codigo.SetFocus;
    Result := false;
    Exit;
  end;

  if Trim(ovE_Nome.Text) = '' then
  begin
    p_MsgAviso('Nome é obrigatório.');
    ovE_Nome.SetFocus;
    Result := false;
    Exit;
  end;

  
end;

//******************************************************************************
procedure TovF_CadPessoas.pCarregaDados;
begin


end;

//******************************************************************************
procedure TovF_CadPessoas.pGravar;
var
  vsPesCodigo, vsAluCodigo : string;
begin
  try
    DBBeginTrans;
    vsPesCodigo := ovCE_Codigo.Text;
    
    DBCommit;
  except
    on E : Exception do
    begin
      p_MsgErro(E.Message);
      DBRollBack;
    end;
  end;
end;

//******************************************************************************
procedure TovF_CadPessoas.pNovo;
begin
  ovCE_Codigo.Value := f_GetProxCodigo('Pessoas', 'Pes_Codigo', '');
  vbEditando := False;
end;

//******************************************************************************
procedure TovF_CadPessoas.pLimparCampos;
begin

end;

//******************************************************************************
end.
