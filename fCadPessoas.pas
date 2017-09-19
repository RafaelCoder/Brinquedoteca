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
    ovB_DepAdicionar: TButton;
    ovB_DepRemover: TButton;
    oCDS_DependentesPes_Nome: TStringField;
    oCDS_DependentesPes_DataNascimento: TDateField;
    oCDS_DependentesDep_Codigo: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ovB_PesquisarClick(Sender: TObject);
    procedure ovCE_CodigoExit(Sender: TObject);
    procedure ovB_DepAdicionarClick(Sender: TObject);
    procedure ovB_DepRemoverClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    vbEditando : Boolean;
    oCDS : TClientDataSet;
  protected
    function fValidaCampos:Boolean; override;
    procedure pGravar; override;
    procedure pNovo; override;
    procedure pLimparCampos; override;
    procedure pCarregaDados; override;
    procedure pExcluir; override;
    procedure pLimpaCamposDep;
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
  oCDS := TClientDataSet.Create(Self);
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

  if fExtraisNumeros(ovME_CPF.Text) = '' then
  begin
    p_MsgAviso('CPF é obrigatório.');
    ovPC_Container.TabIndex := 0;
    ovME_CPF.SetFocus;
    Result := false;
    Exit;
  end;

  if not vbEditando then
  begin
    vsSQL := ' SELECT Pes_Codigo FROM Pessoas WHERE Pes_CPFCNPJ = '+f_StrToSQL(ovME_CPF.Text);
    ExecSQL(vsSQL, oCDS);
    if not oCDS.IsEmpty then
    begin
      p_MsgAviso('Já existe um cliente cadastrado com este CPF');
      Result := false;
      exit;
    end;
  end;
end;

//******************************************************************************
procedure TovF_CadPessoas.pCarregaDados;
begin
  vbEditando := True;
  ovCE_Codigo.Text    := ovF_PsqPessoas1.oCDS_Pesquisa.FieldByname('Cli_Codigo').AsString;
  ovE_Nome.Text       := ovF_PsqPessoas1.oCDS_Pesquisa.FieldByname('Pes_Nome').AsString;
  ovCE_DDDFone.Text   := ovF_PsqPessoas1.oCDS_Pesquisa.FieldByname('Pes_DDDFone').AsString;
  ovCE_Fone.Text      := ovF_PsqPessoas1.oCDS_Pesquisa.FieldByname('Pes_Fone').AsString;
  ovCE_DDDCel.Text    := ovF_PsqPessoas1.oCDS_Pesquisa.FieldByname('Pes_DDDCel').AsString;
  ovCE_Celular.Text   := ovF_PsqPessoas1.oCDS_Pesquisa.FieldByname('Pes_Celular').AsString;
  ovME_CPF.Text       := ovF_PsqPessoas1.oCDS_Pesquisa.FieldByname('Pes_CPFCNPJ').AsString;
  ExecSQL(' SELECT D.Dep_Codigo, P.Pes_Nome, P.Pes_DataNascimento'+
          ' FROM Dependentes D'+
          ' INNER JOIN Pessoas P ON P.Pes_Codigo = D.Pes_Codigo'+
          ' WHERE D.Cli_Codigo = '+ovF_PsqPessoas1.oCDS_Pesquisa.FieldByname('Cli_Codigo').AsString, oCDS);
  oCDS_Dependentes.EmptyDataSet;
  oCDS.First;
  while not oCDS.EOF do
  begin
    oCDS_Dependentes.Append;
    oCDS_DependentesDep_Codigo.AsString := oCDS.FieldByName('Dep_Codigo').AsString;
    oCDS_DependentesPes_Nome.AsString   := oCDS.FieldByname('Pes_Nome').AsString;
    oCDS_DependentesPes_DataNascimento.AsDateTime := oCDS.FieldByName('Pes_DataNascimento').AsDateTime;
    oCDS_Dependentes.Post;
    oCDS.Next;
  end;
end;

//******************************************************************************
procedure TovF_CadPessoas.pExcluir;
begin
  if ovCE_Codigo.Value <= 0 then
    Exit;
  try
    DBBeginTrans;
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
procedure TovF_CadPessoas.pGravar;
var
  vsPesCodigo, vsCliCodigo : string;
begin
  try
    DBBeginTrans;
    vsCliCodigo := ovCE_Codigo.Text;
    if not vbEditando then
    begin
      vsPesCodigo := IntToStr(f_GetProxCodigo('Pessoas', 'Pes_Codigo', ''));
      vsSQL := ' INSERT INTO Pessoas SET Pes_Codigo = '+vsPesCodigo+
               ' , Pes_Nome = '+f_StrToSQL(ovE_Nome.Text)+
               ' , Pes_CPFCNPJ = '+f_StrToSQL(ovME_CPF.Text)+
               ' , Pes_DDDCel = '+f_StrToSQL(ovCE_DDDCel.Text)+
               ' , Pes_Celular = '+f_StrToSQL(ovCE_Celular.Text)+
               ' , Pes_DDDFone = '+f_StrToSQL(ovCE_DDDFone.Text)+
               ' , Pes_Fone = '+f_StrToSQL(ovCE_Fone.Text)+
               ' , Pes_DataNascimento = NULL'+
               ' , Pes_NumEndereco = NULL'+
               ' , Pes_Endereco = NULL';
      ExecSQL(vsSQL);

      vsSQL := ' INSERT INTO Clientes SET Pes_Codigo = '+vsPesCodigo+
               ' , Cli_Codigo = '+vsCliCodigo;
      ExecSQL(vsSQL);
    end else
    begin
      vsSQL := 'SELECT Pes_Codigo FROM Clientes WHERE Cli_Codigo = '+vsCliCodigo;
      ExecSQL(vsSQL, oCDS);
      vsPesCodigo := oCDS.FieldByName('Pes_Codigo').AsString;
      vsSQL := ' UPDATE Pessoas SET Pes_Nome = '+f_StrToSQL(ovE_Nome.Text)+
               ' , Pes_CPFCNPJ = '+f_StrToSQL(ovME_CPF.Text)+
               ' , Pes_DDDCel = '+f_StrToSQL(ovCE_DDDCel.Text)+
               ' , Pes_Celular = '+f_StrToSQL(ovCE_Celular.Text)+
               ' , Pes_DDDFone = '+f_StrToSQL(ovCE_DDDFone.Text)+
               ' , Pes_Fone = '+f_StrToSQL(ovCE_Fone.Text)+
               ' , Pes_DataNascimento = NULL'+
               ' , Pes_NumEndereco = NULL'+
               ' , Pes_Endereco = NULL'+
               ' WHERE Pes_Codigo = '+vsPesCodigo;
      ExecSQL(vsSQL);
    end;

    //dependentes
    oCDS_Dependentes.First;
    if not oCDS_Dependentes.IsEmpty then
    begin
      while not oCDS_Dependentes.Eof do
      begin
        vsSQL := ' SELECT Pes_Codigo FROM Dependentes WHERE Cli_Codigo = '+vsCliCodigo+
                 ' AND Dep_Codigo = '+oCDS_DependentesDep_Codigo.AsString;
        ExecSQL(vsSQL, oCDS);
        if oCDS.IsEmpty then
        begin
          vsPesCodigo := IntToStr(f_GetProxCodigo('Pessoas', 'Pes_Codigo', ''));
          vsSQL := ' INSERT INTO Pessoas SET Pes_Codigo = '+vsPesCodigo+
                 ' , Pes_Nome = '+f_StrToSQL(oCDS_DependentesPes_Nome.AsString)+
                 ' , Pes_DataNascimento = '+f_DateToSQL(oCDS_DependentesPes_DataNascimento.AsDateTime);
          ExecSQL(vsSQL);
          vsSQL := ' INSERT INTO Dependentes SET Dep_Codigo = '+oCDS_DependentesDep_Codigo.AsString+
                   ' , Pes_Codigo = '+vsPesCodigo+
                   ' , Cli_Codigo = '+vsCliCodigo;
          ExecSQL(vsSQL);
        end else
        begin
          vsPesCodigo := oCDS.FieldByName('Pes_Codigo').AsString;
          vsSQL := ' UPDATE Pessoas SET Pes_Nome = '+f_StrToSQL(oCDS_DependentesPes_Nome.AsString)+
                 ' , Pes_DataNascimento = '+f_DateToSQL(oCDS_DependentesPes_DataNascimento.AsDateTime)+
                 ' WHERE Pes_Codigo = '+vsPesCodigo;
          ExecSQL(vsSQL);
        end;
        oCDS_Dependentes.Next;
      end;
    end;
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
  pLimpaCamposDep;
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
procedure TovF_CadPessoas.ovCE_CodigoExit(Sender: TObject);
begin
  inherited;
  if ovF_PsqPessoas1.fConsulta([ovCE_Codigo.Text]) then
    pCarregaDados
  else
    pLimparCampos;
end;

//******************************************************************************
procedure TovF_CadPessoas.ovB_DepAdicionarClick(Sender: TObject);
begin
  inherited;
  if ovE_DepNome.Text = '' then
  begin
    p_MsgAviso('Informar nome do dependente.');
    ovE_DepNome.SetFocus;
    exit;
  end;

  if ovDE_DepDataNascimento.Date = 0 then
  begin
    p_MsgAviso('Informar data de nascimento do dependente.');
    ovDE_DepDataNascimento.SetFocus;
    exit;
  end;

  if not oCDS_Dependentes.Locate('Dep_Codigo', ovCE_DepCodigo.Value, []) then
    oCDS_Dependentes.Append
  else
    oCDS_Dependentes.Edit;
    
  if ovCE_DepCodigo.Value > 0 then
    oCDS_DependentesDep_Codigo.AsInteger := StrToInt(ovCE_DepCodigo.Text)
  else
    oCDS_DependentesDep_Codigo.AsInteger := oCDS_Dependentes.RecordCount+1;
  oCDS_DependentesPes_Nome.AsString := ovE_DepNome.Text;
  oCDS_DependentesPes_DataNascimento.AsDateTime := ovDE_DepDataNascimento.Date;
  oCDS_Dependentes.Post;
  pLimpaCamposDep;
end;

//******************************************************************************
procedure TovF_CadPessoas.ovB_DepRemoverClick(Sender: TObject);
begin
  if not oCDS_Dependentes.RecNo <= 0 then
    Exit;

  vsSQL := ' SELECT * FROM Dependentes WHERE Cli_Codigo = '+ovCE_Codigo.Text+
           ' AND Dep_Codigo = '+oCDS_DependentesDep_Codigo.AsString;
  ExecSQL(vsSQL, oCDS);
  if not oCDS.IsEmpty then
  begin
    p_MsgAviso('Não é possível excluir este dependente'); // pois já está sendo utilizado em lançamentos.');
    exit;
  end;
  if f_MsgConfirma('Deseja remover o registro selecionado?') then
    oCDS_Dependentes.Delete;
end;

//******************************************************************************
procedure TovF_CadPessoas.pLimpaCamposDep;
begin
  ovCE_DepCodigo.Value := oCDS_Dependentes.RecordCount + 1;
  ovE_DepNome.Clear;
  ovDE_DepDataNascimento.Clear;
end;

//******************************************************************************
procedure TovF_CadPessoas.DBGrid1DblClick(Sender: TObject);
begin
  if oCDS_Dependentes.IsEmpty then
    Exit;
  ovCE_DepCodigo.Text := oCDS_DependentesDep_Codigo.AsString;
  ovE_DepNome.Text := oCDS_DependentesPes_Nome.AsString;
  ovDE_DepDataNascimento.Date := oCDS_DependentesPes_DataNascimento.AsDateTime;
  ovE_DepNome.SetFocus;
end;

//******************************************************************************
procedure TovF_CadPessoas.FormDestroy(Sender: TObject);
begin
  FreeAndNil(oCDS);
end;

//******************************************************************************
end.
