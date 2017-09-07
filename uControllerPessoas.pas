unit uControllerPessoas;

interface

uses
  SysUtils, Classes, DB, DBClient;

type
  TControllerPessoas = class(TDataModule)
    oCDS_Pessoa: TClientDataSet;
    oCDS_PessoaCodigo: TIntegerField;
    oCDS_PessoaNome: TStringField;
    oCDS_PessoaCPFCNPJ: TStringField;
    oCDS_PessoaDDDCel: TIntegerField;
    oCDS_PessoaCelular: TIntegerField;
    oCDS_PessoaDDDFone: TIntegerField;
    oCDS_PessoaFone: TIntegerField;
    oCDS_PessoaDataNascimento: TDateField;
    oCDS_PessoaNumEndereco: TStringField;
    oCDS_PessoaEndereco: TStringField;
  private
    { Private declarations }
  protected

  public


  end;

var
  ControllerPessoas: TControllerPessoas;

implementation

{$R *.dfm}

{ TControllerPessoas }







end.
