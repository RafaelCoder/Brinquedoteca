unit fCadPessoas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fCadPadrao, StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, uGeral,
  dmMySQL, ComCtrls, Grids, DBGrids, DB, DBClient,
  fPsqPessoas;

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
    procedure ovB_PesquisarClick(Sender: TObject);
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
  ovF_PsqPessoas1 : TovF_PsqPessoas;

implementation

{$R *.dfm}

//******************************************************************************
procedure TovF_CadPessoas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ovF_PsqPessoas1 <> nil then
    FreeAndNil(ovF_PsqPessoas1);

  Action := caFree;
  Release;
  ovF_CadPessoas := nil;
end;

//******************************************************************************
procedure TovF_CadPessoas.FormCreate(Sender: TObject);
begin
  inherited;
  oCDS_Dependentes.CreateDataSet;
  ovF_PsqPessoas1 := TovF_PsqPessoas.Create(Self);
end;

//******************************************************************************
function TovF_CadPessoas.fValidaCampos: Boolean;
begin
  Result := true;
  if ovCE_Codigo.Value <= 0 then
  begin
    p_MsgAviso('Código é obrigatório.');
    ovPC_Container.TabIndex := 0;
    ovCE_Codigo.SetFocus;
    Result := false;
    Exit;
  end;

  if Trim(ovE_Nome.Text) = '' then
  begin
    p_MsgAviso('Nome é obrigatório.');
    ovPC_Container.TabIndex := 0;
    ovE_Nome.SetFocus;
    Result := false;
    Exit;
  end;

  
end;

//******************************************************************************
procedure TovF_CadPessoas.pCarregaDados;
begin
  ovCE_Codigo.Text := ovF_PsqPessoas1.oCDS_Pesquisa.FieldByname('Pes_Codigo').AsString;
  ovE_Nome.Text    := ovF_PsqPessoas1.oCDS_Pesquisa.FieldByname('Pes_Nome').AsString;
  ovME_CPF.Text    := ovF_PsqPessoas1.oCDS_Pesquisa.FieldByname('Pes_CPFCNPJ').AsString;
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
  ovPC_Container.TabIndex := 0;
  ovCE_Codigo.Value := f_GetProxCodigo('Clientes', 'Cli_Codigo', '');
  vbEditando := False;
  ovE_Nome.SetFocus;
end;

//******************************************************************************
procedure TovF_CadPessoas.pLimparCampos;
begin
  oCDS_Dependentes.EmptyDataSet;
  ovCE_Codigo.Clear;
  ovE_Nome.Clear;
  ovCE_DDDFone.Clear;
  ovCE_Fone.Clear;
  ovCE_DDDCel.Clear;
  ovCE_Celular.Clear;
  ovME_CPF.Clear;
end;

//******************************************************************************
procedure TovF_CadPessoas.ovB_PesquisarClick(Sender: TObject);
begin
  inherited;
  ovF_PsqPessoas1 := TovF_PsqPessoas.Create(Self);
  if ovF_PsqPessoas1.ShowModal <> mrOK then
    Exit;

  if ovF_PsqPessoas1.oCDS_Pesquisa.IsEmpty then
    Exit;

  if ovF_PsqPessoas1.oCDS_Pesquisa.RecNo < 0 then
    Exit;

  pCarregaDados;
end;

//******************************************************************************
end.
