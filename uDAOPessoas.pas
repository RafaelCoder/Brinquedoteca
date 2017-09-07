unit uDAOPessoas;

interface

uses
  SysUtils, Classes, dmMySQL, DB, DBClient;

type
  TDAOPessoas = class(TDataModule)
    oCDS: TClientDataSet;
  private
    { Private declarations }
  public
    function fGetProxCodigo:Integer;
  end;

var
  DAOPessoas: TDAOPessoas;

implementation

{$R *.dfm}

{ TDAOPessoas }

//******************************************************************************
function TDAOPessoas.fGetProxCodigo: Integer;
begin
  Result := f_GetProxCodigo('Pessoas', 'Pes_Codigo', '');
end;

//******************************************************************************
end.
