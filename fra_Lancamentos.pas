unit fra_Lancamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Mask, ToolEdit, CurrEdit, ExtCtrls, fPsqLancamentos;

type
  TovFra_Lancamentos = class(TFrame)
    Label1: TLabel;
    ovCE_Codigo: TRxCalcEdit;
    ovP_Descricao: TPanel;
    procedure ovCE_CodigoButtonClick(Sender: TObject);
    procedure ovCE_CodigoExit(Sender: TObject);
  private
    { Private declarations }
  public
    procedure p_Limpar;
  end;

implementation

{$R *.dfm}

//******************************************************************************
procedure TovFra_Lancamentos.ovCE_CodigoButtonClick(Sender: TObject);
begin
  try
    if ovF_PsqLancamentos = nil then
      ovF_PsqLancamentos := TovF_PsqLancamentos.Create(Self);
    if ovF_PsqLancamentos.ShowModal = mrOK then
    begin
      ovCE_Codigo.Text := ovF_PsqLancamentos.oCDS_Pesquisa.FieldByname('Lan_Codigo').AsString;
      ovP_Descricao.Caption := ovF_PsqLancamentos.oCDS_Pesquisa.FieldByname('Dependente').AsString+'/'+
                               ovF_PsqLancamentos.oCDS_Pesquisa.FieldByname('Responsavel').AsString;
    end else
    begin
      ovCE_Codigo.Text := '0';
      ovP_Descricao.Caption := '';
    end;
  finally
    FreeAndNil(ovF_PsqLancamentos);
    Abort;
  end;
end;

//******************************************************************************
procedure TovFra_Lancamentos.ovCE_CodigoExit(Sender: TObject);
begin
  try
    if ovF_PsqLancamentos = nil then
      ovF_PsqLancamentos := TovF_PsqLancamentos.Create(Self);
    if ovF_PsqLancamentos.fConsulta([ovCE_Codigo.Text]) then
    begin
      ovCE_Codigo.Text := ovF_PsqLancamentos.oCDS_Pesquisa.FieldByname('Lan_Codigo').AsString;
      ovP_Descricao.Caption := ovF_PsqLancamentos.oCDS_Pesquisa.FieldByname('Dependente').AsString+'/'+
                               ovF_PsqLancamentos.oCDS_Pesquisa.FieldByname('Responsavel').AsString;
    end else
    begin
      ovCE_Codigo.Text := '0';
      ovP_Descricao.Caption := '';
    end;
  finally
    FreeAndNil(ovF_PsqLancamentos);
    Abort;
  end;
end;

//******************************************************************************
procedure TovFra_Lancamentos.p_Limpar;
begin
  ovCE_Codigo.Clear;
  ovP_Descricao.Caption := '';
end;

//******************************************************************************
end.
