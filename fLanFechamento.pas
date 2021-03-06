unit fLanFechamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fCadPadrao, StdCtrls, ExtCtrls, fra_Lancamentos, ComCtrls, Mask,
  ToolEdit, CurrEdit, dmMySQL, uGeral, DB, DBClient;

type
  TovF_LanFechamento = class(TovF_CadPadrao)
    ovFra_Lancamentos1: TovFra_Lancamentos;
    GroupBox1: TGroupBox;
    ovDTP_HoraEntrada: TDateTimePicker;
    ovDTP_HoraSaida: TDateTimePicker;
    ovDTP_TotalHoras: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    ovCE_VlrHora: TRxCalcEdit;
    ovCE_VlrTotal: TRxCalcEdit;
    ovCB_Fechado: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ovFra_Lancamentos1Exit(Sender: TObject);
    procedure ovCE_VlrHoraChange(Sender: TObject);
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
  Result := True;

  if ovFra_Lancamentos1.ovCE_Codigo.Value <= 0 then
  begin
    Result := false;
    p_MsgAviso('Informar um lan�amento para fechamento.');
    ovFra_Lancamentos1.ovCE_Codigo.SetFocus;
    Exit;
  end;

  if ovCB_Fechado.Checked then
  begin
    Result := false;
    p_MsgAviso('Este lan�amento j� est� fechado.');
    pLimparCampos;
    pNovo;
    Exit;
  end;

  if ovCE_VlrTotal.Value <= 0 then
  begin
    Result := false;
    p_MsgAviso('Informar o valor total do fechamento.');
    ovCE_VlrTotal.SetFocus;
    Exit;
  end;
  
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
var
  Lan_Codigo, Fec_Codigo : String;
begin
  try
    Lan_Codigo := ovFra_Lancamentos1.ovCE_Codigo.Text;
    DBBeginTrans;
    vsSQL := ' UPDATE Lancamentos SET Lan_Fechado = "S"'+
             ' , Lan_VlrHora = '+VirgulaPorPonto(FormatFloat('0.00', ovCE_VlrHora.Value))+
             ' , Lan_VlrTotal = '+VirgulaPorPonto(FormatFloat('0.00', ovCE_VlrTotal.Value))+
             ' WHERE Lan_Codigo = '+Lan_Codigo;
    ExecSQL(vsSQL);

    Fec_Codigo := IntToStr(f_GetProxCodigo('Fechamentos', 'Fec_Codigo', ''));

    vsSQL := ' INSERT INTO Fechamentos SET Fec_Codigo = '+Fec_Codigo+
             ' , Lan_Codigo = '+Lan_Codigo+
             ' , Fec_VlrHora = '+VirgulaPorPonto(FormatFloat('0.00', ovCE_VlrHora.Value))+
             ' , Fec_VlrDesc = 0'+
             ' , Fec_VlrTotal = '+VirgulaPorPonto(FormatFloat('0.00', ovCE_VlrTotal.Value));
    ExecSQL(vsSQL);
    DBCommit;
  except
    on E : Exception do
    begin
      DBRollBack;
      p_MsgErro(E.Message);
    end;
  end;
end;

//******************************************************************************
procedure TovF_LanFechamento.pLimparCampos;
begin
  ovFra_Lancamentos1.p_Limpar;
  ovCB_Fechado.Checked := false;
  ovDTP_HoraEntrada.Time := 0;
  ovDTP_HoraSaida.Time := 0;
  ovDTP_TotalHoras.DateTime := ovDTP_HoraSaida.DateTime - ovDTP_HoraEntrada.DateTime;
  ovCE_VlrHora.Value := 0;
  ovCE_VlrTotal.Value := 0;
end;

//******************************************************************************
procedure TovF_LanFechamento.pNovo;
begin
  ovFra_Lancamentos1.ovCE_Codigo.SetFocus;
end;

//******************************************************************************
procedure TovF_LanFechamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Release;
  ovF_LanFechamento := nil;
end;

//******************************************************************************
procedure TovF_LanFechamento.ovFra_Lancamentos1Exit(Sender: TObject);
var
  oCDS : TClientDataSet;
begin
  oCDS := TClientDataSet.Create(Self);
  try
    if ovFra_Lancamentos1.ovCE_Codigo.Value = 0 then
    begin
      pLimparCampos;
      Exit;
    end;
    vsSQL := 'SELECT * FROM Lancamentos L WHERE L.Lan_Codigo = '+ovFra_Lancamentos1.ovCE_Codigo.Text;
    ExecSQL(vsSQL, oCDS);
    if oCDS.IsEmpty then
    begin
      pLimparCampos;
      Exit;
    end;
    ovCB_Fechado.Checked := oCDS.FieldByName('Lan_Fechado').AsString = 'S';
    ovDTP_HoraEntrada.DateTime := oCDS.FieldByName('Lan_DataHoraEnt').AsDateTime;
    ovDTP_HoraSaida.DateTime := oCDS.FieldByName('Lan_DataHoraSai').AsDateTime;
    ovDTP_TotalHoras.DateTime := ovDTP_HoraSaida.DateTime - ovDTP_HoraEntrada.DateTime;
  finally
    FreeAndNil(oCDS);
  end;
end;

//******************************************************************************
procedure TovF_LanFechamento.ovCE_VlrHoraChange(Sender: TObject);
var
  myHour, myMin, mySec, myMilli : Word;
  vfVlrTotal : Double;
begin
  DecodeTime(ovDTP_TotalHoras.DateTime, myHour, myMin, mySec, myMilli);
  vfVlrTotal := (((myHour * 60) + myMin) / 60) * ovCE_VlrHora.Value;
  ovCE_VlrTotal.Value := vfVlrTotal;
end;

//******************************************************************************
end.
