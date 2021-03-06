unit fLanEntradaAluno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fCadPadrao, StdCtrls, ExtCtrls, fra_Dependentes, ComCtrls,
  RXClock, dmMySQL, uGeral, DB, DBClient;

type
  TovF_LanEntradaAluno = class(TovF_CadPadrao)
    ovFra_Dependentes1: TovFra_Dependentes;
    ovDTP_HoraEntrada: TDateTimePicker;
    Label1: TLabel;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ovB_CancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

    vsSQL := ' SELECT * FROM Lancamentos WHERE Dep_Codigo = '+ovFra_Dependentes1.ovCE_DepCodigo.Text+
             ' AND Cli_Codigo = '+ovFra_Dependentes1.ovCE_CliCodigo.Text+
             ' AND Lan_DataHoraSai IS NULL';
    ExecSQL(vsSQL, oCDS);
    if not oCDS.IsEmpty then
    begin
      p_MsgAviso(ovFra_Dependentes1.ovP_DepDescricao.Caption+' j� est� lan�ado.');
      Result := false;
      exit;
    end;
  finally
    FreeAndNil(oCDS);
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
var
  Lan_Codigo : String;
begin
  try
    DBBeginTrans;
    Lan_Codigo := IntToStr(f_GetProxCodigo('Lancamentos', 'Lan_Codigo', ''));
    vsSQL := ' INSERT INTO Lancamentos SET Lan_Codigo = '+Lan_Codigo+
             ' , Cli_Codigo = '+ f_StrToSQL(ovFra_Dependentes1.ovCE_CliCodigo.Text)+
             ' , Dep_Codigo = '+ f_StrToSQL(ovFra_Dependentes1.ovCE_DepCodigo.Text)+
             ' , Lan_DataHoraEnt = '+f_StrToSQL(FormatDateTime('yyyy-mm-dd', Date)+' '+TimeToStr(ovDTP_HoraEntrada.Time))+
             ' , Lan_Fechado = "N"';
    ExecSQL(vsSQL);
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
  ovFra_Dependentes1.p_Limpar;
  ovDTP_HoraEntrada.DateTime := Now();
end;

//******************************************************************************
procedure TovF_LanEntradaAluno.pNovo;
begin
  ovFra_Dependentes1.ovCE_CliCodigo.SetFocus;
end;

//******************************************************************************
procedure TovF_LanEntradaAluno.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Release;
  ovF_LanEntradaAluno := nil;
end;

//******************************************************************************
procedure TovF_LanEntradaAluno.ovB_CancelarClick(Sender: TObject);
begin
  inherited;
  pNovo;
end;

//******************************************************************************
procedure TovF_LanEntradaAluno.FormCreate(Sender: TObject);
begin
  inherited;
  ovDTP_HoraEntrada.DateTime := Now();
end;

//******************************************************************************
procedure TovF_LanEntradaAluno.Button1Click(Sender: TObject);
begin
  ovDTP_HoraEntrada.DateTime := Now();
end;

//******************************************************************************
end.
