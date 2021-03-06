unit fLanSaidaAluno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fCadPadrao, StdCtrls, ExtCtrls, fra_Dependentes, RXClock, DB,
  DBClient, dmMySQL, uGeral, fLanFechamento, ComCtrls;

type
  TovF_LanSaidaAluno = class(TovF_CadPadrao)
    ovFra_Dependentes1: TovFra_Dependentes;
    ovDTP_HoraSaida: TDateTimePicker;
    Label1: TLabel;
    ovB_Atualizar: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ovB_AtualizarClick(Sender: TObject);
    procedure ovB_ConfirmarClick(Sender: TObject);
  private
    oCDS_Aluno : TClientDataSet;
    vbFazerFhecamento : Boolean;
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
  ovF_LanSaidaAluno: TovF_LanSaidaAluno;

implementation

{$R *.dfm}

{ TovF_LanSaidaAluno }

//******************************************************************************
function TovF_LanSaidaAluno.fValidaCampos: Boolean;
var
  oCDS : TClientDataSet;
begin
  oCDS := TClientDataSet.Create(self);
  Result := True;
  try
    if Trim(ovFra_Dependentes1.ovCE_CliCodigo.Text) = '' then
    begin
      p_MsgAviso('Necess�rio informar um respons�vel.');
      Result := False;
      ovFra_Dependentes1.ovCE_CliCodigo.SetFocus;
      Exit;
    end;

    if Trim(ovFra_Dependentes1.ovCE_DepCodigo.Text) = '' then
    begin
      p_MsgAviso('Necess�rio informar um dependente.');
      Result := False;
      ovFra_Dependentes1.ovCE_DepCodigo.SetFocus;
      Exit;
    end;

    vsSQL := ' SELECT Lan_Codigo FROM Lancamentos WHERE Dep_Codigo = '+ovFra_Dependentes1.ovCE_DepCodigo.Text+
             ' AND Cli_Codigo = '+ovFra_Dependentes1.ovCE_CliCodigo.Text+
             ' AND Lan_DataHoraSai IS NULL';
    ExecSQL(vsSQL, oCDS_Aluno);
    if oCDS_Aluno.IsEmpty then
    begin
      p_MsgAviso(ovFra_Dependentes1.ovP_DepDescricao.Caption+' n�o est� presente.');
      Result := false;
      exit;
    end;
  finally
    FreeAndNil(oCDS);
  end;
end;

//******************************************************************************
procedure TovF_LanSaidaAluno.pCarregaDados;
begin
  inherited;

end;

//******************************************************************************
procedure TovF_LanSaidaAluno.pExcluir;
begin
  inherited;

end;

//******************************************************************************
procedure TovF_LanSaidaAluno.pGravar;
var
  Lan_Codigo : String;
begin
  vbFazerFhecamento := false;
  try
    Lan_Codigo := oCDS_Aluno.FieldByName('Lan_Codigo').AsString;
    DBBeginTrans;
    vsSQL := ' UPDATE Lancamentos SET Lan_DataHoraSai = '+f_StrToSQL(FormatDateTime('yyyy-mm-dd', Date)+' '+TimeToStr(ovDTP_HoraSaida.Time))+
             ' WHERE Lan_Codigo = '+Lan_Codigo;
    ExecSQL(vsSQL);
    DBCommit;
    vbFazerFhecamento := true;
  except
    on E : Exception do
    begin
      DBRollBack;
      p_MsgAviso(E.Message);
    end;
  end;
end;

//******************************************************************************
procedure TovF_LanSaidaAluno.pLimparCampos;
begin
  inherited;
  ovFra_Dependentes1.p_Limpar;
  ovDTP_HoraSaida.DateTime := Now();
end;

//******************************************************************************
procedure TovF_LanSaidaAluno.pNovo;
begin
  inherited;
  ovFra_Dependentes1.ovCE_CliCodigo.SetFocus;
end;

//******************************************************************************
procedure TovF_LanSaidaAluno.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if oCDS_Aluno <> nil then
    FreeAndNil(oCDS_Aluno);

  Action := caFree;
  Release;
  ovF_LanSaidaAluno := nil;
end;

//******************************************************************************
procedure TovF_LanSaidaAluno.FormCreate(Sender: TObject);
begin
  inherited;
  oCDS_Aluno := TClientDataSet.Create(Self);
  ovDTP_HoraSaida.DateTime := Now();  
end;

//******************************************************************************
procedure TovF_LanSaidaAluno.ovB_AtualizarClick(Sender: TObject);
begin
  ovDTP_HoraSaida.DateTime := Now();
end;

//******************************************************************************
procedure TovF_LanSaidaAluno.ovB_ConfirmarClick(Sender: TObject);
var Lan_Codigo : String;
begin
  // caputar o c�digo do movimento para fazer o fechamento depois
  Lan_Codigo := '0';
  inherited;
  if not vbFazerFhecamento then
    Exit;

  if not f_MsgConfirma('Deseja realizar o fechamento?') then
    Exit;

  if ovF_LanFechamento <> nil then
  begin
    ovF_LanFechamento.Close;
    FreeAndNil(ovF_LanFechamento);
  end;
  ovF_LanFechamento := TovF_LanFechamento.Create(Self);
  ovF_LanFechamento.Show;
end;

//******************************************************************************
end.
