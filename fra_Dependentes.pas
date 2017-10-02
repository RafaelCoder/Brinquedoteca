unit fra_Dependentes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Mask, ToolEdit, CurrEdit, ExtCtrls, fPsqPessoas;

type
  TovFra_Dependentes = class(TFrame)
    ovCE_CliCodigo: TRxCalcEdit;
    ovP_CliDescricao: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    ovCE_DepCodigo: TRxCalcEdit;
    ovP_DepDescricao: TPanel;
    procedure ovCE_CliCodigoButtonClick(Sender: TObject);
    procedure ovCE_DepCodigoButtonClick(Sender: TObject);
    procedure ovCE_CliCodigoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

//******************************************************************************
procedure TovFra_Dependentes.ovCE_CliCodigoButtonClick(Sender: TObject);
begin
  try
    if ovF_PsqPessoas = nil then
      ovF_PsqPessoas := TovF_PsqPessoas.Create(Self);
    if ovF_PsqPessoas.ShowModal = mrOK then
    begin
      ovCE_CliCodigo.Text := ovF_PsqPessoas.oCDS_Pesquisa.FieldByname('Cli_Codigo').AsString;
      ovP_CliDescricao.Caption := ovF_PsqPessoas.oCDS_Pesquisa.FieldByname('Pes_Nome').AsString;
    end else
    begin
      ovCE_CliCodigo.Text := '0';
      ovP_CliDescricao.Caption := '';
    end;
  finally
    FreeAndNil(ovF_PsqPessoas);
    Abort;
  end;
end;

//******************************************************************************
procedure TovFra_Dependentes.ovCE_DepCodigoButtonClick(Sender: TObject);
begin
  try
  finally
    Abort;
  end;
end;

//******************************************************************************
procedure TovFra_Dependentes.ovCE_CliCodigoExit(Sender: TObject);
begin
  try
    if ovF_PsqPessoas = nil then
      ovF_PsqPessoas := TovF_PsqPessoas.Create(Self);
    if ovF_PsqPessoas.fConsulta([ovCE_CliCodigo.Text]) then
    begin
      ovCE_CliCodigo.Text := ovF_PsqPessoas.oCDS_Pesquisa.FieldByname('Cli_Codigo').AsString;
      ovP_CliDescricao.Caption := ovF_PsqPessoas.oCDS_Pesquisa.FieldByname('Pes_Nome').AsString;
    end else
    begin
      ovCE_CliCodigo.Text := '0';
      ovP_CliDescricao.Caption := '';
    end;
  finally
    FreeAndNil(ovF_PsqPessoas);
  end;
end;

//******************************************************************************
end.
