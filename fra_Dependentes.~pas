unit fra_Dependentes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, CurrEdit, ExtCtrls, fPsqPessoas,fPsqDependentes;

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
    procedure ovCE_DepCodigoExit(Sender: TObject);
  private
    { Private declarations }
  public
    procedure p_Limpar;
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
    if ovF_PsqDependentes = nil then
      ovF_PsqDependentes := TovF_PsqDependentes.Create(Self);

    {if ovCE_CliCodigo.Text <> '' then
      ovF_PsqDependentes.vsFILTER := ' AND Cli_Codigo = '+ovCE_CliCodigo.Text;}
    if ovF_PsqDependentes.ShowModal = mrOK then
    begin
      ovCE_CliCodigo.Text := ovF_PsqDependentes.oCDS_Pesquisa.FieldByname('Cli_Codigo').AsString;
      ovCE_DepCodigo.Text := ovF_PsqDependentes.oCDS_Pesquisa.FieldByname('Dep_Codigo').AsString;
      ovP_CliDescricao.Caption := ovF_PsqDependentes.oCDS_Pesquisa.FieldByname('Responsavel').AsString;
      ovP_DepDescricao.Caption := ovF_PsqDependentes.oCDS_Pesquisa.FieldByname('Dependente').AsString;
    end else
    begin
      ovCE_CliCodigo.Text := '0';
      ovCE_DepCodigo.Text := '0';
      ovP_CliDescricao.Caption := '';
      ovP_DepDescricao.Caption := '';
    end;
  finally
    FreeAndNil(ovF_PsqDependentes);
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
procedure TovFra_Dependentes.ovCE_DepCodigoExit(Sender: TObject);
begin
  try
    if ovF_PsqDependentes = nil then
      ovF_PsqDependentes := TovF_PsqDependentes.Create(Self);
    if ovF_PsqDependentes.fConsulta([ovCE_CliCodigo.Text, ovCE_DepCodigo.Text]) then
    begin
      ovCE_CliCodigo.Text := ovF_PsqDependentes.oCDS_Pesquisa.FieldByname('Cli_Codigo').AsString;
      ovCE_DepCodigo.Text := ovF_PsqDependentes.oCDS_Pesquisa.FieldByname('Dep_Codigo').AsString;
      ovP_CliDescricao.Caption := ovF_PsqDependentes.oCDS_Pesquisa.FieldByname('Responsavel').AsString;
      ovP_DepDescricao.Caption := ovF_PsqDependentes.oCDS_Pesquisa.FieldByname('Dependente').AsString;
    end else
    begin
      ovCE_CliCodigo.Text := '0';
      ovCE_DepCodigo.Text := '0';
      ovP_CliDescricao.Caption := '';
      ovP_DepDescricao.Caption := '';
    end;
  finally
    FreeAndNil(ovF_PsqDependentes);
  end;
end;

//******************************************************************************
procedure TovFra_Dependentes.p_Limpar;
begin
  ovCE_CliCodigo.Clear;
  ovP_CliDescricao.Caption := '';
  ovCE_DepCodigo.Clear;
  ovP_DepDescricao.Caption := '';
end;

//******************************************************************************
end.
