unit fCadPessoas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fCadPadrao, StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, uGeral,
  dmMySQL;

type
  TovF_CadPessoas = class(TovF_CadPadrao)
    ovCE_Codigo: TRxCalcEdit;
    Label1: TLabel;
    ovE_Nome: TEdit;
    Label2: TLabel;
    ovP_Aluno: TPanel;
    Label3: TLabel;
    ovE_Responsavel: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Label4: TLabel;
    ovCE_DDDFone: TRxCalcEdit;
    ovCE_Fone: TRxCalcEdit;
    Label5: TLabel;
    ovCE_DDDCel: TRxCalcEdit;
    ovCE_Celular: TRxCalcEdit;
    Label6: TLabel;
    ovDE_Nascimento: TDateEdit;
    Label7: TLabel;
    ovME_CPF: TMaskEdit;
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

  if Trim(ovE_Responsavel.Text) = '' then
  begin
    p_MsgAviso('Responsável é obrigatório.');
    ovE_Responsavel.SetFocus;
    Result := false;
    Exit;
  end;

  if ovDE_Nascimento.Date = 0 then
  begin
    p_MsgAviso('Data de nascimento é obrigatória.');
    ovDE_Nascimento.SetFocus;
    Result := false;
    Exit;
  end;

  if Trim(ovE_Responsavel.Text) = '' then
  begin
    p_MsgAviso('Responsável é obrigatório.');
    ovE_Responsavel.SetFocus;
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
    vsSQL := 'INSERT INTO Pessoas SET Pes_Codigo = '+vsPesCodigo+
             ' , Pes_Nome = '+f_StrToSQL(ovE_Nome.Text)+
             ' , Pes_CPFCNPJ = '+f_StrToSQL(ovME_CPF.Text)+
             ' , Pes_DDDCel = '+f_StrToSQL(ovCE_DDDCel.Text)+
             ' , Pes_Celular = '+f_StrToSQL(ovCE_DDDCel.Text)+
             ' , Pes_DDDFone = '+f_StrToSQL(ovCE_DDDCel.Text)+
             ' , Pes_Fone = '+f_StrToSQL(ovCE_DDDCel.Text)+
             ' , Pes_DataNascimento = '+f_StrToSQL(ovCE_DDDCel.Text)+
             ' , Pes_NumEndereco = '+f_StrToSQL(ovCE_DDDCel.Text)+
             ' , Pes_Endereco = '+f_StrToSQL(ovCE_DDDCel.Text);
    showmessage(vsSQL);

    vsAluCodigo := IntToStr(f_GetProxCodigo('Alunos', 'Alu_Codigo', 'Pes_Codigo = '+vsPesCodigo));
    vsSQL := 'INSERT INTO Alunos SET Pes_Codigo = '+vsPesCodigo+
             ' , Alu_Codigo = '+vsAluCodigo+
             ' , Alu_Responsavel = '+f_StrToSQL(ovE_Responsavel.Text);
    showmessage(vsSQL);
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
